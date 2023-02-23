local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('sd-cam:server:savepic', function(picture)
    local src = source
    local metadata = {
        picurl = picture
    }
    if exports.ox_inventory:RemoveItem(src, 'poloroidblank', 1) then
        local time = math.random(3000, 5000)
        QBCore.Functions.Notify(src, 'Photo will be ready in '.. time / 1000 .. " seconds!", "success")
        Wait(time)
        exports.ox_inventory:AddItem(src, 'poloroid', 1, metadata)
        QBCore.Functions.Notify(src, 'Photo Developed!', "success")
    end
end)

QBCore.Functions.CreateUseableItem('poloroid', function(source, item)
    TriggerClientEvent('sd-cam:client:showpicture', source, item)
end)


QBCore.Functions.CreateUseableItem("poloroidcamera", function(source, item)
    TriggerClientEvent('sd-cam:client:takepic', source)
end)
