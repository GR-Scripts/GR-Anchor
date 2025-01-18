local QBCore = exports['qb-core']:GetCoreObject()
local isAnchoring = false
local isAnchored = false
local anchoredBoat = nil

RegisterNetEvent('gr-anchor:useAnchor')
AddEventHandler('gr-anchor:useAnchor', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if IsPedInAnyBoat(playerPed) then
        if isAnchored and anchoredBoat == vehicle then
            QBCore.Functions.Progressbar('retrieve_anchor', Lang:t('info.retrieving_anchor'), Config.AnchorDelay, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                SetBoatAnchor(vehicle, false)
                isAnchored = false
                anchoredBoat = nil
                QBCore.Functions.Notify(Lang:t('success.anchor_retrieved'), 'success', 3500)
            end, function()
                QBCore.Functions.Notify(Lang:t('error.anchor_retrieval_canceled'), 'error', 3500)
            end)
        else
            if not isAnchoring then
                isAnchoring = true
                QBCore.Functions.Notify(Lang:t('info.throwing_anchor'), 'primary', 3500)
                QBCore.Functions.Progressbar('use_anchor', Lang:t('info.throwing_anchor'), Config.AnchorDelay, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    SetBoatAnchor(vehicle, true)
                    isAnchored = true
                    anchoredBoat = vehicle
                    QBCore.Functions.Notify(Lang:t('success.anchor_in_place'), 'success', 3500)
                    isAnchoring = false
                end, function()
                    QBCore.Functions.Notify(Lang:t('error.anchor_canceled'), 'error', 3500)
                    isAnchoring = false
                end)
            else
                QBCore.Functions.Notify(Lang:t('error.already_anchoring'), 'error', 3500)
            end
        end
    else
        QBCore.Functions.Notify(Lang:t('error.not_in_boat'), 'error', 3500)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isAnchored then
            local playerPed = PlayerPedId()
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            if IsPedInAnyBoat(playerPed) then
                SetBoatAnchor(vehicle, true)
                local velocity = GetEntityVelocity(vehicle)
                SetEntityVelocity(vehicle, 0.0, 0.0, velocity.z)
                FreezeEntityPosition(vehicle, false)
                DisableControlAction(0, 71, true) -- Disable W
                DisableControlAction(0, 72, true) -- Disable S
                DisableControlAction(0, 63, true) -- Disable A
                DisableControlAction(0, 64, true) -- Disable D
            end
        else
            local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
            FreezeEntityPosition(vehicle, false)
            EnableControlAction(0, 71, true) -- Enable W
            EnableControlAction(0, 72, true) -- Enable S
            EnableControlAction(0, 63, true) -- Enable A
            EnableControlAction(0, 64, true) -- Enable D
        end
    end
end)
