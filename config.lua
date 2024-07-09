Config = {}

Config.UnarmedOnly = true -- Ensures player is unarmed. Setting to false will ensure that player is aiming with the weapon in order to fire/shoot

-- The following weapons will be whitelisted or blacklisted based on the toggle value of Config.ArmedWeaponListBlacklisted
Config.ArmedWeaponList = { -- Dependant on Config.UnarmedOnly to be false
    -- 'WEAPON_UNARMED',
    -- 'WEAPON_HATCHET'
}

-- Blacklisted = false means player holding any of the weapons will not require aiming
-- Blacklisted = true means player holding any of the weapons will require aiming
Config.ArmedWeaponListBlacklisted = false -- This toggle determines whether the Config.ArmedWeaponList is a blacklist or a whitelist