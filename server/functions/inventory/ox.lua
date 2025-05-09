if Config.Inventory ~= 'ox' then return end

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

function functions.ItemSlotSearch(src, item)
    local item_slots = exports.ox_inventory:Search(src, 'slots', item)
    return item_slots
end exports('ItemSlotSearch', ItemSlotSearch)



function functions.RemoveItem(src, item, amount, reason)
    local remove_item = exports.ox_inventory:RemoveItem(src, item, amount)
    if Config.Debug then
        print("PrettyLib - RemoveItem - " .. item .. " - " .. amount .. " - Results: " .. tostring(remove_item))
    end
    return remove_item
end exports('RemoveItem', RemoveItem)

function functions.RemoveItemSlot(src, item, amount, slot, reason)
    local remove_item = exports.ox_inventory:RemoveItem(src, item, amount, nil, slot)
    if Config.Debug then
        print("PrettyLib - RemoveItemSlot - " .. item .. " - " .. amount .. " - Results: " .. tostring(remove_item))
    end
    return remove_item
end exports('RemoveItemSlot', RemoveItemSlot)

function functions.AddItem(src, item, amount, reason)
    local add_item = exports.ox_inventory:AddItem(src, item, amount)
    if Config.Debug then
        print("PrettyLib - AddItem - " .. item .. " - " .. amount .. " - Results: " .. tostring(remove_item))
    end
    return add_item
end exports('AddItem', AddItem)

function functions.AddItemMeta(src, item, amount, meta, reason)
    local add_item = exports.ox_inventory:AddItem(src, item, amount, meta)
    if Config.Debug then
        print("PrettyLib - AddItem - " .. item .. " - " .. amount .. " - Results: " .. tostring(remove_item))
    end
    return add_item
end exports('AddItemMeta', AddItemMeta)



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

