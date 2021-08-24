-- upvalue the globals
local _G = getfenv(0)
local LibStub = _G.LibStub
local GetAddOnMetadata = _G.GetAddOnMetadata
local pairs = _G.pairs
local GetTime = _G.GetTime
local select = _G.select
local strsplit = _G.strsplit
local strtrim = _G.strtrim
local string = _G.string
local math = _G.math
local table = _G.table
local tonumber = _G.tonumber
local UnitCanAttack = _G.UnitCanAttack
local UnitIsDead = _G.UnitIsDead
local C_Scenario = _G.C_Scenario
local GetInstanceInfo = _G.GetInstanceInfo
local CreateFrame = _G.CreateFrame
local UnitGUID = _G.UnitGUID
local UIParent = _G.UIParent
local unpack = _G.unpack
local foreach = _G.foreach
local GameTooltip = _G.GameTooltip
local UnitThreatSituation = _G.UnitThreatSituation
local UnitPlayerControlled = _G.UnitPlayerControlled
local UnitAffectingCombat = _G.UnitAffectingCombat
local C_NamePlate = _G.C_NamePlate

local name = ...

MMPEDB = MMPEDB or {}

local MMPE = LibStub('AceAddon-3.0'):NewAddon(name, 'AceConsole-3.0', 'AceHook-3.0', 'AceEvent-3.0');
if not MMPE then return end

MMPE.loaded = false
MMPE.quantity = 0
MMPE.previousQuantity = 0
MMPE.lastKill = { 0} -- To be populated later, do not remove the initial value. The zero means inconclusive/invalid data.
MMPE.currentPullUpdateTimer = 0
MMPE.activeNameplates = {}

MMPE.simulationActive = false
MMPE.simulationMax = 220
MMPE.simulationCurrent = 28

MMPE.version = GetAddOnMetadata(name, "Version") or ""
MMPE.defaultSettings = {
    enabled = true,

    inconclusiveDataThreshold = 100, -- Mobs killed within this span of time (in milliseconds) will not be processed since we might not get the criteria update fast enough to know which mob gave what progress. Well, that's the theory anyway.
    maxTimeSinceKill = 600, -- Lag tolerance between a mob dying and the progress criteria updating, in milliseconds.

    enableTooltip = true,
    tooltipColor = "82E0FF",

    enablePullEstimate = true,
    pullEstimateCombatOnly = false,

    nameplateUpdateRate = 200, -- Rate (in milliseconds) at which we update the progress we get from the current pull, as estimated by active name plates you're in combat with. Also the update rate of getting new values for nameplate text overlay if enabled.

    offsetx = 0, -- extra offset for nameplate text
    offsety = 0,

    enableNameplateText = true,
    nameplateTextColor = "FFFFFF",
}

MMPE.warnings = {}


--
-- GENERAL ADDON UTILITY
-- And by "utility" I mostly mean creating a bunch of shit that should really be built-in.

local function split(str)
    a = {}
    for s in string.gmatch(str, "%S+") do
        table.insert(a, s)
    end
    return a
end

local function round(number, decimals)
    return (("%%.%df"):format(decimals)):format(number)
end

local function GetTimeInSeconds()
    return GetTime() * 1000
end

function MMPE:DebugPrint(...)
    if self.mppDebug then
        self:Print(...)
    end
end

function MMPE:HasWarned(message)
    for _,warning in pairs(self.warnings) do
        if warning == message then
            return true
        end
    end
    return false
end

function MMPE:PrintWarning(message)
    if not self:HasWarned(message) then
        self:Print(message)
        table.insert(self.warnings, message)
        return true
    end
    return false
end

function MMPE:GetSetting(setting)
    if (not setting or self.DB.settings[setting] == nil) then
        self:PrintWarning("MPP attempted to get missing setting: " .. setting or "nil")
        return
    end
    return self.DB.settings[setting]
end

function MMPE:SetSetting(setting, value)
    if (not setting or self.DB.settings[setting] == nil) then
        MMPE:PrintWarning("MPP attempted to set missing setting: " .. setting or "nil")
        return
    end
    self.DB.settings[setting] = value
    return value
