local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('anchor', function(source, item)
    local src = source
    TriggerClientEvent('gr-anchor:useAnchor', src)
end)
