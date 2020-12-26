
MythicPlusPullReEstimatedDB = MythicPlusPullReEstimatedDB or {}

MDT = MDT or {
    ["mapInfo"] = {},
    ["scaleMultiplier"] = {},
    ["dungeonTotalCount"] = {},
    ["dungeonEnemies"] = {},
    ["mapPOIs"] = {},
    ["L"] = {},
}


C_Timer.After(5, function()
    MythicPlusPullReEstimatedDB.npcDataExtract = MythicPlusPullReEstimatedDB.npcDataExtract or {}
    for _, enemyData in pairs(MDT.dungeonEnemies) do
        for _, npcData in pairs(enemyData) do
            MythicPlusPullReEstimatedDB.npcDataExtract[npcData.id] = {
                ["name"] = npcData.name,
                ["values"] = npcData.count,
            }
        end
    end
end)