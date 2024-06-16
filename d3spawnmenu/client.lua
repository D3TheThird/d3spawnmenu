Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('d3spawnmenu:openMenu')
AddEventHandler('d3spawnmenu:openMenu', function(items)
    itemList = items
    openMenu('')
end)

function openMenu(searchTerm)
    local elements = {}
    local searchTermLower = searchTerm:lower()


    local searchCommandOption = {
        title = 'Search',
        description = '',
        event = 'd3spawnmenu:searchItems',
        close = false
    }
    table.insert(elements, searchCommandOption)


    for i = 1, #itemList do
        if searchTermLower == '' or string.find(itemList[i].label:lower(), searchTermLower) then
            local itemOption = {
                title = itemList[i].label,
                description = '',
                event = 'd3spawnmenu:spawnItem',
                args = itemList[i],
                close = false
            }
            table.insert(elements, itemOption)
        end
    end


    lib.registerContext({
        id = 'admin_spawn_menu',
        title = 'Admin Item Spawn Menu',
        options = elements,
        onSelected = function(option, ...)
            local args = {...}
            TriggerEvent(option.event, option.args)
        end,
        onExit = function()

        end
    })

    lib.showContext('admin_spawn_menu')
end

RegisterNetEvent('d3spawnmenu:spawnItem')
AddEventHandler('d3spawnmenu:spawnItem', function(item)
    local itemName = item.value
    local quantity = item.quantity or 1


    if string.find(itemName, 'ammo-') == 1 then
        quantity = 1
    end


    for i = 1, quantity do
        TriggerServerEvent('d3spawnmenu:spawnItem', itemName)
    end


    ESX.ShowNotification('Spawned ' .. quantity .. ' x ' .. item.label .. ' in your inventory.')
    ExecuteCommand("adminspawn")
end)


RegisterCommand('searchitems', function(source, args, rawCommand)
    local input = table.concat(args, ' ')
    openMenu(input)
end)


RegisterNetEvent('d3spawnmenu:searchItems')
AddEventHandler('d3spawnmenu:searchItems', function()
    local input = lib.inputDialog('Search', {'Name'})
    if input and input[1] then
        openMenu(input[1])
    end
end)