local name, ns = ...
ns.data = {}

local DIFFICULTY_MYTHIC_PLUS = 8

--- @class MythicPlusPull: AceAddon, AceConsole-3.0, NumyAceEvent-3.0
local MPP = LibStub('AceAddon-3.0'):NewAddon(name, 'AceConsole-3.0', 'NumyAceEvent-3.0');

local L = LibStub('AceLocale-3.0'):GetLocale(name)
local LibGetFrame = LibStub('LibGetFrame-1.0');

--@debug@
_G.MythicPlusPull = MPP;
if not _G.MPP then _G.MPP = MPP; end
--@end-debug@

local nameplateAccessor = function(unit)
    return LibGetFrame.GetUnitNameplate(unit);
end
do
    local defaultAccessor = nameplateAccessor
    local nameplateAddons = {
        {
            addonName = 'TidyPlates',
            nameplateAccessor = function(unit)
                local plate = defaultAccessor(unit);

                return plate and plate.extended or plate;
            end,
        },
    };
    for _, info in ipairs(nameplateAddons) do
        if C_AddOns.IsAddOnLoaded(info.addonName) then
            nameplateAccessor = info.nameplateAccessor;

            break;
        end
    end
end

ns.addon = MPP
MPP.ns = ns

MPP.loaded = false
MPP.previousQuantity = 0
--- @type table<string, FontString>
MPP.activeNameplates = {}

MPP.warnings = {}

local function GetAbsoluteFramePosition(frame)
    return {
        ["anchorPoint"] = "TOPLEFT",
        ["relativeFrame"] = "UIParent",
        ["relativePoint"] = "BOTTOMLEFT",
        ["offX"] = frame:GetLeft(),
        ["offY"] = frame:GetTop(),
    }
end

local function SetFramePoint(frame, pointInfo)
    frame:ClearAllPoints()
    frame:SetPoint(
        pointInfo.anchorPoint,
        pointInfo.relativeFrame,
        pointInfo.relativePoint,
        pointInfo.offX,
        pointInfo.offY
    );
end

function MPP:OnInitialize()
    MMPEDB = MMPEDB or {}
    self.DB = MMPEDB

    local function init()
        return UIParent:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    end
    local function reset(_, obj)
        if not obj then return end
        obj:ClearAllPoints()
        obj:SetText("")
        obj:Hide()
    end
    self.fontStringPool = CreateObjectPool(init, reset) --[[@as ObjectPool<FontString>]]

    self:RegisterEvent("NAME_PLATE_UNIT_ADDED", function(_, unit) self:OnAddNameplate(unit) end)
    self:RegisterEvent("NAME_PLATE_UNIT_REMOVED", function(_, unit) self:RemoveNameplateText(unit) end)

    C_Timer.NewTicker(0.2, function() self:DoUpdate() end)

    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, function(tooltip) self:OnUnitTooltip(tooltip) end)

    self:VerifyDB()
    self:CreatePullFrame()

    self:InitConfig()

    local openConfig = function() self:OpenConfig() end
    self:RegisterChatCommand('mythicplusprogress', openConfig);
    self:RegisterChatCommand('mythicpluspull', openConfig);
    self:RegisterChatCommand('mypp', openConfig);
    self:RegisterChatCommand('mpp', openConfig);
    self:RegisterChatCommand('mppre', openConfig);
    self:RegisterChatCommand('mppe', openConfig);

    self.loaded = true

    if NumyProfiler then
        NumyProfiler:WrapModules('MythicPlusPull', 'Core', self);
    end
end

function MPP:DoUpdate()
    if not self:IsMythicPlus() then
        self.currentPullFrame:Hide()

        return
    end
    self:UpdateCurrentPullEstimate()
    self:UpdateNameplateValues()
    self:UpdateNameplates()
end

function MPP:HasWarned(message)
    for _, warning in pairs(self.warnings) do
        if warning == message then
            return true
        end
    end

    return false
end

