
if Config.Inventory ~= 'ox' then return end

function functions.Inventory.HasItem(item, amount)
    local item_count = exports.ox_inventory:GetItemCount(item)
    if Config.Debug then
        print("PrettyLib - HasItem - " .. item .. " - " .. amount .. " - Results: " .. tostring(item_count))
    end
    if item_count >= amount then
        return true
    else
        return false
    end
end exports('HasItem', HasItem)


RegisterNetEvent("PrettyLib:Client:OpenOxStash")
AddEventHandler("PrettyLib:Client:OpenOxStash", function(data)
    exports.ox_inventory:openInventory('stash', data)
end)

RegisterNetEvent("PrettyLib:Client:OpenOxShop")
AddEventHandler("PrettyLib:Client:OpenOxShop", function(data)
    exports.ox_inventory:openInventory('shop', { type = data })
end)
