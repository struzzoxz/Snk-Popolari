ESX = exports.es_extended:getSharedObject()

ESX.RegisterServerCallback("snkpopolari:apriinv", function(playerId, cb)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    exports.ox_inventory:RegisterStash('Popolare:'..xPlayer.identifier, Popolari.Label, Popolari.Slots, Popolari.Peso*1000, nil)
    Citizen.Wait(200)
    cb('Popolare:'..xPlayer.identifier)
end)

RegisterServerEvent('snkpopolari:joinPopolare')
AddEventHandler('snkpopolari:joinPopolare', function()
    local xPlayer = ESX.GetPlayerFromId(source) 
    SetPlayerRoutingBucket(source, source)
    
end)


RegisterServerEvent('snkpopolari:esciPopolare')
AddEventHandler('snkpopolari:esciPopolare', function()
    SetPlayerRoutingBucket(source, 0)
end)

RegisterServerEvent('snkpopolari:riscattachiavi')
AddEventHandler('snkpopolari:riscattachiavi', function(item, count)
    local xPlayer = ESX.GetPlayerFromId(source) 
    xPlayer.addInventoryItem(item, count)
    print('adsdasdsa')
end)

RegisterServerEvent('snkpopolari:rimuovisoldi')
AddEventHandler('snkpopolari:rimuovisoldi',  function(item, count)
 local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem(item, count)
print('adsdasdsa')
end)