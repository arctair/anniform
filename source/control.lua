script.on_init(function()
    global.stone_annihilation_nodes = {}
    global.stone_formation_nodes = {}
end)

function on_stone_container_built(event)
    target = nil
    if event.created_entity.name == "stone-annihilation-node" then
        target = global.stone_annihilation_nodes
    else
        target = global.stone_formation_nodes
    end
    table.insert(target, event.created_entity)
end

function on_tick(event)
    local pendingInsert = 0
    for _, entity in ipairs(global.stone_annihilation_nodes) do
        outputInventory = entity.get_output_inventory()
        pendingInsert = pendingInsert + outputInventory.get_item_count("stone")
    end

    pendingRemove = 0
    for _, entity in ipairs(global.stone_formation_nodes) do
        if pendingInsert == 0 then
            break
        end

        outputInventory = entity.get_output_inventory()
        count = outputInventory.insert({ name = "stone", count = pendingInsert })
        pendingInsert = pendingInsert - count
        pendingRemove = pendingRemove + count
    end

    for _, entity in ipairs(global.stone_annihilation_nodes) do
        if pendingRemove == 0 then
            break
        end

        outputInventory = entity.get_output_inventory()
        count = outputInventory.remove({ name = "stone", count = pendingRemove })
        pendingRemove = pendingRemove - count
    end
end

script.on_event(
        defines.events.on_built_entity,
        on_stone_container_built,
        { { filter = "name", name = "stone-annihilation-node" }, { filter = "name", name = "stone-formation-node" } })

script.on_event(defines.events.on_tick, on_tick)