end

function MMPE:ToggleSetting(setting)
    return self:SetSetting(setting, not self:GetSetting(setting))
end

--
-- WOW GENERAL WRAPPERS/EZUTILITIES
--

function MMPE:GetNPCID(guid)
    if guid == nil then
        return nil
    end
    local targetType, _,_,_,_, npcID = strsplit("-", guid)
    if targetType == "Creature" or targetType == "Vehicle" and npcID then
        return tonumber(npcID)
    end
end

function MMPE:IsValidTarget(unit)
    if UnitCanAttack("player", unit) and not UnitIsDead(unit) then
        return true
    end
end

function MMPE:GetSteps()
    return select(3, C_Scenario.GetStepInfo())
end

function MMPE:IsDungeonFinished()
    if self.simulationActive then return false end
    return (self:GetSteps() and self:GetSteps() < 1)
end

function MMPE:IsMythicPlus()
    if self.simulationActive then return true end
    local difficulty = select(3, GetInstanceInfo()) or -1
    if difficulty == 8 and not self:IsDungeonFinished() then
        return true
    else
        return false
    end
end

function MMPE:GetProgressInfo()
    if self:IsMythicPlus() then
        local numSteps = select(3, C_Scenario.GetStepInfo())
        if numSteps and numSteps > 0 then
            local info = {C_Scenario.GetCriteriaInfo(numSteps)}
            if info[13] == true then -- if isWeightedProgress
                return info
            end
        end
    end
end

function MMPE:GetMaxQuantity()
    if self.simulationActive then return self.simulationMax end
    local info = self:GetProgressInfo()
    if info then
        return info[5]
    end
end

function MMPE:GetCurrentQuantity()
    if self.simulationActive then return self.simulationCurrent end
    local info = self:GetProgressInfo()
    if info then
        return strtrim(info[8], "%")
    end
end

function MMPE:GetEnemyForcesProgress()
    self:DebugPrint("getEnemyForcesProgress called.")
    -- Returns exact float value of current enemies killed progress (1-100).
    local quantity = self:GetCurrentQuantity() or 0
    local maxQuantity = self:GetMaxQuantity() or 1
    local progress = (quantity / maxQuantity) * 100
    self:DebugPrint(progress)
    return progress
end

--
-- DB READ/WRITES
--

function MMPE:GetValue(npcID)
    self:DebugPrint("GetValue called. Args:", npcID)
    local npcData = self.DB.npcData[npcID]
    if npcData then
        local bestValue, maxOccurrence = nil, -1
        for value, occurrence in pairs(npcData["values"]) do
            if occurrence > maxOccurrence then
                bestValue, maxOccurrence = value, occurrence
            end
        end
        if bestValue ~= nil then
            return bestValue
        end
    end
end

function MMPE:DeleteEntry(npcID)
    local exists = (self.DB.npcData[npcID] ~= nil)
    self.DB.npcData[npcID] = nil
    return exists
end

function MMPE:UpdateValue(npcID, value, npcName)
    if value <= 0 then
        self:DebugPrint("Discarding update for", npcName, "(", npcID, ") due to value being", value)
        return
    end
    local npcData = self.DB.npcData[npcID]
    if not npcData then
        self.DB.npcData[npcID] = {values = {}, name = npcName or "Unknown"}
        npcData = self.DB.npcData[npcID]
    end

    local values = npcData.values
    if values[value] == nil then
        values[value] = 1
    else
        values[value] = values[value] + 1
    end
    for val, occurrence in pairs(values) do
        if val ~= value then
            values[val] = occurrence * 0.75 -- Newer values will quickly overtake old ones
        end
    end
end

