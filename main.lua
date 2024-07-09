local ResourceName = GetCurrentResourceName()
local disable = false
Citizen.CreateThread(function()
    local isAiming = false
    local last = disable
    while true do
        local player = PlayerPedId()

        disable = not IsPedInAnyVehicle(player, true)
        if disable then

            if IsControlJustPressed(0, 25) then
                isAiming = true
            end

            if IsControlJustReleased(0, 25) then
                isAiming = false
            end
            
            disable = not isAiming

            if disable then
                if Config.UnarmedOnly then
                    disable = GetSelectedPedWeapon(player) == GetHashKey('WEAPON_UNARMED')
                else
                    local currentWeapon = GetSelectedPedWeapon(player)
                    local weaponInList = isWeaponInList(currentWeapon, Config.ArmedWeaponList)
                    if Config.ArmedWeaponListBlacklisted then
                        disable = weaponInList
                    else
                        disable = not weaponInList
                    end
                end
            end

            if disable then
                DisableControlAction(0, 24, true)  -- Attack
                DisableControlAction(0, 140, true) -- Melee Attack Light
                DisableControlAction(0, 141, true) -- Melee Attack Heavy
                DisableControlAction(0, 142, true) -- Melee Attack Alternate
                DisableControlAction(0, 257, true) -- Attack 2
                DisableControlAction(0, 263, true) -- Melee Attack 1
                DisableControlAction(0, 264, true) -- Melee Attack 2
            end

            if last ~= disable then
                TriggerEvent(ResourceName .. ':attackStateChange', disable)
            end

            last = disable
        end

        Wait(0)
    end
end)

function isWeaponInList(weapon, list)
    for i = 1, #list do
        if GetHashKey(list[i]) == weapon then
            return true
        end
    end
    return false
end

exports('isDisabled', function()
    return disable
end)

-- example for api call
-- AddEventHandler("that_safeAttack:attackStateChange", function(disable)
--     TriggerEvent('esx:showNotification', "attack disabled: " .. tostring(disable))
-- end)