local _, ns = ...

local data = {};
tinsert(ns.data, data)

function data:GetPatchVersion()
    return {
        timestamp = 1679137520,
        version = '10.1.0',
        build = 48537,
    }
end

function data:GetDungeonOverrides()
    return {}
end

function data:GetNPCData()
    -- data is sorted with natural sorting by NPC ID
    return {
        [184019] = { ["name"] = "Burly Rock-Thrower", ["count"] = 5 },
        [184020] = { ["name"] = "Hulking Berserker", ["count"] = 15 },
        [184022] = { ["name"] = "Stonevault Geomancer", ["count"] = 5 },
        [184023] = { ["name"] = "Vicious Basilisk", ["count"] = 3 },
        [184107] = { ["name"] = "Runic Protector", ["count"] = 25 },
        [184130] = { ["name"] = "Earthen Custodian", ["count"] = 4 },
        [184131] = { ["name"] = "Earthen Guardian", ["count"] = 15 },
        [184132] = { ["name"] = "Earthen Warder", ["count"] = 5 },
        [184134] = { ["name"] = "Scavenging Leaper", ["count"] = 1 },
        [184300] = { ["name"] = "Ebonstone Golem", ["count"] = 15 },
        [184301] = { ["name"] = "Cavern Seeker", ["count"] = 4 },
        [184303] = { ["name"] = "Skittering Crawler", ["count"] = 4 },
        [184319] = { ["name"] = "Refti Custodian", ["count"] = 15 },
        [184331] = { ["name"] = "Infinite Timereaver", ["count"] = 15 },
        [184335] = { ["name"] = "Infinite Agent", ["count"] = 5 },
        [185508] = { ["name"] = "Claw Fighter", ["count"] = 5 },
        [185528] = { ["name"] = "Trickclaw Mystic", ["count"] = 5 },
        [185529] = { ["name"] = "Bracken Warscourge", ["count"] = 15 },
        [185534] = { ["name"] = "Bonebolt Hunter", ["count"] = 5 },
        [185656] = { ["name"] = "Filth Caller", ["count"] = 5 },
        [185691] = { ["name"] = "Vicious Hyena", ["count"] = 3 },
        [186191] = { ["name"] = "Decay Speaker", ["count"] = 15 },
        [186206] = { ["name"] = "Cruel Bonecrusher", ["count"] = 5 },
        [186208] = { ["name"] = "Rotbow Stalker", ["count"] = 15 },
        [186220] = { ["name"] = "Brackenhide Shaper", ["count"] = 5 },
        [186226] = { ["name"] = "Fetid Rotsinger", ["count"] = 15 },
        [186227] = { ["name"] = "Monstrous Decay", ["count"] = 15 },
        [186229] = { ["name"] = "Wilted Oak", ["count"] = 20 },
        [186242] = { ["name"] = "Skulking Gutstabber", ["count"] = 5 },
        [186246] = { ["name"] = "Fleshripper Vulture", ["count"] = 3 },
        [186284] = { ["name"] = "Gutchewer Bear", ["count"] = 5 },
        [186420] = { ["name"] = "Earthen Weaver", ["count"] = 5 },
        [186740] = { ["name"] = "Arcane Construct", ["count"] = 5 },
        [186741] = { ["name"] = "Arcane Elemental", ["count"] = 5 },
        [187021] = { ["name"] = "Rotbow Sentry", ["count"] = 5 },
        [187033] = { ["name"] = "Stinkbreath", ["count"] = 25 },
        [187139] = { ["name"] = "Crystal Thrasher", ["count"] = 8 },
        [187154] = { ["name"] = "Unstable Curator", ["count"] = 8 },
        [187155] = { ["name"] = "Rune Seal Keeper", ["count"] = 5 },
        [187159] = { ["name"] = "Shrieking Whelp", ["count"] = 1 },
        [187160] = { ["name"] = "Crystal Fury", ["count"] = 5 },
        [187192] = { ["name"] = "Rageclaw", ["count"] = 30 },
        [187224] = { ["name"] = "Vile Rothexer", ["count"] = 15 },
        [187231] = { ["name"] = "Wither Biter", ["count"] = 1 },
        [187238] = { ["name"] = "Witherling", ["count"] = 1 },
        [187240] = { ["name"] = "Drakonid Breaker", ["count"] = 8 },
        [187242] = { ["name"] = "Tarasek Delver", ["count"] = 3 },
        [187246] = { ["name"] = "Nullmagic Hornswog", ["count"] = 5 },
        [187315] = { ["name"] = "Disease Slasher", ["count"] = 5 },
        [187894] = { ["name"] = "Infused Whelp", ["count"] = 1 },
        [187897] = { ["name"] = "Defier Draghar", ["count"] = 40 },
        [187969] = { ["name"] = "Flashfrost Earthshaper", ["count"] = 10 },
        [188011] = { ["name"] = "Primal Terrasentry", ["count"] = 10 },
        [188067] = { ["name"] = "Flashfrost Chillweaver", ["count"] = 10 },
        [188100] = { ["name"] = "Shrieking Whelp", ["count"] = 1 },
        [188244] = { ["name"] = "Primal Juggernaut", ["count"] = 18 },
        [189227] = { ["name"] = "Qalashi Hunter", ["count"] = 5 },
        [189235] = { ["name"] = "Overseer Lahar", ["count"] = 25 },
        [189247] = { ["name"] = "Tamed Phoenix", ["count"] = 1 },
        [189265] = { ["name"] = "Qalashi Bonetender", ["count"] = 5 },
        [189266] = { ["name"] = "Qalashi Trainee", ["count"] = 5 },
        [189299] = { ["name"] = "Decaying Slime", ["count"] = 1 },
        [189363] = { ["name"] = "Infected Lasher", ["count"] = 1 },
        [189464] = { ["name"] = "Qalashi Irontorch", ["count"] = 5 },
        [189466] = { ["name"] = "Irontorch Commander", ["count"] = 30 },
        [189467] = { ["name"] = "Qalashi Bonesplitter", ["count"] = 5 },
        [189470] = { ["name"] = "Lava Flare", ["count"] = 3 },
        [189471] = { ["name"] = "Qalashi Blacksmith", ["count"] = 5 },
        [189472] = { ["name"] = "Qalashi Lavabearer", ["count"] = 15 },
        [189531] = { ["name"] = "Decayed Elder", ["count"] = 5 },
        [189555] = { ["name"] = "Astral Attendant", ["count"] = 3 },
        [190034] = { ["name"] = "Blazebound Destroyer", ["count"] = 16 },
        [190205] = { ["name"] = "Scorchling", ["count"] = 1 },
        [190206] = { ["name"] = "Primalist Flamedancer", ["count"] = 10 },
        [190207] = { ["name"] = "Primalist Cinderweaver", ["count"] = 10 },
        [190340] = { ["name"] = "Refti Defender", ["count"] = 5 },
        [190345] = { ["name"] = "Primalist Geomancer", ["count"] = 5 },
        [190348] = { ["name"] = "Primalist Ravager", ["count"] = 5 },
        [190359] = { ["name"] = "Skulking Zealot", ["count"] = 5 },
        [190362] = { ["name"] = "Dazzling Dragonfly", ["count"] = 4 },
        [190366] = { ["name"] = "Curious Swoglet", ["count"] = 1 },
        [190368] = { ["name"] = "Flamecaller Aymi", ["count"] = 25 },
        [190370] = { ["name"] = "Squallbringer Cyraz", ["count"] = 25 },
        [190371] = { ["name"] = "Primalist Earthshaker", ["count"] = 5 },
        [190373] = { ["name"] = "Primalist Galesinger", ["count"] = 5 },
        [190377] = { ["name"] = "Primalist Icecaller", ["count"] = 5 },
        [190401] = { ["name"] = "Gusting Proto-Dragon", ["count"] = 15 },
        [190403] = { ["name"] = "Glacial Proto-Dragon", ["count"] = 15 },
        [190404] = { ["name"] = "Subterranean Proto-Dragon", ["count"] = 15 },
        [190405] = { ["name"] = "Infuser Sariya", ["count"] = 50 },
        [190510] = { ["name"] = "Vault Guard", ["count"] = 5 },
        [191164] = { ["name"] = "Arcane Tender", ["count"] = 8 },
        [191311] = { ["name"] = "Infinite Whelp", ["count"] = 1 },
        [191313] = { ["name"] = "Volatile Sapling", ["count"] = 1 },
        [191739] = { ["name"] = "Scalebane Lieutenant", ["count"] = 8 },
        [191847] = { ["name"] = "Nokhud Plainstomper", ["count"] = 8 },
        [191926] = { ["name"] = "Fishface", ["count"] = 30 },
        [192329] = { ["name"] = "Territorial Eagle", ["count"] = 2 },
        [192333] = { ["name"] = "Alpha Eagle", ["count"] = 8 },
        [192680] = { ["name"] = "Guardian Sentry", ["count"] = 18 },
        [192781] = { ["name"] = "Ore Elemental", ["count"] = 3 },
        [192786] = { ["name"] = "Qalashi Plunderer", ["count"] = 5 },
        [192787] = { ["name"] = "Qalashi Spinecrusher", ["count"] = 5 },
        [192788] = { ["name"] = "Qalashi Thaumaturge", ["count"] = 5 },
        [192789] = { ["name"] = "Nokhud Longbow", ["count"] = 5 },
        [192791] = { ["name"] = "Nokhud Warspear", ["count"] = 6 },
        [192794] = { ["name"] = "Nokhud Beastmaster", ["count"] = 5 },
        [192796] = { ["name"] = "Nokhud Hornsounder", ["count"] = 5 },
        [192800] = { ["name"] = "Nokhud Lancemaster", ["count"] = 10 },
        [193291] = { ["name"] = "Apex Blazewing", ["count"] = 15 },
        [193293] = { ["name"] = "Qalashi Warden", ["count"] = 10 },
        [193373] = { ["name"] = "Nokhud Stormcaller", ["count"] = 5 },
        [193457] = { ["name"] = "Balara", ["count"] = 16 },
        [193462] = { ["name"] = "Batak", ["count"] = 16 },
        [193944] = { ["name"] = "Qalashi Lavamancer", ["count"] = 15 },
        [194241] = { ["name"] = "Vile Rothexer", ["count"] = 15 },
        [194315] = { ["name"] = "Stormcaller Solongo", ["count"] = 10 },
        [194316] = { ["name"] = "Stormcaller Zarii", ["count"] = 10 },
        [194317] = { ["name"] = "Stormcaller Boroo", ["count"] = 10 },
        [194487] = { ["name"] = "Vile Rothexer", ["count"] = 15 },
        [194816] = { ["name"] = "Forgewrought Monstrosity", ["count"] = 15 },
        [194894] = { ["name"] = "Primalist Stormspeaker", ["count"] = 6 },
        [194896] = { ["name"] = "Primal Stormshield", ["count"] = 7 },
        [194898] = { ["name"] = "Primalist Arcblade", ["count"] = 6 },
        [195119] = { ["name"] = "Primalist Shockcaster", ["count"] = 14 },
        [195135] = { ["name"] = "Bracken Warscourge", ["count"] = 15 },
        [195222] = { ["name"] = "Rotbow Sentry", ["count"] = 5 },
        [195265] = { ["name"] = "Stormcaller Arynga", ["count"] = 10 },
        [195696] = { ["name"] = "Primalist Thunderbeast", ["count"] = 12 },
        [195842] = { ["name"] = "Ukhel Corruptor", ["count"] = 5 },
        [195847] = { ["name"] = "Ukhel Willcrusher", ["count"] = 5 },
        [195851] = { ["name"] = "Ukhel Deathspeaker", ["count"] = 6 },
        [195855] = { ["name"] = "Risen Warrior", ["count"] = 5 },
        [195875] = { ["name"] = "Desecrated Bakar", ["count"] = 1 },
        [195876] = { ["name"] = "Desecrated Ohuna", ["count"] = 2 },
        [195877] = { ["name"] = "Risen Mystic", ["count"] = 5 },
        [195878] = { ["name"] = "Ukhel Beastcaller", ["count"] = 6 },
        [195927] = { ["name"] = "Soulharvester Galtmaa", ["count"] = 10 },
        [195928] = { ["name"] = "Soulharvester Duuren", ["count"] = 10 },
        [195929] = { ["name"] = "Soulharvester Tumen", ["count"] = 10 },
        [195930] = { ["name"] = "Soulharvester Mandakh", ["count"] = 10 },
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
        [196263] = { ["name"] = "Nokhud Neophyte", ["count"] = 5 },
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
        [199037] = { ["name"] = "Primalist Shocktrooper", ["count"] = 5 },
        [199717] = { ["name"] = "Nokhud Defender", ["count"] = 10 },
    }
end
