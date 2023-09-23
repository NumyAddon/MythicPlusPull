local _, ns = ...

local data = {};
tinsert(ns.data, data)

function data:GetPatchVersion()
    return {
        timestamp = 1695497412,
        version = '10.2.0',
        build = 51425,
    }
end

function data:GetDungeonOverrides()
    return {}
end

function data:GetNPCData()
    -- data is sorted with natural sorting by NPC ID
    return {
        [45477] = { ["name"] = "Gust Soldier", ["count"] = 5 },
        [45704] = { ["name"] = "Lurking Tempest", ["count"] = 3 },
        [45912] = { ["name"] = "Wild Vortex", ["count"] = 4 },
        [45915] = { ["name"] = "Armored Mistral", ["count"] = 15 },
        [45917] = { ["name"] = "Cloud Prince", ["count"] = 12 },
        [45919] = { ["name"] = "Young Storm Dragon", ["count"] = 20 },
        [45922] = { ["name"] = "Empyrean Assassin", ["count"] = 5 },
        [45924] = { ["name"] = "Turbulent Squall", ["count"] = 3 },
        [45926] = { ["name"] = "Servant of Asaad", ["count"] = 4 },
        [45928] = { ["name"] = "Executor of the Caliph", ["count"] = 8 },
        [45930] = { ["name"] = "Minister of Air", ["count"] = 15 },
        [45932] = { ["name"] = "Skyfall Star", ["count"] = 1 },
        [45935] = { ["name"] = "Temple Adept", ["count"] = 5 },
    }
end
