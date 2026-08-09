local name, ns = ...

--- @class MythicPlusPull
local MPP = ns.addon
if not MPP then return end

local L = ns.L

MPP.version = C_AddOns.GetAddOnMetadata(name, "Version") or "unknown"
--- @enum (key) MMPE_Setting
MPP.defaultSettings = {
    --enableInDelves = true,
    enableInMythicPlus = true,

    enableTooltip = true,
    includeCountInTooltip = true,

    enablePullEstimate = true,
    pullEstimateCombatOnly = true,
    pullFrameTextFormat = L["Current pull:"] .. ' $current%$ + $pull%$ = $estimated%$',
    pullFrameTextScale = 1.0,
    hidePullEstimateFrameWhenApiUnavailable = true,

    offsetx = 0, -- extra offset for nameplate text
    offsety = 0,

    enableNameplateText = true,
    nameplateTextFormat = "+$percent$%",
    nameplateTextColor = "FFFFFFFF",
    nameplateTextScale = 1.0,

    lockPullFrame = false,
    pullFramePoint = {
        ["anchorPoint"] = "CENTER",
        ["relativeFrame"] = "UIParent",
        ["relativePoint"] = "CENTER",
        ["offX"] = 400,
        ["offY"] = 300,
    },
}

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

local function debugPrint(...)
    --@debug@
    print('MPP:', ...)
    --@end-debug@
end

--- @param setting MMPE_Setting
function MPP:GetSetting(setting)
    if (not setting or self.DB.settings[setting] == nil) then
        debugPrint("MPP attempted to get missing setting:", setting)

        return
    end

    return self.DB.settings[setting]
end

--- @param setting MMPE_Setting
--- @param value any
function MPP:SetSetting(setting, value)
    if (not setting or self.DB.settings[setting] == nil) then
        debugPrint("MPP attempted to set missing setting:", setting)

        return
    end
    self.DB.settings[setting] = value

    self:FullUpdate()

    return value
end

--- @param setting MMPE_Setting
function MPP:ToggleSetting(setting)
    return self:SetSetting(setting, not self:GetSetting(setting))
end

function MPP:InitPopup()
    if not StaticPopupDialogs["MPPEDataExportDialog"] then
        StaticPopupDialogs["MPPEDataExportDialog"] = {
            text = L["CTRL-C to copy"],
            button1 = CLOSE,
            --- @param dialog StaticPopupTemplate
            --- @param data string
            OnShow = function(dialog, data)
                local function HidePopup()
                    dialog:Hide();
                end
                --- @type StaticPopupTemplate_EditBox
                local editBox = dialog.GetEditBox and dialog:GetEditBox() or dialog.editBox;
                editBox:SetScript("OnEscapePressed", HidePopup);
                editBox:SetScript("OnEnterPressed", HidePopup);
                editBox:SetScript("OnKeyUp", function(_, key)
                    if IsControlKeyDown() and (key == 'C' or key == 'X') then
                        HidePopup();
                    end
                end);
                editBox:SetMaxLetters(0);
                editBox:SetText(data);
                editBox:HighlightText();
            end,
            hasEditBox = true,
            editBoxWidth = 240,
            timeout = 0,
            whileDead = true,
            hideOnEscape = true,
            preferredIndex = 3,
        };
    end
end