function MMPE:ExportData()
    local editBoxText = string.format("Export ver %s - %i mobs: {", self.version, #self.DB.npcData)
    for npcID, npcData in pairs(self.DB.npcData) do
        local value = self:GetValue(npcID)
        local npcName = npcData.name
        editBoxText = editBoxText .. "[".. npcID.."] = {[\"name\"] = \"" .. npcName .. "\", [\"count\"] = " .. value .. "},"
    end
    editBoxText = editBoxText .. "}"
    local editBoxFrame = CreateFrame('EditBox', "MPPExportBox", UIParent, "InputBoxTemplate")
    editBoxFrame:SetSize(200, 100)
    editBoxFrame:SetPoint("CENTER", 0, 150)
    editBoxFrame:SetScript("OnEnterPressed", editBoxFrame.Hide)
    editBoxFrame:SetText(editBoxText)
end

--
-- Light DB wrap
--

function MMPE:GetEstimatedProgress(npcID)
    self:DebugPrint("getEstimatedProgress called. Args:", npcID)
    local npcValue = self:GetValue(npcID)
    local maxQuantity = self:GetMaxQuantity()
    if npcValue and maxQuantity then
        return (npcValue / maxQuantity) * 100
    end
end

--
-- TRIGGERS/HOOKS
--

-- Called when our enemy forces criteria increases, no matter how small the increase (but >0).
function MMPE:OnProgressUpdated(deltaProgress)
    self:DebugPrint("onProgressUpdated called. Args: " .. deltaProgress)
    if self.previousQuantity == self:GetMaxQuantity() then
        return
    end
    local timestamp, npcID, npcName, isDataUseful = unpack(self.lastKill) -- See what the last mob we killed was
    if timestamp and npcID and deltaProgress and isDataUseful then -- Assert that we have some useful data to work with
        local timeSinceKill = GetTimeInSeconds() - timestamp
        self:DebugPrint("timeSinceKill: " .. timestamp .. " Current Time: " .. GetTimeInSeconds() .. "Timestamp of kill: " .. timeSinceKill)
        if timeSinceKill <= self:GetSetting("maxTimeSinceKill") then
            self:DebugPrint(string.format("Gained %f%s. Last mob killed was %s (%i) %fs ago", deltaProgress, "%", npcName, npcID, timeSinceKill/1000))
            self:UpdateValue(npcID, deltaProgress, npcName) -- Looks like we have ourselves a valid entry. Set this in our database/list/whatever.
        else
            self:DebugPrint(string.format("Gained %f%s. Last mob killed was %s (%i) %fs ago (PAST CUTOFF!)", deltaProgress, "%", npcName, npcID, timeSinceKill))
        end
    end
end

-- Called directly by our hook
function MMPE:OnCriteriaUpdate()
    self:DebugPrint("onCriteriaUpdate called")
    if not self.previousQuantity then
        self.previousQuantity = 0
    end
    if not self:IsMythicPlus() or not self.loaded or not self:GetSetting("enabled") then return end
    local newQuantity = self:GetCurrentQuantity()
    local deltaQuantity = newQuantity - self.previousQuantity
    if deltaQuantity > 0 then
        self.previousQuantity = newQuantity
        self:OnProgressUpdated(deltaQuantity)
    end

end

-- Called directly by our hook
function MMPE:OnCombatLogEvent(args)
    local _, combatType, _, _, _, _, _, destGUID, destName, _ = unpack(args)
    if combatType == "PARTY_KILL" then
        if not self:IsMythicPlus() then return end
        local npcID = self:GetNPCID(destGUID)
        if npcID then
            local isDataUseful = true
            local timeSinceLastKill = GetTimeInSeconds() - self.lastKill[1]
            if timeSinceLastKill <= self:GetSetting("inconclusiveDataThreshold") then
                self:DebugPrint("Data not useful: " .. timeSinceLastKill .. " - " .. self.lastKill[1] .. " - " .. GetTimeInSeconds())
                isDataUseful = false
            end
            self.lastKill = { GetTimeInSeconds(), npcID, destName, isDataUseful} -- timestamp is not at all accurate, we use GetTime() instead.
            if self.DB.debug then
                foreach(self.lastKill, function(var) self:DebugPrint(var) end)
            end
        end
    end
end

function MMPE:VerifySettings(overwriteWithDefault)
    for setting, value in pairs(self.defaultSettings) do
        if self.DB.settings[setting] == nil or overwriteWithDefault then
            self.DB.settings[setting] = value
        end
    end
end

function MMPE:VerifyDB(forceWipe)
    if not self.DB or not self.DB.settings or not self.DB.npcData or forceWipe then
        self:Print("Running first time setup. This should only happen once. Enjoy! ;)")
        MMPEDB = {}
        self.DB = MMPEDB
        self.DB.settings = {}
        self.DB.npcData = {}
    end
    self:VerifySettings()
    local defaultValues = MMPE.data:GetNPCData()
    if defaultValues ~= nil then
        for npcId, npcData in pairs(defaultValues) do
            if self:GetValue(npcId) == nil then
                self:UpdateValue(npcId, npcData.count, npcData.name)
            end
        end
    end

end

---
--- TOOLTIPS
---

function MMPE:AddLineToTooltip(tooltip, str)
    tooltip:AddDoubleLine(str)
    tooltip:Show()
end

function MMPE:ShouldAddTooltip(unit)
    if self.loaded and self:GetSetting("enabled") and self:GetSetting("enableTooltip") and self:IsMythicPlus() and self:IsValidTarget(unit) then
        return true
    end
    return false
end

function MMPE:GetTooltipMessage(npcID)
    local message = "|cFF"..self:GetSetting("tooltipColor") .. "M+Progress: "
    local estimatedProgress = self:GetEstimatedProgress(npcID)
    if not estimatedProgress then
        return message .. "No record."
    end
    if estimatedProgress == 0 then
        return message .. "No Progress."
    end
    local mobsLeft = (100 - self:GetEnemyForcesProgress()) / estimatedProgress
    message = string.format("%s%.2f%s (%i left)", message, estimatedProgress, "%", math.ceil(mobsLeft))
    return message
end

function MMPE:OnNPCTooltip(tooltip)
    local unit = select(2, tooltip:GetUnit())
    if unit then
        local guid = UnitGUID(unit)
        local npcID = self:GetNPCID(guid)
        if npcID and self:ShouldAddTooltip(unit) then
            local tooltipMessage = self:GetTooltipMessage(npcID)
            if tooltipMessage then
                self:AddLineToTooltip(tooltip, tooltipMessage)
            end
        end
    end
end

---
--- SHITTY CURRENT PULL FRAME
---

function MMPE:CreatePullFrame()
    self.currentPullFrame = CreateFrame("frame", nil, UIParent)
    self.currentPullFrame:SetPoint("CENTER", UIParent, 400, 300)
    self.currentPullFrame:EnableMouse(true)
    self.currentPullFrame:SetMovable(true)
    self.currentPullFrame:RegisterForDrag("LeftButton")
    self.currentPullFrame:SetScript("OnDragStart", self.currentPullFrame.StartMoving)
    self.currentPullFrame:SetScript("OnDragStop", self.currentPullFrame.StopMovingOrSizing)
    self.currentPullFrame:SetWidth(50)
    self.currentPullFrame:SetHeight(50)

    self.currentPullString = self.currentPullFrame:CreateFontString(nil, "BACKGROUND", "GameFontHighlightLarge")
    self.currentPullString:SetPoint("CENTER");
    self.currentPullString:SetText("MPP String Uninitialized.")
end


---
--- NAMEPLATES
---

function MMPE:IsUnitPulled(unit)
    -- self:DebugPrint("IsUnitPulled with args: " ..target)
    local threat = UnitThreatSituation("player", unit) or -1 -- Is nil if we're not on their aggro table, so make it -1 instead.
    if self:IsValidTarget(unit) and (threat >= 0 or UnitPlayerControlled(unit .. "target")) then
        return true
    end
    return false
end

function MMPE:GetPulledUnits()
    local ret = {}
    for _, nameplate in pairs(C_NamePlate.GetNamePlates()) do
        if nameplate.UnitFrame.unitExists then
            if self:IsUnitPulled(nameplate.UnitFrame.displayedUnit) then
                table.insert(ret, UnitGUID(nameplate.UnitFrame.displayedUnit))
            end
        end
    end
    return ret
end

function MMPE:GetPulledProgress(pulledUnits)
    local estimatedProgress = 0
    for _, guid in pairs(pulledUnits) do
        local npcID = self:GetNPCID(guid)
        if npcID then
            estimatedProgress = estimatedProgress + (self:GetEstimatedProgress(npcID) or 0)
        end
    end
    return estimatedProgress
end

function MMPE:ShouldShowCurrentPullEstimate()
    if self:GetSetting("enabled") and self:GetSetting("enablePullEstimate") and self:IsMythicPlus() and not self:IsDungeonFinished() then
        if self:GetSetting("pullEstimateCombatOnly") and not UnitAffectingCombat("player") then
            return false
        end
        return true
    end
    return false
end

function MMPE:SetCurrentPullEstimateLabel(s)
    self.currentPullString:SetText(s)
    self.currentPullFrame:SetWidth(self.currentPullString:GetStringWidth())
    self.currentPullFrame:SetHeight(self.currentPullString:GetStringHeight())
    --print(self.currentPullFrame:GetCenter())
end

function MMPE:UpdateCurrentPullEstimate()
    if not self:ShouldShowCurrentPullEstimate() then
        self.currentPullFrame:Hide()
        return
    else
        self.currentPullFrame:Show()
    end
    local message
    local pulledUnits = self:GetPulledUnits()
    local estimatedProgress = self:GetPulledProgress(pulledUnits)
    local currentProgress = self:GetEnemyForcesProgress()
    local totalProgress = math.floor((estimatedProgress + currentProgress) * 100) /100
    if estimatedProgress == 0 then
        message = "No recorded mobs pulled or nameplates inactive."
    else
        message = string.format("Current pull: %.2f%% + %.2f%% = %.2f%%", currentProgress, estimatedProgress, totalProgress)
    end
    self:SetCurrentPullEstimateLabel(message)
end

function MMPE:CreateNameplateText(unit)
    local npcID = self:GetNPCID(UnitGUID(unit))
    if npcID then
        if self.activeNameplates[unit] then
            self.activeNameplates[unit]:Hide() -- This should never happen...
        end
        local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
        if nameplate then
            self.activeNameplates[unit] = nameplate:CreateFontString(unit .."mppProgress", nameplate.UnitFrame.healthBar, "GameFontHighlightSmall")
            self.activeNameplates[unit]:SetText("+?%")
        end
    end
end

function MMPE:RemoveNameplateText(unit)
    if self.activeNameplates[unit] ~= nil then
        self.activeNameplates[unit]:SetText("")
        self.activeNameplates[unit]:Hide()
        self.activeNameplates[unit] = nil
    end
end

function MMPE:UpdateNameplateValue(unit)
    local npcID = self:GetNPCID(UnitGUID(unit))
    if npcID then
        local estProg = self:GetEstimatedProgress(npcID)
        if estProg and estProg > 0 then
            local message = "|cFF" .. self:GetSetting("nameplateTextColor") .. "+"
            message = string.format("%s%.2f%%", message, estProg)
            self.activeNameplates[unit]:SetText(message)
            self.activeNameplates[unit]:Show()
            return true
        end
    end
    if self.activeNameplates[unit] then -- If mob dies, a new nameplate is created but not shown, and this ui widget will then not exist.
        self.activeNameplates[unit]:SetText("")
        self.activeNameplates[unit]:Hide()
    end
    return false
end

function MMPE:UpdateNameplateValues()
    for unit, _ in pairs(self.activeNameplates) do
        self:UpdateNameplateValue(unit)
    end
end

function MMPE:UpdateNameplatePosition(unit)
    local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
    if nameplate and nameplate.UnitFrame and nameplate.UnitFrame.unitExists and self.activeNameplates[unit] ~= nil then
        local offsetx = self:GetSetting('offsetx')
        local offsety = self:GetSetting('offsety')
        self.activeNameplates[unit]:SetPoint("LEFT", nameplate.UnitFrame.name, "LEFT", nameplate.UnitFrame.name:GetWidth() + offsetx, 0 + offsety)
    else
        self:RemoveNameplateText(unit)
        self:DebugPrint("Unit", unit, "does not seem to exist. Why are we trying to update it?")
    end
end

function MMPE:ShouldShowNameplateTexts()
    if self:GetSetting("enabled") and self:GetSetting("enableNameplateText") and self:IsMythicPlus() and not self:IsDungeonFinished() then
        return true
    end
    return false
end

function MMPE:OnAddNameplate(unit)
    self:DebugPrint('OnAddNameplate', unit)
    if self:ShouldShowNameplateTexts() then
        self:CreateNameplateText(unit)
        self:UpdateNameplateValue(unit)
        self:UpdateNameplatePosition(unit)
    end
end

function MMPE:OnRemoveNameplate(unit)
    self:RemoveNameplateText(unit)
    self.activeNameplates[unit] = nil -- This line has been made superflous tbh.
end

function MMPE:RemoveNameplates()
    for unit,_ in pairs(self.activeNameplates) do
        self:RemoveNameplateText(unit)
    end
end


function MMPE:UpdateNameplates()
    if self:ShouldShowNameplateTexts() then
        for unit,_ in pairs(self.activeNameplates) do
            self:UpdateNameplatePosition(unit)
        end
    else
        self:RemoveNameplates()
    end
end

---
--- SET UP HOOKS
---

function MMPE:OnInitialize()
    self.DB = MMPEDB
    self.DB.debug = self.DB.debug or false

    self:RegisterEvent("SCENARIO_CRITERIA_UPDATE", function() self:OnCriteriaUpdate() end)
    self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", function(...) self:OnCombatLogEvent({...}) end)

    self:RegisterEvent("NAME_PLATE_UNIT_ADDED", function(_, unit) self:OnAddNameplate(unit) end)
    self:RegisterEvent("NAME_PLATE_UNIT_REMOVED", function(_, unit) self:OnRemoveNameplate(unit) end)

    self.frame = CreateFrame("FRAME")
    self:HookScript(self.frame, "OnUpdate", function(_, elapsed) self:OnUpdate(elapsed) end)
    self:HookScript(GameTooltip, "OnTooltipSetUnit", function(tooltip) self:OnNPCTooltip(tooltip)  end)

    self:VerifyDB()
    if self:IsMythicPlus() then
        self.quantity = self:GetEnemyForcesProgress()
        self:DebugPrint("MPP Loaded in progress:", self.quantity, "in.")
    else
        self.quantity = 0
        self:DebugPrint("MPP loaded not in progress.")
    end
    self:CreatePullFrame()

    self:RegisterChatCommand('mythicplusprogress', function(args) self:Command(args) end);
    self:RegisterChatCommand('mypp', function(args) self:Command(args) end);
    self:RegisterChatCommand('mpp', function(args) self:Command(args) end);

    self.loaded = true
end

function MMPE:OnUpdate(elapsed)
    self.currentPullUpdateTimer = self.currentPullUpdateTimer + elapsed * 1000 -- Not using milliseconds in 2016? WutFace
    if self.currentPullUpdateTimer >= self:GetSetting("nameplateUpdateRate") then
        self.currentPullUpdateTimer = 0
        self:UpdateCurrentPullEstimate()
        self:UpdateNameplateValues()
    end
    self:UpdateNameplates()
end

function MMPE:Command(args)
    args = split(args)
    args[1] = string.lower(args[1] or "")

    if args[1] == "toggle" then
        self:Print("MythicPlusPullEstimator toggled ".. (self:ToggleSetting("enabled") and "ON" or "OFF"))

    elseif args[1] == "offsetx" then
        if args[2] then
            self:SetSetting("offsetx", args[2])
        end
        self:Print("X offset for nameplates is now ", self:GetSetting('offsetx'))

    elseif args[1] == "offsety" then
        if args[2] then
            self:SetSetting("offsety", args[2])
        end
        self:Print("Y offset for nameplates is now ", self:GetSetting('offsety'))

    elseif args[1] == "reset" then
        self.currentPullFrame:SetPoint("CENTER", UIParent, 50, 50)
        self:Print("MythicPlusPullEstimator' position reset.")

    elseif args[1] == "sim" then
        self.simulationActive = not self.simulationActive
        self:Print("MPP simulation mode toggled ".. (self.simulationActive and "ON" or "OFF"))

    elseif args[1] == "debug" then
        self.DB.debug = not self.DB.debug
        self:Print("MPP debug toggled ".. (self.DB.debug and "ON" or "OFF"))

    elseif args[1] == "updatevalue" then
        local npcId = self:GetNPCID(UnitGUID("target"))
        if npcId then
            updateValue(npcId, tonumber(args[2]), UnitName("target") .. ("(Manual)"))
        end

    elseif args[1] == "getvalue" then
        self:Print(self:GetValue(tonumber(args[2])) or "No Data")

    elseif args[1] == "getvalues" then
        local npcData = self.DB.npcData[tonumber(args[2])]
        if npcData then
            self:Print((npcData["name"]))
            foreach(npcData["values"], function(...) self:Print(...) end)
        else
            self:Print("No data.")
        end

    elseif args[1] == "getsetting" then
        self:Print(self:GetSetting(args[2]))

    elseif args[1] == "simmax" then
        self.simulationMax = tonumber(args[2])

    elseif args[1] == "simcur" then
        self.simulationCurrent = tonumber(args[2])

    elseif args[1] == "wipeall" then
        self:VerifyDB(true)
        self:Print("RIP Database.")

    elseif args[1] == "wipesettings" then
        self:VerifySettings(true)

    elseif args[1] == "tooltip" then
        self:Print("Toggled tooltips ".. (self:ToggleSetting("enableTooltip") and "on" or "off"))

    elseif args[1] == "currentpull" then
        self:Print("Toggled \"current pull\" display ".. (self:ToggleSetting("enablePullEstimate") and "on" or "off"))

    elseif args[1] == "dbinfo" then
        self:Print("Mobs recorded: " .. #self.DB.npcData)

    elseif args[1] == "combatonly" then
        self:Print("Toggled combat only \"current pull\" display ".. (self:ToggleSetting("pullEstimateCombatOnly") and "on" or "off"))

    elseif args[1] == "version" then
        self:Print("MythicPlusPullEstimator Version: " .. self.version)

    elseif args[1] == "nameplates" then
        self:Print("Nameplate text overlay toggled ".. (self:ToggleSetting("enableNameplateText") and "ON" or "OFF"))

    elseif args[1] == "export" then
        self:ExportData()
        self:Print("Data export opened, copy it to clipboard then hit enter to close.")

    else
        self:Print("MythicPlusPullEstimator commands:")
        self:Print("/mpp toggle (Toggles ALL addon visibility on/off, it will still record npc data while in Mythic+)")
        self:Print("/mpp reset (reset position of 'current pull' text, it likes to run away)")
        self:Print("/mpp version (displays current version of addon)")
        self:Print("/mpp tooltip (toggles the tooltip functionality on/off)")
        self:Print("/mpp currentpull (toggles the \"current pull\" functionality on/off)")
        self:Print("/mpp dbinfo (Shows how many unique mobs you've recorded)")
        self:Print("/mpp combatonly (Toggles only showing the current pull estimate while you or one of your party members are in combat)")
        self:Print("/mpp nameplates (Toggles nameplate text overlay on/off)")
        self:Print("/mpp offsetx (allows you to change the left/right offset for nameplate text)")
        self:Print("/mpp offsety (allows you to change the up/down offset for nameplate text)")
        self:Print("/mpp wipesettings (Resets all settings to default (but not mob data!))")
    end
end