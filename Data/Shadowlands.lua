-- upvalue the globals
local _G = getfenv(0)
local LibStub = _G.LibStub

local name = ...

-- /run MMPE = LibStub('AceAddon-3.0'):GetAddon("MythicPlusPullReEstimated");
local MMPE = LibStub('AceAddon-3.0'):GetAddon(name);
if not MMPE then return end

MMPE.data = MMPE.data or {}
MMPEData = MMPE.data

function MMPEData:GetNPCData()
    return {
        [164501] = {
            ["name"] = "Mistcaller",
            ["count"] = 0,
        },
        [165872] = {
            ["name"] = "Flesh Crafter",
            ["count"] = 4,
        },
        [173044] = {
            ["name"] = "Stitching Assistant",
            ["count"] = 4,
        },
        [173714] = {
            ["name"] = "Mistveil Nightblossom",
            ["count"] = 16,
        },
        [167116] = {
            ["name"] = "Spinemaw Reaver",
            ["count"] = 4,
        },
        [172312] = {
            ["name"] = "Spinemaw Gorger",
            ["count"] = 4,
        },
        [167117] = {
            ["name"] = "Spinemaw Larva",
            ["count"] = 1,
        },
        [168934] = {
            ["name"] = "Enraged Spirit",
            ["count"] = 8,
        },
        [164185] = {
            ["name"] = "Echelon",
            ["count"] = 0,
        },
        [167532] = {
            ["name"] = "Heavin the Breaker",
            ["count"] = 20,
        },
        [168361] = {
            ["name"] = "Fen Hornet",
            ["count"] = 8,
        },
        [166608] = {
            ["name"] = "Mueh'zala",
            ["count"] = 0,
        },
        [167533] = {
            ["name"] = "Advent Nevermore",
            ["count"] = 20,
        },
        [170147] = {
            ["name"] = "Volatile Memory",
            ["count"] = 0,
        },
        [169159] = {
            ["name"] = "Unstable Canister",
            ["count"] = 0,
        },
        [165111] = {
            ["name"] = "Drust Spiteclaw",
            ["count"] = 2,
        },
        [168968] = {
            ["name"] = "Plaguebound Fallen",
            ["count"] = 0,
        },
        [164920] = {
            ["name"] = "Drust Soulcleaver",
            ["count"] = 4,
        },
        [167534] = {
            ["name"] = "Rek the Hardened",
            ["count"] = 20,
        },
        [169861] = {
            ["name"] = "Ickor Bileflesh",
            ["count"] = 25,
        },
        [169893] = {
            ["name"] = "Nefarious Darkspeaker",
            ["count"] = 6,
        },
        [170690] = {
            ["name"] = "Diseased Horror",
            ["count"] = 4,
        },
        [164857] = {
            ["name"] = "Spriggan Mendbender",
            ["count"] = 2,
        },
        [168969] = {
            ["name"] = "Gushing Slime",
            ["count"] = 1,
        },
        [164921] = {
            ["name"] = "Drust Harvester",
            ["count"] = 4,
        },
        [170850] = {
            ["name"] = "Raging Bloodhorn",
            ["count"] = 7,
        },
        [170882] = {
            ["name"] = "Bone Magus",
            ["count"] = 4,
        },
        [168396] = {
            ["name"] = "Plaguebelcher",
            ["count"] = 12,
        },
        [168747] = {
            ["name"] = "Venomfang",
            ["count"] = 0,
        },
        [162691] = {
            ["name"] = "Blightbone",
            ["count"] = 0,
        },
        [168843] = {
            ["name"] = "Klotos",
            ["count"] = 12,
        },
        [173720] = {
            ["name"] = "Mistveil Gorgegullet",
            ["count"] = 16,
        },
        [169927] = {
            ["name"] = "Putrid Butcher",
            ["count"] = 5,
        },
        [162309] = {
            ["name"] = "Kul'tharok",
            ["count"] = 0,
        },
        [165911] = {
            ["name"] = "Loyal Creation",
            ["count"] = 4,
        },
        [163457] = {
            ["name"] = "Forsworn Vanguard",
            ["count"] = 4,
        },
        [168844] = {
            ["name"] = "Lakesis",
            ["count"] = 12,
        },
        [168717] = {
            ["name"] = "Forsworn Justicar",
            ["count"] = 4,
        },
        [162693] = {
            ["name"] = "Nalthor the Rimebinder",
            ["count"] = 0,
        },
        [164255] = {
            ["name"] = "Globgrog",
            ["count"] = 0,
        },
        [164861] = {
            ["name"] = "Spriggan Barkbinder",
            ["count"] = 2,
        },
        [163618] = {
            ["name"] = "Zolramus Necromancer",
            ["count"] = 8,
        },
        [162689] = {
            ["name"] = "Surgeon Stitchflesh",
            ["count"] = 0,
        },
        [166264] = {
            ["name"] = "Spare Parts",
            ["count"] = 0,
        },
        [168591] = {
            ["name"] = "Ravenous Dreadbat",
            ["count"] = 4,
        },
        [168878] = {
            ["name"] = "Rigged Plagueborer",
            ["count"] = 8,
        },
        [160495] = {
            ["name"] = "Maniacal Soulbinder",
            ["count"] = 4,
        },
        [168942] = {
            ["name"] = "Death Speaker",
            ["count"] = 6,
        },
        [163619] = {
            ["name"] = "Zolramus Bonecarver",
            ["count"] = 4,
        },
        [165946] = {
            ["name"] = "Mordretha, the Endless Empress",
            ["count"] = 0,
        },
        [171333] = {
            ["name"] = "Atal'ai Devoted",
            ["count"] = 2,
        },
        [165824] = {
            ["name"] = "Nar'zudah",
            ["count"] = 15,
        },
        [171455] = {
            ["name"] = "Stonewall Gargon",
            ["count"] = 1,
        },
        [163524] = {
            ["name"] = "Kyrian Dark-Praetor",
            ["count"] = 5,
        },
        [169696] = {
            ["name"] = "Mire Soldier",
            ["count"] = 8,
        },
        [162058] = {
            ["name"] = "Ventunax",
            ["count"] = 0,
        },
        [163620] = {
            ["name"] = "Rotspew",
            ["count"] = 6,
        },
        [174197] = {
            ["name"] = "Battlefield Ritualist",
            ["count"] = 4,
        },
        [173016] = {
            ["name"] = "Corpse Collector",
            ["count"] = 4,
        },
        [162051] = {
            ["name"] = "Frenzied Ghoul",
            ["count"] = 2,
        },
        [168365] = {
            ["name"] = "Fungret Shroomtender",
            ["count"] = 0,
        },
        [173655] = {
            ["name"] = "Mistveil Matriarch",
            ["count"] = 16,
        },
        [167892] = {
            ["name"] = "Tormented Soul",
            ["count"] = 0,
        },
        [162059] = {
            ["name"] = "Kin-Tara",
            ["count"] = 0,
        },
        [163621] = {
            ["name"] = "Goregrind",
            ["count"] = 6,
        },
        [163894] = {
            ["name"] = "Blighted Spinebreaker",
            ["count"] = 12,
        },
        [164450] = {
            ["name"] = "Dealer Xy'exa",
            ["count"] = 0,
        },
        [164737] = {
            ["name"] = "Brood Ambusher",
            ["count"] = 12,
        },
        [162729] = {
            ["name"] = "Patchwerk Soldier",
            ["count"] = 4,
        },
        [165137] = {
            ["name"] = "Zolramus Gatekeeper",
            ["count"] = 6,
        },
        [164578] = {
            ["name"] = "Stitchflesh's Creation",
            ["count"] = 0,
        },
        [162060] = {
            ["name"] = "Oryphrion",
            ["count"] = 0,
        },
        [163622] = {
            ["name"] = "Goregrind Bits",
            ["count"] = 0,
        },
        [164929] = {
            ["name"] = "Tirnenn Villager",
            ["count"] = 7,
        },
        [164451] = {
            ["name"] = "Dessia the Decapitator",
            ["count"] = 0,
        },
        [168022] = {
            ["name"] = "Slime Tentacle",
            ["count"] = 10,
        },
        [167113] = {
            ["name"] = "Spinemaw Acidgullet",
            ["count"] = 4,
        },
        [168627] = {
            ["name"] = "Plaguebinder",
            ["count"] = 8,
        },
        [164510] = {
            ["name"] = "Shambling Arbalest",
            ["count"] = 4,
        },
        [166396] = {
            ["name"] = "Noble Skirmisher",
            ["count"] = 4,
        },
        [163623] = {
            ["name"] = "Rotspew Leftovers",
            ["count"] = 0,
        },
        [162057] = {
            ["name"] = "Chamber Sentinel",
            ["count"] = 7,
        },
        [164707] = {
            ["name"] = "Congealed Slime",
            ["count"] = 6,
        },
        [169875] = {
            ["name"] = "Shackled Soul",
            ["count"] = 2,
        },
        [166301] = {
            ["name"] = "Mistveil Stalker",
            ["count"] = 4,
        },
        [162763] = {
            ["name"] = "Soulforged Bonereaver",
            ["count"] = 8,
        },
        [163892] = {
            ["name"] = "Rotting Slimeclaw",
            ["count"] = 6,
        },
        [162317] = {
            ["name"] = "Gorechop",
            ["count"] = 0,
        },
        [165919] = {
            ["name"] = "Skeletal Marauder",
            ["count"] = 6,
        },
        [165529] = {
            ["name"] = "Depraved Collector",
            ["count"] = 4,
        },
        [167607] = {
            ["name"] = "Stoneborn Slasher",
            ["count"] = 7,
        },
        [174175] = {
            ["name"] = "Loyal Stoneborn",
            ["count"] = 4,
        },
        [164517] = {
            ["name"] = "Tred'ova",
            ["count"] = 0,
        },
        [164804] = {
            ["name"] = "Droman Oulfarran",
            ["count"] = 0,
        },
        [166302] = {
            ["name"] = "Corpse Harvester",
            ["count"] = 4,
        },
        [164563] = {
            ["name"] = "Vicious Gargon",
            ["count"] = 4,
        },
        [165410] = {
            ["name"] = "High Adjudicator Aleez",
            ["count"] = 0,
        },
        [164967] = {
            ["name"] = "Doctor Ickus",
            ["count"] = 0,
        },
        [171500] = {
            ["name"] = "Shuffling Corpse",
            ["count"] = 1,
        },
        [163157] = {
            ["name"] = "Amarth",
            ["count"] = 0,
        },
        [164506] = {
            ["name"] = "Ancient Captain",
            ["count"] = 5,
        },
        [167610] = {
            ["name"] = "Stonefiend Anklebiter",
            ["count"] = 1,
        },
        [164266] = {
            ["name"] = "Domina Venomblade",
            ["count"] = 0,
        },
        [168949] = {
            ["name"] = "Risen Bonesoldier",
            ["count"] = 4,
        },
        [162056] = {
            ["name"] = "Rockbound Sprite",
            ["count"] = 1,
        },
        [167964] = {
            ["name"] = "4.RF-4.RF",
            ["count"] = 8,
        },
        [167111] = {
            ["name"] = "Spinemaw Staghorn",
            ["count"] = 5,
        },
        [165414] = {
            ["name"] = "Depraved Obliterator",
            ["count"] = 4,
        },
        [166304] = {
            ["name"] = "Mistveil Stinger",
            ["count"] = 4,
        },
        [167611] = {
            ["name"] = "Stoneborn Eviscerator",
            ["count"] = 4,
        },
        [168153] = {
            ["name"] = "Plagueroc",
            ["count"] = 12,
        },
        [172265] = {
            ["name"] = "Remnant of Fury",
            ["count"] = 4,
        },
        [163882] = {
            ["name"] = "Decaying Flesh Giant",
            ["count"] = 14,
        },
        [167994] = {
            ["name"] = "Ossified Conscript",
            ["count"] = 4,
        },
        [171341] = {
            ["name"] = "Bladebeak Hatchling",
            ["count"] = 1,
        },
        [168058] = {
            ["name"] = "Infused Quill-feather",
            ["count"] = 1,
        },
        [174210] = {
            ["name"] = "Blighted Sludge-Spewer",
            ["count"] = 4,
        },
        [167612] = {
            ["name"] = "Stoneborn Reaver",
            ["count"] = 6,
        },
        [166299] = {
            ["name"] = "Mistveil Tender",
            ["count"] = 4,
        },
        [163086] = {
            ["name"] = "Rancid Gasbag",
            ["count"] = 8,
        },
        [167963] = {
            ["name"] = "Headless Client",
            ["count"] = 5,
        },
        [163915] = {
            ["name"] = "Hatchling Nest",
            ["count"] = 10,
        },
        [165222] = {
            ["name"] = "Zolramus Bonemender",
            ["count"] = 4,
        },
        [164926] = {
            ["name"] = "Drust Boughbreaker",
            ["count"] = 6,
        },
        [163501] = {
            ["name"] = "Forsworn Skirmisher",
            ["count"] = 4,
        },
        [167967] = {
            ["name"] = "Sentient Oil",
            ["count"] = 6,
        },
        [168155] = {
            ["name"] = "Plaguebound",
            ["count"] = 0,
        },
        [163126] = {
            ["name"] = "Brittlebone Mage",
            ["count"] = 0,
        },
        [162099] = {
            ["name"] = "General Kaal",
            ["count"] = 0,
        },
        [166276] = {
            ["name"] = "Mistveil Guardian",
            ["count"] = 4,
        },
        [171343] = {
            ["name"] = "Bladebeak Matriarch",
            ["count"] = 5,
        },
        [166275] = {
            ["name"] = "Mistveil Shaper",
            ["count"] = 4,
        },
        [164267] = {
            ["name"] = "Margrave Stradama",
            ["count"] = 0,
        },
        [171184] = {
            ["name"] = "Mythresh, Sky's Talons",
            ["count"] = 12,
        },
        [168986] = {
            ["name"] = "Skeletal Raptor",
            ["count"] = 3,
        },
        [164873] = {
            ["name"] = "Runestag Elderhorn",
            ["count"] = 4,
        },
        [162100] = {
            ["name"] = "Kryxis the Voracious",
            ["count"] = 0,
        },
        [167538] = {
            ["name"] = "Dokigg the Brutalizer",
            ["count"] = 20,
        },
        [170838] = {
            ["name"] = "Unyielding Contender",
            ["count"] = 4,
        },
        [171376] = {
            ["name"] = "Head Custodian Javlin",
            ["count"] = 10,
        },
        [163503] = {
            ["name"] = "Etherdiver",
            ["count"] = 2,
        },
        [164555] = {
            ["name"] = "Millificent Manastorm",
            ["count"] = 0,
        },
        [172981] = {
            ["name"] = "Kyrian Stitchwerk",
            ["count"] = 5,
        },
        [163089] = {
            ["name"] = "Disgusting Refuse",
            ["count"] = 1,
        },
        [163121] = {
            ["name"] = "Stitched Vanguard",
            ["count"] = 5,
        },
        [167998] = {
            ["name"] = "Portal Guardian",
            ["count"] = 8,
        },
        [170572] = {
            ["name"] = "Atal'ai Hoodoo Hexxer",
            ["count"] = 6,
        },
        [168572] = {
            ["name"] = "Fungi Stormer",
            ["count"] = 8,
        },
        [163122] = {
            ["name"] = "Brittlebone Warrior",
            ["count"] = 0,
        },
        [164556] = {
            ["name"] = "Millhouse Manastorm",
            ["count"] = 0,
        },
        [162038] = {
            ["name"] = "Regal Mistdancer",
            ["count"] = 7,
        },
        [167536] = {
            ["name"] = "Harugia the Bloodthirsty",
            ["count"] = 20,
        },
        [162102] = {
            ["name"] = "Grand Proctor Beryllia",
            ["count"] = 0,
        },
        [164567] = {
            ["name"] = "Ingra Maloch",
            ["count"] = 0,
        },
        [164461] = {
            ["name"] = "Sathel the Accursed",
            ["count"] = 0,
        },
        [168318] = {
            ["name"] = "Forsworn Goliath",
            ["count"] = 8,
        },
        [171474] = {
            ["name"] = "Finger Food",
            ["count"] = 0,
        },
        [164557] = {
            ["name"] = "Shard of Halkias",
            ["count"] = 10,
        },
        [162039] = {
            ["name"] = "Wicked Oppressor",
            ["count"] = 4,
        },
        [164862] = {
            ["name"] = "Weald Shimmermoth",
            ["count"] = 3,
        },
        [162103] = {
            ["name"] = "Executor Tarvold",
            ["count"] = 0,
        },
        [171342] = {
            ["name"] = "Juvenile Runestag",
            ["count"] = 2,
        },
        [163459] = {
            ["name"] = "Forsworn Mender",
            ["count"] = 4,
        },
        [168574] = {
            ["name"] = "Pestilent Harvester",
            ["count"] = 8,
        },
        [163506] = {
            ["name"] = "Forsworn Stealthclaw",
            ["count"] = 4,
        },
        [164558] = {
            ["name"] = "Hakkar the Soulflayer",
            ["count"] = 0,
        },
        [162040] = {
            ["name"] = "Grand Overseer",
            ["count"] = 7,
        },
        [163857] = {
            ["name"] = "Plaguebound Devoted",
            ["count"] = 4,
        },
        [167962] = {
            ["name"] = "Defunct Dental Drill",
            ["count"] = 8,
        },
        [171181] = {
            ["name"] = "Territorial Bladebeak",
            ["count"] = 4,
        },
        [164463] = {
            ["name"] = "Paceran the Virulent",
            ["count"] = 0,
        },
        [165515] = {
            ["name"] = "Depraved Darkblade",
            ["count"] = 4,
        },
        [163458] = {
            ["name"] = "Forsworn Castigator",
            ["count"] = 4,
        },
        [168718] = {
            ["name"] = "Forsworn Warden",
            ["count"] = 4,
        },
        [162041] = {
            ["name"] = "Grubby Dirtcruncher",
            ["count"] = 2,
        },
        [167731] = {
            ["name"] = "Separation Assistant",
            ["count"] = 4,
        },
        [163520] = {
            ["name"] = "Forsworn Squad-Leader",
            ["count"] = 6,
        },
        [165197] = {
            ["name"] = "Skeletal Monstrosity",
            ["count"] = 12,
        },
        [164464] = {
            ["name"] = "Xira the Underhanded",
            ["count"] = 0,
        },
        [163058] = {
            ["name"] = "Mistveil Defender",
            ["count"] = 4,
        },
        [168845] = {
            ["name"] = "Astronos",
            ["count"] = 12,
        },
        [163077] = {
            ["name"] = "Azules",
            ["count"] = 0,
        },
        [168681] = {
            ["name"] = "Forsworn Helion",
            ["count"] = 6,
        },
        [162329] = {
            ["name"] = "Xav the Unfallen",
            ["count"] = 0,
        },
        [163891] = {
            ["name"] = "Rotmarrow Slime",
            ["count"] = 6,
        },
        [167493] = {
            ["name"] = "Venomous Sniper",
            ["count"] = 8,
        },
        [167965] = {
            ["name"] = "Lubricator",
            ["count"] = 5,
        },
        [166079] = {
            ["name"] = "Brittlebone Crossbowman",
            ["count"] = 0,
        },
        [162744] = {
            ["name"] = "Nekthara the Mangler",
            ["count"] = 20,
        },
        [167876] = {
            ["name"] = "Inquisitor Sigar",
            ["count"] = 20,
        },
        [168418] = {
            ["name"] = "Forsworn Inquisitor",
            ["count"] = 4,
        },
        [170490] = {
            ["name"] = "Atal'ai High Priest",
            ["count"] = 5,
        },
        [168992] = {
            ["name"] = "Risen Cultist",
            ["count"] = 4,
        },
        [165408] = {
            ["name"] = "Halkias",
            ["count"] = 0,
        },
        [164218] = {
            ["name"] = "Lord Chamberlain",
            ["count"] = 0,
        },
        [168578] = {
            ["name"] = "Fungalmancer",
            ["count"] = 8,
        },
        [168886] = {
            ["name"] = "Virulax Blightweaver",
            ["count"] = 25,
        },
        [164562] = {
            ["name"] = "Depraved Houndmaster",
            ["count"] = 4,
        },
        [165415] = {
            ["name"] = "Toiling Groundskeeper",
            ["count"] = 2,
        },
        [166411] = {
            ["name"] = "Forsworn Usurper",
            ["count"] = 1,
        },
        [163128] = {
            ["name"] = "Zolramus Sorcerer",
            ["count"] = 4,
        },
        [169905] = {
            ["name"] = "Risen Warlord",
            ["count"] = 6,
        },
        [170480] = {
            ["name"] = "Atal'ai Deathwalker",
            ["count"] = 5,
        },
        [171384] = {
            ["name"] = "Research Scribe",
            ["count"] = 4,
        },
        [165076] = {
            ["name"] = "Gluttonous Tick",
            ["count"] = 4,
        },
        [171448] = {
            ["name"] = "Dreadful Huntmaster",
            ["count"] = 4,
        },
        [168420] = {
            ["name"] = "Forsworn Champion",
            ["count"] = 4,
        },
        [163862] = {
            ["name"] = "Defender of Many Eyes",
            ["count"] = 8,
        },
        [171799] = {
            ["name"] = "Depths Warden",
            ["count"] = 7,
        },
        [162049] = {
            ["name"] = "Vestige of Doubt",
            ["count"] = 4,
        },
        [162061] = {
            ["name"] = "Devos",
            ["count"] = 0,
        },
        [168580] = {
            ["name"] = "Plagueborer",
            ["count"] = 8,
        },
        [167956] = {
            ["name"] = "Dark Acolyte",
            ["count"] = 1,
        },
        [164705] = {
            ["name"] = "Pestilence Slime",
            ["count"] = 6,
        },
        [162046] = {
            ["name"] = "Famished Tick",
            ["count"] = 1,
        },
        [165138] = {
            ["name"] = "Blight Bag",
            ["count"] = 1,
        },
        [167955] = {
            ["name"] = "Sanguine Cadet",
            ["count"] = 1,
        },
        [162047] = {
            ["name"] = "Insatiable Brute",
            ["count"] = 7,
        },
    }
end
