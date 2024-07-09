# that_safeAttack
that_safeAttack is a FiveM script designed to prevent accidental punches and attacks between players. The script ensures that a player can only punch or attack if they are purposefully aiming at someone by holding the right-click button. This helps maintain a more controlled and intentional gameplay experience.

Credits to [mrm-SafePunch](https://github.com/MrM-Scripts/mrm-SafePunch) for the concept

### Features:
- Blocks unintentional punches and attacks.
- Can be configured to allow attacks only when unarmed or when aiming with a weapon.
- Customizable whitelist/blacklist for specific weapons.
- Easy to install and configure with no dependencies.

### Installation
1. Download the script.
2. Drag and drop the script into your FiveM server resources folder.
3. Add start that_safeAttack to your server configuration file, in any order with other scripts. Except if calling api from any script, it must be after this script is ensured

### Configuration Options:
`Config.UnarmedOnly = true` – Ensures player is unarmed to attack. Set to false to require aiming with a weapon.
`Config.ArmedWeaponList` – List of weapons to be whitelisted or blacklisted.
`Config.ArmedWeaponListBlacklisted` = false – Determines if the Config.ArmedWeaponList is a blacklist (true) or whitelist (false).

### Usage
`TriggerEvent('that_safeAttack:attackStateChange', disable)` – Called every time the attack state changes.
`exports['that_safeAttack']:isDisabled()` – Returns whether the attack is disabled or not.

You may change the script name; events and exports will still work, but you must update the API calls accordingly.

For example if script name is changed to 'safeAttack' so when calling the api you should use `TriggerEvent('safeAttack:attackStateChange', disable)` and `exports['safeAttack']:isDisabled()`.

### Example API Call
```lua
AddEventHandler('that_safeAttack:attackStateChange', function(disable)
    if disable then
        -- do something
    else
        -- do something else
    end
end)
```
OR
```lua
Citizen.CreateThread(function()
    while true do
        if exports['that_safeAttack']:isDisabled() then
           -- do something
        else
           -- do something else
        end
        Wait(1)
    end
end)
```
