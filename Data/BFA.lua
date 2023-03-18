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
        [369] = { -- Operation: Mechagon - Junkyard
            [189878] = { ["name"] = "Nathrezim Infiltrator", ["count"] = 7 },
            [190128] = { ["name"] = "Zul'gamux", ["count"] = 21 },
        },
        [370] = { -- Operation: Mechagon - Workshop
            [189878] = { ["name"] = "Nathrezim Infiltrator", ["count"] = 3 },
            [190128] = { ["name"] = "Zul'gamux", ["count"] = 9 },
        },
    }
end

function data:GetNPCData()
    -- data is sorted with natural sorting by NPC ID
    return {
        [122969] = { ["name"] = "Zanchuli Witch-Doctor", ["count"] = 4 },
        [122970] = { ["name"] = "Shadowblade Stalker", ["count"] = 4 },
        [122971] = { ["name"] = "Dazar'ai Juggernaut", ["count"] = 4 },
        [122972] = { ["name"] = "Dazar'ai Augur", ["count"] = 4 },
        [122973] = { ["name"] = "Dazar'ai Confessor", ["count"] = 4 },
        [122984] = { ["name"] = "Dazar'ai Colossus", ["count"] = 6 },
        [126918] = { ["name"] = "Irontide Crackshot", ["count"] = 4 },
        [126919] = { ["name"] = "Irontide Stormcaller", ["count"] = 4 },
        [126928] = { ["name"] = "Irontide Corsair", ["count"] = 4 },
        [127106] = { ["name"] = "Irontide Officer", ["count"] = 6 },
        [127111] = { ["name"] = "Irontide Oarsman", ["count"] = 6 },
        [127381] = { ["name"] = "Silt Crab", ["count"] = 3 },
        [127477] = { ["name"] = "Saltwater Snapper", ["count"] = 6 },
        [127480] = { ["name"] = "Stinging Parasite", ["count"] = 1 },
        [127482] = { ["name"] = "Sewer Vicejaw", ["count"] = 4 },
        [127485] = { ["name"] = "Bilge Rat Looter", ["count"] = 3 },
        [127486] = { ["name"] = "Ashvane Officer", ["count"] = 7 },
        [127488] = { ["name"] = "Ashvane Flamecaster", ["count"] = 7 },
        [127497] = { ["name"] = "Ashvane Warden", ["count"] = 9 },
        [127757] = { ["name"] = "Reanimated Honor Guard", ["count"] = 4 },
        [127799] = { ["name"] = "Dazar'ai Honor Guard", ["count"] = 4 },
        [127879] = { ["name"] = "Shieldbearer of Zul", ["count"] = 4 },
        [128434] = { ["name"] = "Feasting Skyscreamer", ["count"] = 4 },
        [128435] = { ["name"] = "Toxic Saurid", ["count"] = 1 },
        [128455] = { ["name"] = "T'lonja", ["count"] = 6 },
        [128551] = { ["name"] = "Irontide Mastiff", ["count"] = 4 },
        [128967] = { ["name"] = "Ashvane Sniper", ["count"] = 4 },
        [128969] = { ["name"] = "Ashvane Commander", ["count"] = 8 },
        [129366] = { ["name"] = "Bilge Rat Buccaneer", ["count"] = 4 },
        [129367] = { ["name"] = "Bilge Rat Tempest", ["count"] = 4 },
        [129369] = { ["name"] = "Irontide Raider", ["count"] = 8 },
        [129370] = { ["name"] = "Irontide Waveshaper", ["count"] = 4 },
        [129371] = { ["name"] = "Riptide Shredder", ["count"] = 4 },
        [129372] = { ["name"] = "Blacktar Bomber", ["count"] = 4 },
        [129373] = { ["name"] = "Dockhound Packmaster", ["count"] = 4 },
        [129374] = { ["name"] = "Scrimshaw Enforcer", ["count"] = 4 },
        [129526] = { ["name"] = "Bilge Rat Swabby", ["count"] = 4 },
        [129527] = { ["name"] = "Bilge Rat Buccaneer", ["count"] = 4 },
        [129529] = { ["name"] = "Blacktooth Scrapper", ["count"] = 4 },
        [129547] = { ["name"] = "Blacktooth Knuckleduster", ["count"] = 4 },
        [129548] = { ["name"] = "Blacktooth Brute", ["count"] = 4 },
        [129550] = { ["name"] = "Bilge Rat Padfoot", ["count"] = 4 },
        [129551] = { ["name"] = "Bilge Rat Mixologist", ["count"] = 1 },
        [129552] = { ["name"] = "Monzumi", ["count"] = 6 },
        [129553] = { ["name"] = "Dinomancer Kish'o", ["count"] = 10 },
        [129559] = { ["name"] = "Cutwater Duelist", ["count"] = 4 },
        [129599] = { ["name"] = "Cutwater Knife Juggler", ["count"] = 3 },
        [129600] = { ["name"] = "Bilge Rat Brinescale", ["count"] = 3 },
        [129601] = { ["name"] = "Cutwater Harpooner", ["count"] = 4 },
        [129602] = { ["name"] = "Irontide Enforcer", ["count"] = 6 },
        [129640] = { ["name"] = "Snarling Dockhound", ["count"] = 4 },
        [129699] = { ["name"] = "Ludwig Von Tortollan", ["count"] = 4 },
        [129788] = { ["name"] = "Irontide Bonesaw", ["count"] = 4 },
        [130011] = { ["name"] = "Irontide Buccaneer", ["count"] = 4 },
        [130012] = { ["name"] = "Irontide Ravager", ["count"] = 4 },
        [130024] = { ["name"] = "Soggy Shiprat", ["count"] = 1 },
        [130025] = { ["name"] = "Irontide Thug", ["count"] = 7 },
        [130026] = { ["name"] = "Bilge Rat Seaspeaker", ["count"] = 6 },
        [130027] = { ["name"] = "Ashvane Marine", ["count"] = 7 },
        [130028] = { ["name"] = "Ashvane Priest", ["count"] = 7 },
        [130207] = { ["name"] = "Enchanted Brine", ["count"] = 3 },
        [130353] = { ["name"] = "Smoldering Elemental", ["count"] = 6 },
        [130400] = { ["name"] = "Irontide Crusher", ["count"] = 6 },
        [130404] = { ["name"] = "Vermin Trapper", ["count"] = 4 },
        [130435] = { ["name"] = "Addled Thug", ["count"] = 5 },
        [130436] = { ["name"] = "Off-Duty Laborer", ["count"] = 1 },
        [130437] = { ["name"] = "Mine Rat", ["count"] = 2 },
        [130485] = { ["name"] = "Mechanized Peacekeeper", ["count"] = 12 },
        [130488] = { ["name"] = "Mech Jockey", ["count"] = 4 },
        [130521] = { ["name"] = "Freehold Deckhand", ["count"] = 1 },
        [130522] = { ["name"] = "Freehold Shipmate", ["count"] = 2 },
        [130635] = { ["name"] = "Stonefury", ["count"] = 4 },
        [130653] = { ["name"] = "Wanton Sapper", ["count"] = 4 },
        [130661] = { ["name"] = "Venture Co. Earthshaper", ["count"] = 4 },
        [130909] = { ["name"] = "Fetid Maggot", ["count"] = 4 },
        [131112] = { ["name"] = "Cutwater Striker", ["count"] = 6 },
        [131402] = { ["name"] = "Underrot Tick", ["count"] = 1 },
        [131436] = { ["name"] = "Chosen Blood Matron", ["count"] = 6 },
        [131445] = { ["name"] = "Block Warden", ["count"] = 9 },
        [131492] = { ["name"] = "Devout Blood Priest", ["count"] = 4 },
        [131585] = { ["name"] = "Enthralled Guard", ["count"] = 4 },
        [131586] = { ["name"] = "Banquet Steward", ["count"] = 4 },
        [131587] = { ["name"] = "Bewitched Captain", ["count"] = 5 },
        [131601] = { ["name"] = "Executive Chef Daniel", ["count"] = 4 },
        [131607] = { ["name"] = "Sauciere Samuel", ["count"] = 4 },
        [131611] = { ["name"] = "Roast Chef Rhonda", ["count"] = 4 },
        [131666] = { ["name"] = "Coven Thornshaper", ["count"] = 4 },
        [131669] = { ["name"] = "Jagged Hound", ["count"] = 1 },
        [131670] = { ["name"] = "Heartsbane Vinetwister", ["count"] = 6 },
        [131677] = { ["name"] = "Heartsbane Runeweaver", ["count"] = 6 },
        [131685] = { ["name"] = "Runic Disciple", ["count"] = 4 },
        [131812] = { ["name"] = "Heartsbane Soulcharmer", ["count"] = 6 },
        [131818] = { ["name"] = "Marked Sister", ["count"] = 4 },
        [131819] = { ["name"] = "Coven Diviner", ["count"] = 4 },
        [131847] = { ["name"] = "Waycrest Reveler", ["count"] = 4 },
        [131849] = { ["name"] = "Crazed Marksman", ["count"] = 4 },
        [131850] = { ["name"] = "Maddened Survivalist", ["count"] = 4 },
        [131858] = { ["name"] = "Thornguard", ["count"] = 4 },
        [132126] = { ["name"] = "Gilded Priestess", ["count"] = 4 },
        [133345] = { ["name"] = "Feckless Assistant", ["count"] = 5 },
        [133430] = { ["name"] = "Venture Co. Mastermind", ["count"] = 8 },
        [133432] = { ["name"] = "Venture Co. Alchemist", ["count"] = 5 },
        [133436] = { ["name"] = "Venture Co. Skyscorcher", ["count"] = 5 },
        [133463] = { ["name"] = "Venture Co. War Machine", ["count"] = 12 },
        [133482] = { ["name"] = "Crawler Mine", ["count"] = 1 },
        [133593] = { ["name"] = "Expert Technician", ["count"] = 5 },
        [133663] = { ["name"] = "Fanatical Headhunter", ["count"] = 4 },
        [133685] = { ["name"] = "Befouled Spirit", ["count"] = 4 },
        [133835] = { ["name"] = "Feral Bloodswarmer", ["count"] = 4 },
        [133836] = { ["name"] = "Reanimated Guardian", ["count"] = 4 },
        [133852] = { ["name"] = "Living Rot", ["count"] = 4 },
        [133870] = { ["name"] = "Diseased Lasher", ["count"] = 4 },
        [133912] = { ["name"] = "Bloodsworn Defiler", ["count"] = 6 },
        [133935] = { ["name"] = "Animated Guardian", ["count"] = 8 },
        [133963] = { ["name"] = "Test Subject", ["count"] = 1 },
        [133990] = { ["name"] = "Scrimshaw Gutter", ["count"] = 1 },
        [134005] = { ["name"] = "Shalebiter", ["count"] = 1 },
        [134012] = { ["name"] = "Taskmaster Askari", ["count"] = 6 },
        [134024] = { ["name"] = "Devouring Maggot", ["count"] = 1 },
        [134041] = { ["name"] = "Infected Peasant", ["count"] = 4 },
        [134137] = { ["name"] = "Temple Attendant", ["count"] = 9 },
        [134139] = { ["name"] = "Shrine Templar", ["count"] = 10 },
        [134144] = { ["name"] = "Living Current", ["count"] = 18 },
        [134150] = { ["name"] = "Runecarver Sorn", ["count"] = 36 },
        [134157] = { ["name"] = "Shadow-Borne Warrior", ["count"] = 4 },
        [134158] = { ["name"] = "Shadow-Borne Champion", ["count"] = 6 },
        [134173] = { ["name"] = "Animated Droplet", ["count"] = 1 },
        [134174] = { ["name"] = "Shadow-Borne Witch Doctor", ["count"] = 5 },
        [134232] = { ["name"] = "Hired Assassin", ["count"] = 4 },
        [134251] = { ["name"] = "Seneschal M'bara", ["count"] = 4 },
        [134284] = { ["name"] = "Fallen Deathspeaker", ["count"] = 4 },
        [134331] = { ["name"] = "King Rahu'ai", ["count"] = 6 },
        [134338] = { ["name"] = "Tidesage Enforcer", ["count"] = 9 },
        [134364] = { ["name"] = "Faithless Tender", ["count"] = 4 },
        [134417] = { ["name"] = "Deepsea Ritualist", ["count"] = 12 },
        [134418] = { ["name"] = "Drowned Depthbringer", ["count"] = 9 },
        [134423] = { ["name"] = "Abyss Dweller", ["count"] = 1 },
        [134514] = { ["name"] = "Abyssal Cultist", ["count"] = 9 },
        [134599] = { ["name"] = "Imbued Stormcaller", ["count"] = 4 },
        [134600] = { ["name"] = "Sandswept Marksman", ["count"] = 4 },
        [134602] = { ["name"] = "Shrouded Fang", ["count"] = 4 },
        [134616] = { ["name"] = "Krolusk Pup", ["count"] = 2 },
        [134617] = { ["name"] = "Krolusk Hatchling", ["count"] = 1 },
        [134629] = { ["name"] = "Scaled Krolusk Rider", ["count"] = 6 },
        [134686] = { ["name"] = "Mature Krolusk", ["count"] = 4 },
        [134691] = { ["name"] = "Static-charged Dervish", ["count"] = 4 },
        [134739] = { ["name"] = "Purification Construct", ["count"] = 10 },
        [134990] = { ["name"] = "Charged Dust Devil", ["count"] = 4 },
        [134991] = { ["name"] = "Sandfury Stonefist", ["count"] = 6 },
        [134994] = { ["name"] = "Spectral Headhunter", ["count"] = 1 },
        [135048] = { ["name"] = "Gorestained Piglet", ["count"] = 4 },
        [135049] = { ["name"] = "Dreadwing Raven", ["count"] = 2 },
        [135052] = { ["name"] = "Blight Toad", ["count"] = 1 },
        [135167] = { ["name"] = "Spectral Berserker", ["count"] = 4 },
        [135192] = { ["name"] = "Honored Raptor", ["count"] = 4 },
        [135195] = { ["name"] = "Drustvar Villager", ["count"] = 4 },
        [135204] = { ["name"] = "Spectral Hex Priest", ["count"] = 4 },
        [135231] = { ["name"] = "Spectral Brute", ["count"] = 8 },
        [135234] = { ["name"] = "Diseased Mastiff", ["count"] = 3 },
        [135235] = { ["name"] = "Spectral Beastmaster", ["count"] = 4 },
        [135239] = { ["name"] = "Spectral Witch Doctor", ["count"] = 4 },
        [135240] = { ["name"] = "Soul Essence", ["count"] = 2 },
        [135241] = { ["name"] = "Bilge Rat Pillager", ["count"] = 4 },
        [135245] = { ["name"] = "Bilge Rat Demolisher", ["count"] = 8 },
        [135254] = { ["name"] = "Irontide Raider", ["count"] = 4 },
        [135258] = { ["name"] = "Irontide Marauder", ["count"] = 1 },
        [135263] = { ["name"] = "Ashvane Spotter", ["count"] = 4 },
        [135329] = { ["name"] = "Matron Bryndle", ["count"] = 10 },
        [135336] = { ["name"] = "Eye of Sethraliss", ["count"] = 12 },
        [135365] = { ["name"] = "Matron Alma", ["count"] = 16 },
        [135366] = { ["name"] = "Blacktooth Arsonist", ["count"] = 6 },
        [135474] = { ["name"] = "Thistle Acolyte", ["count"] = 4 },
        [135562] = { ["name"] = "Venomous Ophidian", ["count"] = 2 },
        [135699] = { ["name"] = "Ashvane Jailer", ["count"] = 7 },
        [135706] = { ["name"] = "Bilge Rat Looter", ["count"] = 3 },
        [135846] = { ["name"] = "Sand-Crusted Striker", ["count"] = 2 },
        [136076] = { ["name"] = "Agitated Nimbus", ["count"] = 6 },
        [136139] = { ["name"] = "Mechanized Peacekeeper", ["count"] = 12 },
        [136186] = { ["name"] = "Tidesage Spiritualist", ["count"] = 9 },
        [136214] = { ["name"] = "Windspeaker Heldis", ["count"] = 36 },
        [136249] = { ["name"] = "Guardian Elemental", ["count"] = 36 },
        [136250] = { ["name"] = "Hoodoo Hexer", ["count"] = 4 },
        [136295] = { ["name"] = "Sunken Denizen", ["count"] = 13 },
        [136297] = { ["name"] = "Forgotten Denizen", ["count"] = 9 },
        [136347] = { ["name"] = "Tidesage Initiate", ["count"] = 1 },
        [136353] = { ["name"] = "Colossal Tentacle", ["count"] = 10 },
        [136470] = { ["name"] = "Refreshment Vendor", ["count"] = 4 },
        [136643] = { ["name"] = "Azerite Extractor", ["count"] = 12 },
        [136665] = { ["name"] = "Ashvane Spotter", ["count"] = 7 },
        [136735] = { ["name"] = "Ashvane Marine", ["count"] = 7 },
        [136934] = { ["name"] = "Weapons Tester", ["count"] = 4 },
        [137029] = { ["name"] = "Ordnance Specialist", ["count"] = 5 },
        [137048] = { ["name"] = "Beguiled Villager", ["count"] = 1 },
        [137473] = { ["name"] = "Guard Captain Atu", ["count"] = 4 },
        [137474] = { ["name"] = "King Timalji", ["count"] = 6 },
        [137478] = { ["name"] = "Queen Wasi", ["count"] = 6 },
        [137484] = { ["name"] = "King A'akul", ["count"] = 6 },
        [137485] = { ["name"] = "Bloodsworn Agent", ["count"] = 4 },
        [137486] = { ["name"] = "Queen Patlaa", ["count"] = 4 },
        [137487] = { ["name"] = "Skeletal Hunting Raptor", ["count"] = 4 },
        [137511] = { ["name"] = "Bilge Rat Cutthroat", ["count"] = 4 },
        [137516] = { ["name"] = "Ashvane Invader", ["count"] = 4 },
        [137517] = { ["name"] = "Ashvane Destroyer", ["count"] = 4 },
        [137521] = { ["name"] = "Irontide Powdershot", ["count"] = 4 },
        [137713] = { ["name"] = "Big Money Crab", ["count"] = 1 },
        [137830] = { ["name"] = "Pallid Gorger", ["count"] = 4 },
        [137940] = { ["name"] = "Safety Shark", ["count"] = 4 },
        [137969] = { ["name"] = "Interment Construct", ["count"] = 6 },
        [137989] = { ["name"] = "Embalming Fluid", ["count"] = 1 },
        [138002] = { ["name"] = "Scrimshaw Gutter", ["count"] = 1 },
        [138019] = { ["name"] = "Kul Tiran Vanguard", ["count"] = 4 },
        [138187] = { ["name"] = "Grotesque Horror", ["count"] = 4 },
        [138247] = { ["name"] = "Irontide Marauder", ["count"] = 1 },
        [138254] = { ["name"] = "Irontide Powdershot", ["count"] = 1 },
        [138255] = { ["name"] = "Ashvane Spotter", ["count"] = 4 },
        [138281] = { ["name"] = "Faceless Corruptor", ["count"] = 6 },
        [138464] = { ["name"] = "Ashvane Deckhand", ["count"] = 4 },
        [138465] = { ["name"] = "Ashvane Cannoneer", ["count"] = 4 },
        [138489] = { ["name"] = "Shadow of Zul", ["count"] = 8 },
        [139110] = { ["name"] = "Spark Channeler", ["count"] = 11 },
        [139269] = { ["name"] = "Gloom Horror", ["count"] = 4 },
        [139422] = { ["name"] = "Scaled Krolusk Tamer", ["count"] = 6 },
        [139425] = { ["name"] = "Crazed Incubator", ["count"] = 4 },
        [139626] = { ["name"] = "Dredged Sailor", ["count"] = 1 },
        [139799] = { ["name"] = "Ironhull Apprentice", ["count"] = 9 },
        [139800] = { ["name"] = "Galecaller Apprentice", ["count"] = 9 },
        [139946] = { ["name"] = "Heart Guardian", ["count"] = 6 },
        [139949] = { ["name"] = "Plague Doctor", ["count"] = 4 },
        [140038] = { ["name"] = "Abyssal Eel", ["count"] = 2 },
        [141282] = { ["name"] = "Kul Tiran Footman", ["count"] = 1 },
        [141283] = { ["name"] = "Kul Tiran Halberd", ["count"] = 4 },
        [141284] = { ["name"] = "Kul Tiran Wavetender", ["count"] = 4 },
        [141285] = { ["name"] = "Kul Tiran Marksman", ["count"] = 4 },
        [141495] = { ["name"] = "Kul Tiran Footman", ["count"] = 1 },
        [141565] = { ["name"] = "Kul Tiran Footman", ["count"] = 1 },
        [141566] = { ["name"] = "Scrimshaw Gutter", ["count"] = 1 },
        [144071] = { ["name"] = "Irontide Waveshaper", ["count"] = 4 },
        [144293] = { ["name"] = "Waste Processing Unit", ["count"] = 6 },
        [144294] = { ["name"] = "Mechagon Tinkerer", ["count"] = 3 },
        [144295] = { ["name"] = "Mechagon Mechanic", ["count"] = 3 },
        [144296] = { ["name"] = "Spider Tank", ["count"] = 5 },
        [144298] = { ["name"] = "Defense Bot Mk III", ["count"] = 6 },
        [144299] = { ["name"] = "Workshop Defender", ["count"] = 3 },
        [144301] = { ["name"] = "Living Waste", ["count"] = 1 },
        [144303] = { ["name"] = "G.U.A.R.D.", ["count"] = 3 },
        [150142] = { ["name"] = "Scrapbone Trashtosser", ["count"] = 3 },
        [150143] = { ["name"] = "Scrapbone Grinder", ["count"] = 3 },
        [150146] = { ["name"] = "Scrapbone Shaman", ["count"] = 3 },
        [150154] = { ["name"] = "Saurolisk Bonenipper", ["count"] = 3 },
        [150160] = { ["name"] = "Scrapbone Bully", ["count"] = 4 },
        [150165] = { ["name"] = "Slime Elemental", ["count"] = 4 },
        [150168] = { ["name"] = "Toxic Monstrosity", ["count"] = 5 },
        [150169] = { ["name"] = "Toxic Lurker", ["count"] = 4 },
        [150195] = { ["name"] = "Gnome-Eating Slime", ["count"] = 3 },
        [150249] = { ["name"] = "Pistonhead Scrapper", ["count"] = 3 },
        [150250] = { ["name"] = "Pistonhead Blaster", ["count"] = 3 },
        [150251] = { ["name"] = "Pistonhead Mechanic", ["count"] = 3 },
        [150253] = { ["name"] = "Weaponized Crawler", ["count"] = 10 },
        [150254] = { ["name"] = "Scraphound", ["count"] = 3 },
        [150276] = { ["name"] = "Heavy Scrapbot", ["count"] = 5 },
        [150292] = { ["name"] = "Mechagon Cavalry", ["count"] = 5 },
        [150293] = { ["name"] = "Mechagon Prowler", ["count"] = 3 },
        [150297] = { ["name"] = "Mechagon Renormalizer", ["count"] = 4 },
        [150547] = { ["name"] = "Scrapbone Grunter", ["count"] = 1 },
        [151476] = { ["name"] = "Blastatron X-80", ["count"] = 9 },
        [151649] = { ["name"] = "Defense Bot Mk I", ["count"] = 3 },
        [151657] = { ["name"] = "Bomb Tonk", ["count"] = 3 },
        [151658] = { ["name"] = "Strider Tonk", ["count"] = 3 },
        [151659] = { ["name"] = "Rocket Tonk", ["count"] = 3 },
        [151773] = { ["name"] = "Junkyard D.0.G.", ["count"] = 4 },
        [152009] = { ["name"] = "Malfunctioning Scrapbot", ["count"] = 5 },
        [152435] = { ["name"] = "Bomb Tonk", ["count"] = 3 },
        [152442] = { ["name"] = "Strider Tonk", ["count"] = 3 },
        [152443] = { ["name"] = "Rocket Tonk", ["count"] = 3 },
        [154744] = { ["name"] = "Toxic Monstrosity", ["count"] = 5 },
        [154758] = { ["name"] = "Toxic Monstrosity", ["count"] = 5 },
        [155090] = { ["name"] = "Anodized Coilbearer", ["count"] = 4 },
        [155094] = { ["name"] = "Mechagon Trooper", ["count"] = 3 },
    }
end
