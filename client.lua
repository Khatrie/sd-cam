local QBCore = exports['qb-core']:GetCoreObject()


local function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end
exports.ox_inventory:displayMetadata('picurl', "Link To Picture")
RegisterNetEvent('sd-cam:client:takepic', function()
    if exports.ox_inventory:Search('count', 'poloroidblank') >= 1 then
    CreateMobilePhone(1)
    CellCamActivate(true, true)
        CreateThread(function()
            while true do
                SetTimecycleModifier('NG_filmic08')
                SetTimecycleModifierStrength(0.25)
                RegisterNoirScreenEffectThisFrame()
                if IsControlJustPressed(1, 27) then
                    frontCam = not frontCam
                    CellFrontCamActivate(frontCam)
                    SetTimecycleModifierStrength(0.0)
                elseif IsControlJustPressed(1, 177) then
                    DestroyMobilePhone()
                    CellCamActivate(false, false)
                    SetTimecycleModifierStrength(0.0)
                    break
                elseif IsControlJustPressed(1, 176) then
                        exports['screenshot-basic']:requestScreenshotUpload('imgur', "files[]", function(uploaddata)
                            QBCore.Functions.Notify('Shaking photo...', 'primary')
                            TriggerServerEvent('sd-cam:server:savepic', uploaddata.data.link)
                        end)
                        Wait(400)
                        DestroyMobilePhone()
                        CellCamActivate(false, false)
                        SetTimecycleModifierStrength(0.0)
    --[[                 exports['screenshot-basic']:requestScreenshotUpload('INSERT DISCORD WEBHOOK HERE', "files[]", function(uploadData)
                        local player = QBCore.Functions.GetPlayerData()
                        TriggerServerEvent('qb-log:server:CreateLog', 'pictures', 'Pictures', 'lightgreen', '**Poloroid Taken by:** '.. player.charinfo.firstname .. " " .. player.charinfo.lastname .. "\n\n ** PermID: **" .. player.metadata.permid .. "\n\n ** Source: **" .. player.source .. "\n\n **Location: **" .. player.position.x .. ", " .. player.position.y .. ", " ..player.position.z )
                    end) ]]
                    break
                end
                HideHudComponentThisFrame(7)
                HideHudComponentThisFrame(8)
                HideHudComponentThisFrame(9)
                HideHudComponentThisFrame(6)
                HideHudComponentThisFrame(19)
                HideHudAndRadarThisFrame()
                EnableAllControlActions(0)
                Wait(0)
            end
        end)
    else
        TriggerEvent('QBCore:Notify', "Need a Blank Poloroid", 'error')
    end
end)

RegisterNetEvent('sd-cam:client:showpicture', function(item)
    exports['ps-ui']:ShowImage(item.metadata.picurl)
end)