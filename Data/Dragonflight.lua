local _, ns = ...

local data = {};
tinsert(ns.data, data)

function data:GetPatchVersion()
    return {
        timestamp = 1665603850,
        version = '10.0.2',
        build = 46092,
    }
end

function data:GetDungeonOverrides()
    return {}
end

function data:GetNPCData()
    -- data is sorted with natural sorting by NPC ID
    return {
        [186740] = { ["name"] = "Arcane Construct", ["count"] = 5 },
        [186741] = { ["name"] = "Arcane Elemental", ["count"] = 5 },
        [187139] = { ["name"] = "Crystal Thrasher", ["count"] = 8 },
        [187154] = { ["name"] = "Unstable Curator", ["count"] = 8 },
        [187155] = { ["name"] = "Rune Seal Keeper", ["count"] = 5 },
        [187159] = { ["name"] = "Shrieking Whelp", ["count"] = 1 },
        [187160] = { ["name"] = "Crystal Fury", ["count"] = 5 },
        [187240] = { ["name"] = "Drakonid Breaker", ["count"] = 8 },
        [187242] = { ["name"] = "Tarasek Delver", ["count"] = 3 },
        [187246] = { ["name"] = "Nullmagic Hornswog", ["count"] = 5 },
        [187894] = { ["name"] = "Infused Whelp", ["count"] = 1 },
        [187897] = { ["name"] = "Defier Draghar", ["count"] = 40 },
        [187969] = { ["name"] = "Flashfrost Earthshaper", ["count"] = 10 },
        [188011] = { ["name"] = "Primal Terrasentry", ["count"] = 10 },
        [188067] = { ["name"] = "Flashfrost Chillweaver", ["count"] = 10 },
        [188100] = { ["name"] = "Shrieking Whelp", ["count"] = 1 },
        [188244] = { ["name"] = "Primal Juggernaut", ["count"] = 18 },
        [189555] = { ["name"] = "Astral Attendant", ["count"] = 3 },
        [190034] = { ["name"] = "Blazebound Destroyer", ["count"] = 16 },
        [190205] = { ["name"] = "Scorchling", ["count"] = 1 },
        [190206] = { ["name"] = "Primalist Flamedancer", ["count"] = 10 },
        [190207] = { ["name"] = "Primalist Cinderweaver", ["count"] = 10 },
        [190510] = { ["name"] = "Vault Guard", ["count"] = 5 },
        [191164] = { ["name"] = "Arcane Tender", ["count"] = 8 },
        [191313] = { ["name"] = "Volatile Sapling", ["count"] = 1 },
        [191739] = { ["name"] = "Scalebane Lieutenant", ["count"] = 8 },
        [192329] = { ["name"] = "Territorial Eagle", ["count"] = 2 },
        [192333] = { ["name"] = "Alpha Eagle", ["count"] = 8 },
        [192680] = { ["name"] = "Guardian Sentry", ["count"] = 18 },
        [195119] = { ["name"] = "Primalist Shockcaster", ["count"] = 14 },
        [196044] = { ["name"] = "Unruly Textbook", ["count"] = 4 },
        [196045] = { ["name"] = "Corrupted Manafiend", ["count"] = 5 },
        [196102] = { ["name"] = "Conjured Lasher", ["count"] = 5 },
        [196115] = { ["name"] = "Arcane Tender", ["count"] = 8 },
        [196116] = { ["name"] = "Crystal Fury", ["count"] = 5 },
        [196117] = { ["name"] = "Crystal Thrasher", ["count"] = 8 },
        [196198] = { ["name"] = "Algeth'ar Security", ["count"] = 8 },
        [196200] = { ["name"] = "Algeth'ar Enforcer", ["count"] = 8 },
        [196202] = { ["name"] = "Algeth'ar Educator", ["count"] = 5 },
        [196203] = { ["name"] = "Algeth'ar Nurse", ["count"] = 6 },
        [196576] = { ["name"] = "Spellbound Scepter", ["count"] = 5 },
        [196577] = { ["name"] = "Spellbound Battleaxe", ["count"] = 5 },
        [196671] = { ["name"] = "Arcane Ravager", ["count"] = 15 },
        [196694] = { ["name"] = "Arcane Forager", ["count"] = 4 },
        [197219] = { ["name"] = "Vile Lasher", ["count"] = 9 },
        [197398] = { ["name"] = "Hungry Lasher", ["count"] = 2 },
        [197406] = { ["name"] = "Aggravated Skitterfly", ["count"] = 4 },
        [197535] = { ["name"] = "High Channeler Ryvati", ["count"] = 40 },
        [197697] = { ["name"] = "Flamegullet", ["count"] = 40 },
        [197698] = { ["name"] = "Thunderhead", ["count"] = 40 },
        [197982] = { ["name"] = "Storm Warrior", ["count"] = 10 },
        [197985] = { ["name"] = "Flame Channeler", ["count"] = 16 },
        [198047] = { ["name"] = "Tempest Channeler", ["count"] = 16 },
    }
end