function MPP:InitConfig()
    local increment = CreateCounter()
    local function set(info, value)
        self:SetSetting(info[#info], value)
    end
    local function get(info)
        return self:GetSetting(info[#info])
    end
    local options = {
        type = "group",
        childGroups = "tab",
        name = L["Mythic Plus Pull"],
        desc = L["Mythic Plus Pull progress tracker"],
        get = get,
        set = set,
        args = {
            version = {
                order = increment(),
                type = "description",
                name = L["Version:"] .. " " .. self.version,
            },
            wipesettings = {
                order = increment(),
                type = "execute",
                name = L["Reset to defaults"],
                desc = L["Reset to defaults"],
                func = function() self:VerifySettings(true) end,
                --width = "double",
            },
            exampleDisplay = {
                order = increment(),
                type = "toggle",
                name = L["Toggle Example"],
                desc = L["Toggle an example display of the pull frame and nameplate text, using fake data."],
                get = function() return self.exampleDisplayActive end,
                set = function(info, value)
                    self.exampleDisplayActive = value
                    self:ToggleFunctionality()
                end,
            },
            --activities = {
            --    order = increment(),
            --    type = "group",
            --    name = L["Activities"],
            --    inline = true,
            --    args = {
            --        enableInMythicPlus = {
            --            order = increment(),
            --            type = "toggle",
            --            name = L["Enable in Mythic+"],
            --            desc = L["Enable the addon in Mythic+ dungeons."],
            --        },
            --        enableInDelves = {
            --            order = increment(),
            --            type = "toggle",
            --            name = L["Enable in Delves"],
            --            desc = L["Enable the addon in Delves. Only works for delves that have a progress bar objective."],
            --        },
            --    },
            --},
            tooltip = {
                order = increment(),
                type = "group",
                name = L["Tooltip"],
                inline = true,
                args = {
                    enableTooltip = {
                        order = increment(),
                        type = "toggle",
                        name = L["Enable Tooltip"],
                        desc = L["Adds percentage info to the unit tooltip"],
                    },
                    includeCountInTooltip = {
                        order = increment(),
                        type = "toggle",
                        name = L["Include Count"],
                        desc = L["Include the raw count value in the tooltip, as well as the percentage"],
                    },
                },
            },
            pullEstimateFrame = {
                order = increment(),
                type = "group",
                name = L["Pull Estimate frame"],
                inline = true,
                args = {
                    enablePullEstimate = {
                        order = increment(),
                        type = "toggle",
                        name = L["Enable Current Pull frame"],
                        desc = L["Display a frame with current pull information"],
                    },
                    hidePullEstimateFrameWhenApiUnavailable = {
                        order = increment(),
                        type = "toggle",
                        width = "double",
                        name = L["Hide frame when API unavailable"],
                        desc = L["Pull % information is unavailable in Midnight due to missing APIs. This option will hide the frame until the required APIs are added by Blizzard."],
                    },
                    pullEstimateCombatOnly = {
                        order = increment(),
                        type = "toggle",
                        name = L["Only in combat"],
                        desc = L["Only show the frame when you are in combat"],
                    },
                    lockPullFrame = {
                        order = increment(),
                        type = "toggle",
                        name = L["Lock frame"],
                        desc = L["Lock the frame in place"],
                        set = function(info, value)
                            set(info, value)
                            self.currentPullFrame:EnableMouse(not value)
                        end,
                    },
                    reset = {
                        order = increment(),
                        type = "execute",
                        name = L["Reset position"],
                        desc = L["Reset position of Current Pull frame to the default"],
                        func = function()
                            self.DB.settings.pullFramePoint = self.defaultSettings.pullFramePoint
                            SetFramePoint(self.currentPullFrame, self.DB.settings.pullFramePoint)
                        end,
                    },
                    pullFrameTextFormat = {
                        order = increment(),
                        type = "input",
                        name = L["Text Format"],
                        desc = L["The text format of the pull frame. Use placeholders to display information."],
                        descStyle = "inline",
                        width = "full",
                    },
                    pullFrameTextFormatDescription = {
                        order = increment(),
                        type = "description",
                        name = L['The following placeholders are available:'] .. '\n' ..
                            '    - $current$ ' .. L['The current count of mobs killed.'] .. '\n' ..
                            GRAY_FONT_COLOR:WrapTextInColorCode('    - $pull$ ' .. L['The count of mobs pulled.']) .. '\n' ..
                            GRAY_FONT_COLOR:WrapTextInColorCode('    - $estimated$ ' .. L['The estimated count after all pulled mobs are killed.']) .. '\n' ..
                            '    - $required$ ' .. L['The required count of mobs to reach 100%%.'] .. '\n' ..
                            '    - $current%$ ' .. L['The current percentage of mobs killed.'] .. '\n' ..
                            GRAY_FONT_COLOR:WrapTextInColorCode('    - $pull%$ ' .. L['The percentage of mobs pulled.']) .. '\n' ..
                            GRAY_FONT_COLOR:WrapTextInColorCode('    - $estimated%$ ' .. L['The estimated percentage after all pulled mobs are killed.']) .. '\n' ..
                            '    - $required%$ ' .. L['A long way of writing 100%%.'] .. '\n' ..
                            'Placeholders in ' .. GRAY_FONT_COLOR:WrapTextInColorCode('gray') .. ' are temporarily unavailable in Midnight, until Blizzard adds the required APIs.',
                    },
                    resetTextFormat = {
                        order = increment(),
                        type = "execute",
                        name = "Reset Text Format",
                        desc = "Reset the text format to the default.",
                        descStyle = "inline",
                        width = "full",
                        func = function() self:SetSetting("pullFrameTextFormat", self.defaultSettings.pullFrameTextFormat); end,
                    },
                    pullFrameTextScale = {
                        order = increment(),
                        type = "range",
                        name = L["Pull Frame Text Scale"],
                        desc = L["Scale of the text on the pull frame"],
                        width = "double",
                        softMin = 0.5,
                        softMax = 2,
                        bigStep = 0.05,
                        set = function(info, value)
                            set(info, value)
                            self.currentPullFrame:SetScale(value)
                        end,
                    },
                },
            },
            nameplate = {
                order = increment(),
                type = "group",
                name = L["Nameplate"],
                inline = true,
                args = {
                    enableNameplateText = {
                        order = increment(),
                        type = "toggle",
                        name = L["Enable Nameplate Text"],
                        desc = L["Adds the % info to the enemy nameplates"],
                    },
                    nameplateTextColor = {
                        order = increment(),
                        type = "color",
                        name = L["Nameplate Text Color"],
                        desc = L["Color of the text on the enemy nameplates"],
                        hasAlpha = true,
                        get = function(info)
                            --- @type string
                            local hex = self:GetSetting(info[#info])
                            return tonumber(hex:sub(3, 4), 16) / 255, tonumber(hex:sub(5, 6), 16) / 255, tonumber(hex:sub(7, 8), 16) / 255, tonumber(hex:sub(1, 2), 16) / 255
                        end,
                        set = function(info, r, g, b, a)
                            self:SetSetting(info[#info], string.format("%02x%02x%02x%02x", a * 255, r * 255, g * 255, b * 255))
                        end,
                    },
                    nameplateTextFormat = {
                        order = increment(),
                        type = "input",
                        name = L["Text Format"],
                        desc = L["The text format of the nameplate text. Use placeholders to display information."],
                        descStyle = "inline",
                        width = "full",
                    },
                    nameplateTextFormatDescription = {
                        order = increment(),
                        type = "description",
                        name = L['The following placeholders are available:'] .. '\n' ..
                            '    - $percent$ ' .. L['The percentage the mob gives.'] .. '\n' ..
                            '    - $count$ ' .. L['The raw count the mob gives.'],
                    },
                    resetTextFormat = {
                        order = increment(),
                        type = "execute",
                        name = "Reset Text Format",
                        desc = "Reset the text format to the default.",
                        descStyle = "inline",
                        width = "full",
                        func = function() self:SetSetting("nameplateTextFormat", self.defaultSettings.nameplateTextFormat); end,
                    },
                    nameplateTextScale = {
                        order = increment(),
                        type = "range",
                        name = L["Nameplate Text Scale"],
                        desc = L["Scale of the text on the enemy nameplates"],
                        width = "double",
                        softMin = 0.5,
                        softMax = 2,
                        bigStep = 0.05,
                        set = function(info, value)
                            set(info, value)
                            for _, nameplateText in pairs(self.activeNameplates) do
                                nameplateText:SetScale(value)
                            end
                        end,
                    },
                    offsetx = {
                        order = increment(),
                        type = "range",
                        name = L["Horizontal offset ( <-> )"],
                        desc = L["Horizontal offset of the nameplate text"],
                        width = "double",
                        softMin = -100,
                        softMax = 100,
                        bigStep = 1,
                    },
                    offsety = {
                        order = increment(),
                        type = "range",
                        name = L["Vertical Offset ( | )"],
                        desc = L["Vertical offset of the nameplate text"],
                        width = "double",
                        softMin = -100,
                        softMax = 100,
                        bigStep = 1,
                    },
                },
            },
        },
    }

    self.configPanelName = "Mythic Plus Pull"
    LibStub("AceConfig-3.0"):RegisterOptionsTable(self.configPanelName, options)
    local _, categoryID = LibStub("AceConfigDialog-3.0"):AddToBlizOptions(self.configPanelName)
    self.categoryID = categoryID
end

function MPP:OpenConfig()
    if C_SettingsUtil and C_SettingsUtil.OpenSettingsPanel and InCombatLockdown() then
        LibStub("AceConfigDialog-3.0"):Open(self.configPanelName);
        return;
    end
    Settings.OpenToCategory(self.categoryID);
end