function MPP:PrintWarning(message)
    if not self:HasWarned(message) then
        self:Print(message)
        table.insert(self.warnings, message)

        return true
    end

    return false
end

function MPP:VerifySettings(overwriteWithDefault)
    for setting, value in pairs(self.defaultSettings) do
        if self.DB.settings[setting] == nil or overwriteWithDefault then
            self.DB.settings[setting] = value
        end
    end
    if string.len(self.DB.settings["nameplateTextColor"]) == 6 then
        -- alpha got added in a later version
        self.DB.settings["nameplateTextColor"] = "FF" .. self.DB.settings["nameplateTextColor"]
    end
    self.DB.settings["offsetx"] = tonumber(self.DB.settings["offsetx"])
    self.DB.settings["offsety"] = tonumber(self.DB.settings["offsety"])
end

function MPP:VerifyDB()
    if not self.DB or not self.DB.settings then
        self:Print(L["Running first time setup. This should only happen once. Enjoy! ;)"])
        wipe(MMPEDB)
        self.DB = MMPEDB
        self.DB.settings = {}
    end
    self:VerifySettings()
end

function MPP:IsValidTarget(unit)
    return UnitCanAttack("player", unit)
end

--- @return number numberOfSteps
function MPP:GetNumberOfScenarioSteps()
    return select(3, C_Scenario.GetStepInfo()) or 0
end

function MPP:IsDungeonFinished()
    return self:GetNumberOfScenarioSteps() < 1
end

function MPP:IsMythicPlus()
    local difficulty = select(3, GetInstanceInfo()) or -1

    return difficulty == DIFFICULTY_MYTHIC_PLUS and not self:IsDungeonFinished()
end

--- @return ScenarioCriteriaInfo? criteriaInfo
function MPP:GetProgressCriteriaInfo()
    if not self:IsMythicPlus() then return nil end
    local numSteps = self:GetNumberOfScenarioSteps()
    if numSteps > 0 then
        local info = C_ScenarioInfo.GetCriteriaInfo(numSteps)

        return info.isWeightedProgress and info or nil
    end
end

function MPP:GetTotalCountRequired()
    local info = self:GetProgressCriteriaInfo()
    if info then
        return info.totalQuantity
    end

    return 0
end

function MPP:GetCurrentCount()
    local info = self:GetProgressCriteriaInfo()
    if info and info.quantityString then
        return tonumber((info.quantityString:gsub('%%', '')))
    end

    return 0
end

--- @param unit UnitToken
--- @return number? count
--- @return number? countPercent
--- @return string? countPercentString
function MPP:GetUnitCount(unit)
    return nil, nil, '?%'
    -- return C_Pony.GetCountByUnit(unit) -- @todo: update once new API is documented
end

---
--- TOOLTIPS
---
--- @param unit UnitToken
function MPP:ShouldAddToTooltip(unit)
    return self.loaded and self:GetSetting("enabled") and self:GetSetting("enableTooltip") and self:IsMythicPlus() and self:IsValidTarget(unit)
end

--- @param unit UnitToken
function MPP:GetTooltipMessage(unit)
    local message = "|cFF" .. self:GetSetting("tooltipColor") .. L["M+Progress:"] .. " "
    local count, _, countPercentString = self:GetUnitCount(unit)
    if not countPercentString then
        return message .. L["No Progress."]
    end
    local requiredCount = self:GetTotalCountRequired()
    if self:GetSetting('includeCountInTooltip') then
        message = string.format("%s%.2f %i/%i", message, countPercentString, count, requiredCount)
    else
        message = string.format("%s%.2f", message, countPercentString)
    end

    return message
end

--- @param tooltip GameTooltip
function MPP:OnUnitTooltip(tooltip)
    --- @type UnitToken?
    local unit = select(2, TooltipUtil.GetDisplayedUnit(tooltip)) -- @todo: if needed, can hardcode to "mouseover"
    if not unit or not self:ShouldAddToTooltip(unit) then return end

    local tooltipMessage = self:GetTooltipMessage(unit)
    if tooltipMessage then
        tooltip:AddLine(tooltipMessage)
        tooltip:Show()
    end
