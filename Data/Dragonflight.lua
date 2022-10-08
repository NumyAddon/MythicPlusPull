local _, ns = ...

local data = {};
tinsert(ns.data, data)

function data:GetPatchVersion()
    return {
        timestamp = 1665229196,
        version = '10.0.2',
        build = 45969,
    }
end

function data:GetDungeonOverrides()
    return {}
end

function data:GetNPCData()
    -- data is sorted with natural sorting by NPC ID
    return {
        [186740] = { ["name"] = "unknown_186740", ["count"] = 5 },
        [186741] = { ["name"] = "unknown_186741", ["count"] = 5 },
        [187139] = { ["name"] = "unknown_187139", ["count"] = 8 },
        [187154] = { ["name"] = "unknown_187154", ["count"] = 8 },
        [187155] = { ["name"] = "unknown_187155", ["count"] = 5 },
        [187159] = { ["name"] = "unknown_187159", ["count"] = 1 },
        [187160] = { ["name"] = "unknown_187160", ["count"] = 5 },
        [187240] = { ["name"] = "unknown_187240", ["count"] = 8 },
        [187242] = { ["name"] = "unknown_187242", ["count"] = 3 },
        [187246] = { ["name"] = "unknown_187246", ["count"] = 5 },
        [187894] = { ["name"] = "unknown_187894", ["count"] = 1 },
        [187897] = { ["name"] = "unknown_187897", ["count"] = 40 },
        [187969] = { ["name"] = "unknown_187969", ["count"] = 10 },
        [188011] = { ["name"] = "unknown_188011", ["count"] = 10 },
        [188067] = { ["name"] = "unknown_188067", ["count"] = 10 },
        [188100] = { ["name"] = "unknown_188100", ["count"] = 1 },
        [188244] = { ["name"] = "unknown_188244", ["count"] = 18 },
        [189555] = { ["name"] = "unknown_189555", ["count"] = 3 },
        [190034] = { ["name"] = "unknown_190034", ["count"] = 16 },
        [190205] = { ["name"] = "unknown_190205", ["count"] = 1 },
        [190206] = { ["name"] = "unknown_190206", ["count"] = 10 },
        [190207] = { ["name"] = "unknown_190207", ["count"] = 10 },
        [190510] = { ["name"] = "unknown_190510", ["count"] = 5 },
        [191164] = { ["name"] = "unknown_191164", ["count"] = 8 },
        [191313] = { ["name"] = "unknown_191313", ["count"] = 1 },
        [191739] = { ["name"] = "unknown_191739", ["count"] = 8 },
        [192329] = { ["name"] = "unknown_192329", ["count"] = 2 },
        [192333] = { ["name"] = "unknown_192333", ["count"] = 8 },
        [192680] = { ["name"] = "unknown_192680", ["count"] = 18 },
        [195119] = { ["name"] = "unknown_195119", ["count"] = 14 },
        [196044] = { ["name"] = "unknown_196044", ["count"] = 4 },
        [196045] = { ["name"] = "unknown_196045", ["count"] = 5 },
        [196102] = { ["name"] = "unknown_196102", ["count"] = 5 },
        [196115] = { ["name"] = "unknown_196115", ["count"] = 8 },
        [196116] = { ["name"] = "unknown_196116", ["count"] = 5 },
        [196117] = { ["name"] = "unknown_196117", ["count"] = 8 },
        [196198] = { ["name"] = "unknown_196198", ["count"] = 8 },
        [196200] = { ["name"] = "unknown_196200", ["count"] = 8 },
        [196202] = { ["name"] = "unknown_196202", ["count"] = 5 },
        [196203] = { ["name"] = "unknown_196203", ["count"] = 6 },
        [196576] = { ["name"] = "unknown_196576", ["count"] = 5 },
        [196577] = { ["name"] = "unknown_196577", ["count"] = 5 },
        [196671] = { ["name"] = "unknown_196671", ["count"] = 15 },
        [196694] = { ["name"] = "unknown_196694", ["count"] = 4 },
        [197219] = { ["name"] = "unknown_197219", ["count"] = 9 },
        [197398] = { ["name"] = "unknown_197398", ["count"] = 2 },
        [197406] = { ["name"] = "unknown_197406", ["count"] = 4 },
        [197535] = { ["name"] = "unknown_197535", ["count"] = 40 },
        [197697] = { ["name"] = "unknown_197697", ["count"] = 40 },
        [197698] = { ["name"] = "unknown_197698", ["count"] = 40 },
        [197982] = { ["name"] = "unknown_197982", ["count"] = 10 },
        [197985] = { ["name"] = "unknown_197985", ["count"] = 16 },
        [198047] = { ["name"] = "unknown_198047", ["count"] = 16 },
    }
end
