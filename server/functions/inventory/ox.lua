function functions.HasItem(src, item, amount)
    local item_count = exports.ox_inventory:GetItemCount(src, item)
    if Config.Debug then
        print("PrettyLib - HasItem - " .. item .. " - " .. amount .. " - Results: " .. tostring(item_count))
    end
    if item_count >= amount then
        return true
    else
        return false
    end
end exports('HasItem', HasItem)



function functions.RemoveItem(src, item, amount, reason)
    local remove_item = exports.ox_inventory:RemoveItem(src, item, amount)
    if Config.Debug then
        print("PrettyLib - RemoveItem - " .. item .. " - " .. amount .. " - Results: " .. tostring(remove_item))
    end
    return remove_item
end exports('RemoveItem', RemoveItem)




function functions.DynamicStash(src, id, slots, weight, label)
    if Config.Debug then
        print("PrettyLib - RegisterStash - " .. id)
    end
    exports.ox_inventory:RegisterStash(id, label, slots, weight, false)
    TriggerClientEvent("PrettyLib:Client:OpenOxStash", src, id)
end 
exports('DynamicStash', DynamicStash)


function functions.DynamicShop(src, id, items, label)
     exports.ox_inventory:RegisterShop(id, {
        name = label,
        inventory = items
    })
end 
exports('DynamicShop', DynamicShop)