end

---
--- SHITTY CURRENT PULL FRAME
---
function MPP:CreatePullFrame()
    self.currentPullFrame = CreateFrame("frame", nil, UIParent)
    SetFramePoint(self.currentPullFrame, self.DB.settings.pullFramePoint)
    self.currentPullFrame:EnableMouse(not self:GetSetting("lockPullFrame"))
    self.currentPullFrame:SetMovable(true)
    self.currentPullFrame:RegisterForDrag("LeftButton")
    self.currentPullFrame:SetScript("OnDragStart", function(frame)
        if self.DB.settings.lockPullFrame then return end
        frame:StartMoving()
    end)
    self.currentPullFrame:SetScript("OnDragStop", function(frame)
        frame:StopMovingOrSizing()
        self.DB.settings.pullFramePoint = GetAbsoluteFramePosition(frame)
    end)
    self.currentPullFrame:SetWidth(50)
    self.currentPullFrame:SetHeight(50)
    self.currentPullFrame:SetScale(self:GetSetting("pullFrameTextScale"))

    self.currentPullString = self.currentPullFrame:CreateFontString(nil, "BACKGROUND", "GameFontHighlightLarge")
    self.currentPullString:SetPoint("CENTER");
    self.currentPullString:SetText("")
end

---
--- NAMEPLATES
---
--- @return number currentPullCount # @todo: might be nil?
--- @return number currentPullPercent
--- @return string currentPullPercentString
--- @return number estimatedCount # @todo: might be nil?
--- @return number estimatedPercent
--- @return string estimatedPercentString
function MPP:GetCurrentPullCount()
    return 0, 0, '?%', 0, 0, '?%'
    --return C_Pony.GetCurrentPullCount() -- @todo: update once new API is documented
end

--- @return boolean shouldShow
--- @return boolean hideIfNoCount
function MPP:ShouldShowCurrentPullEstimate()
    if self:GetSetting("enabled") and self:GetSetting("enablePullEstimate") and self:IsMythicPlus() and not self:IsDungeonFinished() then
        return true, self:GetSetting("pullEstimateCombatOnly")
    end

    return false, false
end

function MPP:SetCurrentPullEstimateLabel(s)
    self.currentPullString:SetText(s)
    self.currentPullFrame:SetWidth(self.currentPullString:GetStringWidth())
    self.currentPullFrame:SetHeight(self.currentPullString:GetStringHeight())
end

--- Secret safe placeholder replacer
--- @param formatString string
--- @param replacements table<string, string> # values are allowed to contain secrets
--- @return string # likely a secret string
function MPP:ReplacePlaceholders(formatString, replacements)
    local placeholderOrder = {}
    for x in string.gmatch(formatString, "%%%$[^%$]+%%%$") do
        table.insert(placeholderOrder, x)
    end
    formatString = string.gsub(formatString, "%%%$[^%$]+%%%$", "%%s")
    local replacementValues = {}
    for _, placeholder in ipairs(placeholderOrder) do
        table.insert(replacementValues, replacements[placeholder] or placeholder)
    end

    return formatString:format(unpack(replacementValues))
end

function MPP:UpdateCurrentPullEstimate()
    local pullCount, _, pullPercentString, estimatedCount, _, estimatedPercentString = self:GetCurrentPullCount()
    local shouldShow, hideIfNoCount = self:ShouldShowCurrentPullEstimate()
    if not shouldShow or (hideIfNoCount and not pullCount) then
        self.currentPullFrame:Hide()

        return
    end
    self.currentPullFrame:SetAlpha(1)
    if hideIfNoCount then
        self.currentPullFrame:SetAlpha(pullCount)
    end

    self.currentPullFrame:Show()
    local requiredCount = self:GetTotalCountRequired()
    local currentCount = self:GetCurrentCount()

    local formatString = self:GetSetting('pullFrameTextFormat'); --[[@as string]]
    local percentString = '%.2f%%%%';
    local placeholderReplacements = {
        ['%$current%$'] = currentCount,
        ['%$pull%$'] = pullCount,
        ['%$estimated%$'] = estimatedCount,
        ['%$required%$'] = requiredCount,
        ['%$current%%%$'] = percentString:format((currentCount / requiredCount) * 100),
        ['%$pull%%%$'] = pullPercentString,
        ['%$estimated%%%$'] = estimatedPercentString,
        ['%$required%%%$'] = percentString:format(100),
    };
    local message = self:ReplacePlaceholders(formatString, placeholderReplacements)

    self:SetCurrentPullEstimateLabel(message)
