script.on_init(function()
    global.stone_annihilation_node_entities_by_registration_number = {}
    global.stone_count_by_unit_number = {}
end)

function on_stone_annihilation_node_built(event)
    log('stone annihilation node was built')
    global.stone_annihilation_node_entities_by_registration_number[script.register_on_entity_destroyed(event.created_entity)] = event.created_entity
end

function on_entity_destroyed(event)
    if global.stone_annihilation_node_entities_by_registration_number[event.registration_number] ~= nil then
        on_stone_annihilation_node_destroyed(event)
    end
end

function on_stone_annihilation_node_destroyed(event)
    log('stone annihilation node was destroyed')
end

function on_tick(event)
    for _, entity in ipairs(global.stone_annihilation_node_entities_by_registration_number) do
        if entity.valid then
            on_tick_stone_annihilation_node({ entity = entity })
        end
    end
end

function on_tick_stone_annihilation_node(event)
    unit_number = event.entity.unit_number
    stoneCount = event.entity.get_output_inventory().get_item_count("stone")
    lastStoneCount = global.stone_count_by_unit_number[unit_number]
    global.stone_count_by_unit_number[unit_number] = stoneCount

    if lastStoneCount ~= nil and lastStoneCount ~= stoneCount then
        on_stone_annihilation_node_stone_count_changed({
            entity = event.entity,
            lastStoneCount = lastStoneCount,
            stoneCount = stoneCount })
    end
end

function on_stone_annihilation_node_stone_count_changed(event)
    log("stone count for annihilation node " .. event.entity.unit_number .. " changed to " .. stoneCount)
end

script.on_event(
        defines.events.on_built_entity,
        on_stone_annihilation_node_built,
        { { filter = "name", name = "stone-annihilation-node" } })

script.on_event(defines.events.on_entity_destroyed, on_entity_destroyed)

script.on_event(defines.events.on_tick, on_tick)