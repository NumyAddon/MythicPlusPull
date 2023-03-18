local _, ns = ...

local data = {};
tinsert(ns.data, data)

function data:GetPatchVersion()
    return {
        timestamp = 1679137519,
        version = '10.1.0',
        build = 48537,
    }
end

function data:GetDungeonOverrides()
    return {
        [391] = { -- Tazavesh: Streets of Wonder
            [189878] = { ["name"] = "Nathrezim Infiltrator", ["count"] = 3 },
            [190128] = { ["name"] = "Zul'gamux", ["count"] = 9 },
        },
        [392] = { -- Tazavesh: So'leah's Gambit
            [189878] = { ["name"] = "Nathrezim Infiltrator", ["count"] = 6 },
            [190128] = { ["name"] = "Zul'gamux", ["count"] = 18 },
        },
    }
end

function data:GetNPCData()
    -- data is sorted with natural sorting by NPC ID
    return {
        [160495] = { ["name"] = "Maniacal Soulbinder", ["count"] = 4 },
        [162038] = { ["name"] = "Regal Mistdancer", ["count"] = 7 },
        [162039] = { ["name"] = "Wicked Oppressor", ["count"] = 4 },
        [162040] = { ["name"] = "Grand Overseer", ["count"] = 7 },
        [162041] = { ["name"] = "Grubby Dirtcruncher", ["count"] = 2 },
        [162046] = { ["name"] = "Famished Tick", ["count"] = 1 },
        [162047] = { ["name"] = "Insatiable Brute", ["count"] = 7 },
        [162049] = { ["name"] = "Vestige of Doubt", ["count"] = 4 },
        [162051] = { ["name"] = "Frenzied Ghoul", ["count"] = 2 },
        [162056] = { ["name"] = "Rockbound Sprite", ["count"] = 1 },
        [162057] = { ["name"] = "Chamber Sentinel", ["count"] = 7 },
        [162158] = { ["name"] = "Starving Prisoner", ["count"] = 1 },
        [162729] = { ["name"] = "Patchwerk Soldier", ["count"] = 4 },
        [162744] = { ["name"] = "Nekthara the Mangler", ["count"] = 20 },
        [162763] = { ["name"] = "Soulforged Bonereaver", ["count"] = 8 },
        [163058] = { ["name"] = "Mistveil Defender", ["count"] = 4 },
        [163086] = { ["name"] = "Rancid Gasbag", ["count"] = 8 },
        [163089] = { ["name"] = "Disgusting Refuse", ["count"] = 1 },
        [163121] = { ["name"] = "Stitched Vanguard", ["count"] = 5 },
        [163128] = { ["name"] = "Zolramus Sorcerer", ["count"] = 4 },
        [163457] = { ["name"] = "Forsworn Vanguard", ["count"] = 4 },
        [163458] = { ["name"] = "Forsworn Castigator", ["count"] = 4 },
        [163459] = { ["name"] = "Forsworn Mender", ["count"] = 4 },
        [163501] = { ["name"] = "Forsworn Skirmisher", ["count"] = 4 },
        [163503] = { ["name"] = "Etherdiver", ["count"] = 2 },
        [163506] = { ["name"] = "Forsworn Stealthclaw", ["count"] = 4 },
        [163520] = { ["name"] = "Forsworn Squad-Leader", ["count"] = 6 },
        [163524] = { ["name"] = "Kyrian Dark-Praetor", ["count"] = 5 },
        [163610] = { ["name"] = "Rot Flinger", ["count"] = 4 },
        [163618] = { ["name"] = "Zolramus Necromancer", ["count"] = 8 },
        [163619] = { ["name"] = "Zolramus Bonecarver", ["count"] = 4 },
        [163620] = { ["name"] = "Rotspew", ["count"] = 6 },
        [163621] = { ["name"] = "Goregrind", ["count"] = 6 },
        [163857] = { ["name"] = "Plaguebound Devoted", ["count"] = 4 },
        [163862] = { ["name"] = "Defender of Many Eyes", ["count"] = 8 },
        [163882] = { ["name"] = "Decaying Flesh Giant", ["count"] = 14 },
        [163891] = { ["name"] = "Rotmarrow Slime", ["count"] = 6 },
        [163892] = { ["name"] = "Rotting Slimeclaw", ["count"] = 6 },
        [163894] = { ["name"] = "Blighted Spinebreaker", ["count"] = 12 },
        [163915] = { ["name"] = "Hatchling Nest", ["count"] = 10 },
        [164506] = { ["name"] = "Ancient Captain", ["count"] = 5 },
        [164510] = { ["name"] = "Shambling Arbalest", ["count"] = 4 },
        [164557] = { ["name"] = "Shard of Halkias", ["count"] = 10 },
        [164562] = { ["name"] = "Depraved Houndmaster", ["count"] = 4 },
        [164563] = { ["name"] = "Vicious Gargon", ["count"] = 4 },
        [164705] = { ["name"] = "Pestilence Slime", ["count"] = 6 },
        [164707] = { ["name"] = "Congealed Slime", ["count"] = 6 },
        [164737] = { ["name"] = "Brood Ambusher", ["count"] = 12 },
        [164857] = { ["name"] = "Spriggan Mendbender", ["count"] = 2 },
        [164861] = { ["name"] = "Spriggan Barkbinder", ["count"] = 2 },
        [164862] = { ["name"] = "Weald Shimmermoth", ["count"] = 3 },
        [164873] = { ["name"] = "Runestag Elderhorn", ["count"] = 4 },
        [164920] = { ["name"] = "Drust Soulcleaver", ["count"] = 4 },
        [164921] = { ["name"] = "Drust Harvester", ["count"] = 4 },
        [164926] = { ["name"] = "Drust Boughbreaker", ["count"] = 6 },
        [164929] = { ["name"] = "Tirnenn Villager", ["count"] = 7 },
        [165076] = { ["name"] = "Gluttonous Tick", ["count"] = 4 },
        [165111] = { ["name"] = "Drust Spiteclaw", ["count"] = 2 },
        [165137] = { ["name"] = "Zolramus Gatekeeper", ["count"] = 6 },
        [165138] = { ["name"] = "Blight Bag", ["count"] = 1 },
        [165197] = { ["name"] = "Skeletal Monstrosity", ["count"] = 12 },
        [165222] = { ["name"] = "Zolramus Bonemender", ["count"] = 4 },
        [165414] = { ["name"] = "Depraved Obliterator", ["count"] = 4 },
        [165415] = { ["name"] = "Toiling Groundskeeper", ["count"] = 2 },
        [165515] = { ["name"] = "Depraved Darkblade", ["count"] = 4 },
        [165529] = { ["name"] = "Depraved Collector", ["count"] = 4 },
        [165824] = { ["name"] = "Nar'zudah", ["count"] = 15 },
        [165872] = { ["name"] = "Flesh Crafter", ["count"] = 4 },
        [165911] = { ["name"] = "Loyal Creation", ["count"] = 4 },
        [165919] = { ["name"] = "Skeletal Marauder", ["count"] = 6 },
        [166275] = { ["name"] = "Mistveil Shaper", ["count"] = 4 },
        [166276] = { ["name"] = "Mistveil Guardian", ["count"] = 4 },
        [166299] = { ["name"] = "Mistveil Tender", ["count"] = 4 },
        [166301] = { ["name"] = "Mistveil Stalker", ["count"] = 4 },
        [166302] = { ["name"] = "Corpse Harvester", ["count"] = 4 },
        [166304] = { ["name"] = "Mistveil Stinger", ["count"] = 4 },
        [166396] = { ["name"] = "Noble Skirmisher", ["count"] = 4 },
        [166411] = { ["name"] = "Forsworn Usurper", ["count"] = 1 },
        [167111] = { ["name"] = "Spinemaw Staghorn", ["count"] = 5 },
        [167113] = { ["name"] = "Spinemaw Acidgullet", ["count"] = 4 },
        [167116] = { ["name"] = "Spinemaw Reaver", ["count"] = 4 },
        [167117] = { ["name"] = "Spinemaw Larva", ["count"] = 1 },
        [167493] = { ["name"] = "Venomous Sniper", ["count"] = 8 },
        [167532] = { ["name"] = "Heavin the Breaker", ["count"] = 20 },
        [167533] = { ["name"] = "Advent Nevermore", ["count"] = 20 },
        [167534] = { ["name"] = "Rek the Hardened", ["count"] = 20 },
        [167536] = { ["name"] = "Harugia the Bloodthirsty", ["count"] = 20 },
        [167538] = { ["name"] = "Dokigg the Brutalizer", ["count"] = 20 },
        [167607] = { ["name"] = "Stoneborn Slasher", ["count"] = 7 },
        [167610] = { ["name"] = "Stonefiend Anklebiter", ["count"] = 1 },
        [167611] = { ["name"] = "Stoneborn Eviscerator", ["count"] = 4 },
        [167612] = { ["name"] = "Stoneborn Reaver", ["count"] = 6 },
        [167615] = { ["name"] = "Depraved Darkblade", ["count"] = 4 },
        [167731] = { ["name"] = "Separation Assistant", ["count"] = 4 },
        [167876] = { ["name"] = "Inquisitor Sigar", ["count"] = 20 },
        [167955] = { ["name"] = "Sanguine Cadet", ["count"] = 1 },
        [167956] = { ["name"] = "Dark Acolyte", ["count"] = 1 },
        [167962] = { ["name"] = "Defunct Dental Drill", ["count"] = 8 },
        [167963] = { ["name"] = "Headless Client", ["count"] = 5 },
        [167964] = { ["name"] = "4.RF-4.RF", ["count"] = 8 },
        [167965] = { ["name"] = "Lubricator", ["count"] = 5 },
        [167967] = { ["name"] = "Sentient Oil", ["count"] = 6 },
        [167994] = { ["name"] = "Ossified Conscript", ["count"] = 4 },
        [167998] = { ["name"] = "Portal Guardian", ["count"] = 8 },
        [168022] = { ["name"] = "Slime Tentacle", ["count"] = 10 },
        [168058] = { ["name"] = "Infused Quill-feather", ["count"] = 1 },
        [168153] = { ["name"] = "Plagueroc", ["count"] = 12 },
        [168310] = { ["name"] = "Plagueroc", ["count"] = 12 },
        [168318] = { ["name"] = "Forsworn Goliath", ["count"] = 8 },
        [168361] = { ["name"] = "Fen Hornet", ["count"] = 8 },
        [168393] = { ["name"] = "Plaguebelcher", ["count"] = 12 },
        [168396] = { ["name"] = "Plaguebelcher", ["count"] = 12 },
        [168418] = { ["name"] = "Forsworn Inquisitor", ["count"] = 4 },
        [168420] = { ["name"] = "Forsworn Champion", ["count"] = 4 },
        [168425] = { ["name"] = "Forsworn Annihilator", ["count"] = 8 },
        [168572] = { ["name"] = "Fungi Stormer", ["count"] = 8 },
        [168574] = { ["name"] = "Pestilent Harvester", ["count"] = 8 },
        [168578] = { ["name"] = "Fungalmancer", ["count"] = 8 },
        [168580] = { ["name"] = "Plagueborer", ["count"] = 8 },
        [168591] = { ["name"] = "Ravenous Dreadbat", ["count"] = 4 },
        [168594] = { ["name"] = "Chamber Sentinel", ["count"] = 7 },
        [168627] = { ["name"] = "Plaguebinder", ["count"] = 8 },
        [168658] = { ["name"] = "Forsworn Devastator", ["count"] = 8 },
        [168681] = { ["name"] = "Forsworn Helion", ["count"] = 6 },
        [168717] = { ["name"] = "Forsworn Justicar", ["count"] = 4 },
        [168718] = { ["name"] = "Forsworn Warden", ["count"] = 4 },
        [168843] = { ["name"] = "Klotos", ["count"] = 12 },
        [168844] = { ["name"] = "Lakesis", ["count"] = 12 },
        [168845] = { ["name"] = "Astronos", ["count"] = 12 },
        [168878] = { ["name"] = "Wretched Plagueborer", ["count"] = 8 },
        [168886] = { ["name"] = "Virulax Blightweaver", ["count"] = 25 },
        [168907] = { ["name"] = "Slime Tentacle", ["count"] = 10 },
        [168934] = { ["name"] = "Enraged Spirit", ["count"] = 8 },
        [168942] = { ["name"] = "Death Speaker", ["count"] = 6 },
        [168949] = { ["name"] = "Risen Bonesoldier", ["count"] = 4 },
        [168953] = { ["name"] = "Plaguebelcher", ["count"] = 12 },
        [168969] = { ["name"] = "Gushing Slime", ["count"] = 1 },
        [168986] = { ["name"] = "Skeletal Raptor", ["count"] = 3 },
        [168992] = { ["name"] = "Risen Cultist", ["count"] = 4 },
        [169696] = { ["name"] = "Mire Soldier", ["count"] = 8 },
        [169861] = { ["name"] = "Ickor Bileflesh", ["count"] = 25 },
        [169875] = { ["name"] = "Shackled Soul", ["count"] = 2 },
        [169893] = { ["name"] = "Nefarious Darkspeaker", ["count"] = 6 },
        [169905] = { ["name"] = "Risen Warlord", ["count"] = 6 },
        [169927] = { ["name"] = "Putrid Butcher", ["count"] = 5 },
        [170480] = { ["name"] = "Atal'ai Deathwalker", ["count"] = 5 },
        [170486] = { ["name"] = "Atal'ai Devoted", ["count"] = 2 },
        [170488] = { ["name"] = "Son of Hakkar", ["count"] = 1 },
        [170490] = { ["name"] = "Atal'ai High Priest", ["count"] = 5 },
        [170572] = { ["name"] = "Atal'ai Hoodoo Hexxer", ["count"] = 6 },
        [170690] = { ["name"] = "Diseased Horror", ["count"] = 4 },
        [170838] = { ["name"] = "Unyielding Contender", ["count"] = 4 },
        [170850] = { ["name"] = "Raging Bloodhorn", ["count"] = 7 },
        [170882] = { ["name"] = "Bone Magus", ["count"] = 4 },
        [171181] = { ["name"] = "Territorial Bladebeak", ["count"] = 4 },
        [171184] = { ["name"] = "Mythresh, Sky's Talons", ["count"] = 12 },
        [171341] = { ["name"] = "Bladebeak Hatchling", ["count"] = 1 },
        [171342] = { ["name"] = "Juvenile Runestag", ["count"] = 2 },
        [171343] = { ["name"] = "Bladebeak Matriarch", ["count"] = 5 },
        [171376] = { ["name"] = "Head Custodian Javlin", ["count"] = 10 },
        [171384] = { ["name"] = "Research Scribe", ["count"] = 4 },
        [171448] = { ["name"] = "Dreadful Huntmaster", ["count"] = 4 },
        [171455] = { ["name"] = "Stonewall Gargon", ["count"] = 1 },
        [171500] = { ["name"] = "Shuffling Corpse", ["count"] = 1 },
        [171772] = { ["name"] = "Mistveil Defender", ["count"] = 4 },
        [171799] = { ["name"] = "Depths Warden", ["count"] = 7 },
        [171805] = { ["name"] = "Research Scribe", ["count"] = 4 },
        [172265] = { ["name"] = "Remnant of Fury", ["count"] = 4 },
        [172312] = { ["name"] = "Spinemaw Gorger", ["count"] = 4 },
        [172981] = { ["name"] = "Kyrian Stitchwerk", ["count"] = 5 },
        [173016] = { ["name"] = "Corpse Collector", ["count"] = 4 },
        [173044] = { ["name"] = "Stitching Assistant", ["count"] = 4 },
        [173339] = { ["name"] = "Plaguebelcher", ["count"] = 12 },
        [173655] = { ["name"] = "Mistveil Matriarch", ["count"] = 16 },
        [173714] = { ["name"] = "Mistveil Nightblossom", ["count"] = 16 },
        [173720] = { ["name"] = "Mistveil Gorgegullet", ["count"] = 16 },
        [173840] = { ["name"] = "Plaguebound Devoted", ["count"] = 4 },
        [174175] = { ["name"] = "Loyal Stoneborn", ["count"] = 4 },
        [174197] = { ["name"] = "Battlefield Ritualist", ["count"] = 4 },
        [174210] = { ["name"] = "Blighted Sludge-Spewer", ["count"] = 4 },
        [176394] = { ["name"] = "P.O.S.T. Worker", ["count"] = 5 },
        [176395] = { ["name"] = "Overloaded Mailemental", ["count"] = 5 },
        [176396] = { ["name"] = "Defective Sorter", ["count"] = 3 },
        [177807] = { ["name"] = "Customs Security", ["count"] = 4 },
        [177808] = { ["name"] = "Armored Overseer", ["count"] = 8 },
        [177816] = { ["name"] = "Interrogation Specialist", ["count"] = 4 },
        [177817] = { ["name"] = "Support Officer", ["count"] = 4 },
        [178133] = { ["name"] = "Murkbrine Wavejumper", ["count"] = 2 },
        [178139] = { ["name"] = "Murkbrine Shellcrusher", ["count"] = 3 },
        [178141] = { ["name"] = "Murkbrine Scalebinder", ["count"] = 2 },
        [178142] = { ["name"] = "Murkbrine Fishmancer", ["count"] = 2 },
        [178163] = { ["name"] = "Murkbrine Shorerunner", ["count"] = 1 },
        [178165] = { ["name"] = "Coastwalker Goliath", ["count"] = 18 },
        [178171] = { ["name"] = "Stormforged Guardian", ["count"] = 10 },
        [178392] = { ["name"] = "Gatewarden Zo'mazz", ["count"] = 18 },
        [179334] = { ["name"] = "Portalmancer Zo'honn", ["count"] = 24 },
        [179386] = { ["name"] = "Corsair Officer", ["count"] = 5 },
        [179388] = { ["name"] = "Hourglass Tidesage", ["count"] = 4 },
        [179821] = { ["name"] = "Commander Zo'far", ["count"] = 24 },
        [179837] = { ["name"] = "Tracker Zo'korss", ["count"] = 18 },
        [179840] = { ["name"] = "Market Peacekeeper", ["count"] = 4 },
        [179841] = { ["name"] = "Veteran Sparkcaster", ["count"] = 4 },
        [179842] = { ["name"] = "Commerce Enforcer", ["count"] = 8 },
        [179893] = { ["name"] = "Cartel Skulker", ["count"] = 4 },
        [180015] = { ["name"] = "Burly Deckhand", ["count"] = 5 },
        [180091] = { ["name"] = "Ancient Core Hound", ["count"] = 12 },
        [180335] = { ["name"] = "Cartel Smuggler", ["count"] = 5 },
        [180336] = { ["name"] = "Cartel Wiseguy", ["count"] = 5 },
        [180348] = { ["name"] = "Cartel Muscle", ["count"] = 8 },
        [180429] = { ["name"] = "Adorned Starseer", ["count"] = 12 },
        [180431] = { ["name"] = "Focused Ritualist", ["count"] = 4 },
        [180432] = { ["name"] = "Devoted Accomplice", ["count"] = 5 },
        [180495] = { ["name"] = "Enraged Direhorn", ["count"] = 10 },
        [180567] = { ["name"] = "Frenzied Nightclaw", ["count"] = 4 },
    }
end