end

function MPP:CreateNameplateText(unit)
    if self.activeNameplates[unit] then -- This should never happen
        self:RemoveNameplateText(unit)
    end
    --- @type Frame?
    local nameplate = nameplateAccessor(unit)
    if nameplate then
        if not nameplate:IsVisible() then
            nameplate = C_NamePlate.GetNamePlateForUnit(unit)
        end
        self.activeNameplates[unit] = self.fontStringPool:Acquire()
        self.activeNameplates[unit]:SetParent(nameplate)
        self.activeNameplates[unit]:SetText("+?%")
        self.activeNameplates[unit]:SetScale(self:GetSetting('nameplateTextScale'))
    end
end

function MPP:RemoveNameplateText(unit)
    if self.activeNameplates[unit] ~= nil then
        self.fontStringPool:Release(self.activeNameplates[unit])
        self.activeNameplates[unit] = nil
    end
end

function MPP:UpdateNameplateValue(unit)
    local count, _, countPercentString = self:GetUnitCount(unit)
    if count then
        local message = "|c" .. self:GetSetting("nameplateTextColor")
        local placeholderReplacements = {
            ['%$percent%$'] = countPercentString,
            ['%$count%$'] = count,
        };
        local formatString = self:GetSetting("nameplateTextFormat") --[[@as string]]
        message = message .. self:ReplacePlaceholders(formatString, placeholderReplacements)

        self.activeNameplates[unit]:SetText(message)
        self.activeNameplates[unit]:Show()

        return true
    end
    if self.activeNameplates[unit] then -- If mob dies, a new nameplate is created but not shown, and this ui widget will then not exist.
        self.activeNameplates[unit]:SetText("")
        self.activeNameplates[unit]:Hide()
    end

    return false
end

function MPP:UpdateNameplateValues()
    for unit, _ in pairs(self.activeNameplates) do
        self:UpdateNameplateValue(unit)
    end
end

function MPP:UpdateNameplatePosition(unit)
    local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
    if nameplate and nameplate.UnitFrame and nameplate.UnitFrame.unitExists and self.activeNameplates[unit] ~= nil then
        local offsetx = self:GetSetting('offsetx')
        local offsety = self:GetSetting('offsety')
        self.activeNameplates[unit]:SetPoint("LEFT", self.activeNameplates[unit]:GetParent(), "RIGHT", offsetx, offsety)
    else
        self:RemoveNameplateText(unit)
    end
end

function MPP:ShouldShowNameplateTexts()
    return self:GetSetting("enabled") and self:GetSetting("enableNameplateText") and self:IsMythicPlus() and not self:IsDungeonFinished()
end

function MPP:OnAddNameplate(unit)
    if self:ShouldShowNameplateTexts() then
        RunNextFrame(function() -- allow nameplate addons to create their frames first
            self:CreateNameplateText(unit)
            self:UpdateNameplateValue(unit)
            self:UpdateNameplatePosition(unit)
        end)
    end
end

function MPP:UpdateNameplates()
    local shouldShow = self:ShouldShowNameplateTexts()
    for unit, _ in pairs(CopyTable(self.activeNameplates)) do
        if shouldShow then
            self:UpdateNameplatePosition(unit)
        else
            self:RemoveNameplateText(unit)
        end
    end
end
