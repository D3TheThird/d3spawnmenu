ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


local itemList = {
    { value = 'ammo-9', label = "9MM"},
		{ value = 'ammo-44', label = ".44 MAGNUM"},
		{ value = 'ammo-50', label = ".50 AE"},
		{ value = 'ammo-rifle', label = "5.56"},
		{ value = 'ammo-rifle2', label = "7.62"},
		{ value = 'ammo-heavysniper', label = ".50 BMG"},
		{ value = 'WEAPON_MOLOTOV', label = "MOLOTOV"},
		{ value = 'WEAPON_FLASHBANG', label = "FLASHBANG"},
		{ value = 'WEAPON_STUNGUN', label = "TAZER"},
		{ value = 'WEAPON_FLAREGUN', label = "FLARE GUN"},
		{ value = 'WEAPON_EMPLAUNCHER', label = "EMP LAUNCHER"},
		{ value = 'WEAPON_MACHINEPISTOL', label = "TEC-9"},
		{ value = 'WEAPON_REVOLVER', label = "REVOLVER"},
		{ value = 'WEAPON_PISTOL50', label = "DEAGLE"},
		{ value = 'WEAPON_COMBATPDW', label = "PDW"},
		{ value = 'WEAPON_ASSAULTSMG', label = "FAMAS"},
		{ value = 'WEAPON_ASSAULTRIFLE', label = "AK-47"},
		{ value = 'WEAPON_HEAVYSNIPER_MK2', label = "SNIPER"},
		-- Add more items as needed
}


RegisterCommand('adminspawn', function(source, args, user)
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer.getGroup() == 'admin' then
        TriggerClientEvent('d3spawnmenu:openMenu', source, itemList)
    else
        xPlayer.showNotification('You do not have permission to use this command.')
    end
end, false)


RegisterServerEvent('d3spawnmenu:spawnItem')
AddEventHandler('d3spawnmenu:spawnItem', function(itemName)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(itemName, 1)
end)
