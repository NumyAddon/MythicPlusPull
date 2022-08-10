local _, ns = ...

local data = {};
tinsert(ns.data, data)

function data:GetPatchVersion()
    return 3;
end

function data:GetDungeonOverrides()
    return {
        [166] = { -- grimrail depot
            [189878] = { ["name"] = "Nathrezim Infiltrator", ["count"] = 6 },
            [190128] = { ["name"] = "Zul'gamux", ["count"] = 18 },
        },
        [169] = { -- iron docks
            [189878] = { ["name"] = "Nathrezim Infiltrator", ["count"] = 4 },
            [190128] = { ["name"] = "Zul'gamux", ["count"] = 12 },
        },
    }
end

function data:GetNPCData()
    -- data is sorted with natural sorting by NPC ID
    return {
        [80935] = { ["name"] = "Grom'kar Boomer", ["count"] = 7 },
        [80936] = { ["name"] = "Grom'kar Grenadier", ["count"] = 7 },
        [80937] = { ["name"] = "Grom'kar Gunner", ["count"] = 6 },
        [80938] = { ["name"] = "Grom'kar Hulk", ["count"] = 18 },
        [80940] = { ["name"] = "Iron Infantry", ["count"] = 3 },
        [81212] = { ["name"] = "Grimrail Overseer", ["count"] = 7 },
        [81235] = { ["name"] = "Grimrail Laborer", ["count"] = 2 },
        [81236] = { ["name"] = "Grimrail Technician", ["count"] = 4 },
        [81279] = { ["name"] = "Grom'kar Flameslinger", ["count"] = 5 },
        [81283] = { ["name"] = "Grom'kar Footsoldier", ["count"] = 4 },
        [81407] = { ["name"] = "Grimrail Bombardier", ["count"] = 12 },
        [81432] = { ["name"] = "Grom'kar Technician", ["count"] = 4 },
        [81603] = { ["name"] = "Champion Druna", ["count"] = 9 },
        [82579] = { ["name"] = "Grom'kar Far Seer", ["count"] = 12 },
        [82590] = { ["name"] = "Grimrail Scout", ["count"] = 12 },
        [82594] = { ["name"] = "Grimrail Loader", ["count"] = 1 },
        [82597] = { ["name"] = "Grom'kar Captain", ["count"] = 18 },
        [83025] = { ["name"] = "Grom'kar Battlemaster", ["count"] = 9 },
        [83026] = { ["name"] = "Siegemaster Olugar", ["count"] = 9 },
        [83028] = { ["name"] = "Grom'kar Deadeye", ["count"] = 3 },
        [83389] = { ["name"] = "Ironwing Flamespitter", ["count"] = 8 },
        [83390] = { ["name"] = "Thunderlord Wrangler", ["count"] = 7 },
        [83392] = { ["name"] = "Rampaging Clefthoof", ["count"] = 8 },
        [83578] = { ["name"] = "Ogron Laborer", ["count"] = 9 },
        [83697] = { ["name"] = "Grom'kar Deckhand", ["count"] = 3 },
        [83761] = { ["name"] = "Ogron Laborer", ["count"] = 9 },
        [83762] = { ["name"] = "Grom'kar Deckhand", ["count"] = 1 },
        [83763] = { ["name"] = "Grom'kar Technician", ["count"] = 2 },
        [83764] = { ["name"] = "Grom'kar Deadeye", ["count"] = 2 },
        [83765] = { ["name"] = "Grom'kar Footsoldier", ["count"] = 2 },
        [84028] = { ["name"] = "Siegemaster Rokra", ["count"] = 9 },
        [84520] = { ["name"] = "Pitwarden Gwarnok", ["count"] = 9 },
        [86526] = { ["name"] = "Grom'kar Chainmaster", ["count"] = 9 },
        [86809] = { ["name"] = "Grom'kar Incinerator", ["count"] = 5 },
        [87252] = { ["name"] = "Unruly Ogron", ["count"] = 9 },
        [88163] = { ["name"] = "Grom'kar Cinderseer", ["count"] = 8 },
    }
end
