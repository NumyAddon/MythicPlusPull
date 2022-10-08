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
        [57109] = { ["name"] = "Minion of Doubt", ["count"] = 8 },
        [58319] = { ["name"] = "Lesser Sha", ["count"] = 15 },
        [59544] = { ["name"] = "The Nodding Tiger", ["count"] = 1 },
        [59545] = { ["name"] = "The Golden Beetle", ["count"] = 1 },
        [59546] = { ["name"] = "The Talking Fish", ["count"] = 1 },
        [59547] = { ["name"] = "Jiang", ["count"] = 2 },
        [59552] = { ["name"] = "The Crybaby Hozen", ["count"] = 1 },
        [59553] = { ["name"] = "The Songbird Queen", ["count"] = 1 },
        [59555] = { ["name"] = "Haunting Sha", ["count"] = 3 },
        [59598] = { ["name"] = "Lesser Sha", ["count"] = 10 },
        [59873] = { ["name"] = "Corrupt Living Water", ["count"] = 3 },
        [62358] = { ["name"] = "Corrupt Droplet", ["count"] = 9 },
        [65362] = { ["name"] = "Minion of Doubt", ["count"] = 2 },
    }
end
