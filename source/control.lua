local transportUnitsPerBelt = 200

function on_stone_container_built(event)
    target = nil
    if event.created_entity.name == "stone-annihilation-node" then
        target = global.stone_annihilation_nodes
    elseif event.created_entity.name == "stone-formation-node" then
        target = global.stone_formation_nodes
    else
        target = global.stone_transport_nodes
    end
    table.insert(target, event.created_entity)
end

function on_tick(event)
    local transportBeltCount = get_item_count(global.stone_transport_nodes, "transport-belt")
    local budget = transportBeltCount * transportUnitsPerBelt + global.remaining_transport_units
    local cost = -global.remaining_transport_units
    for _, name in ipairs({ "stone", "iron-ore" }) do
        cost = cost + transport(budget - cost, name)
    end

    local annihilationCount = math.ceil(cost / transportUnitsPerBelt)
    remove(global.stone_transport_nodes, "transport-belt", annihilationCount)
    global.remaining_transport_units = annihilationCount * transportUnitsPerBelt - cost
end

function transport(budget, name)
    local stackSize = game.item_prototypes[name].stack_size
    local count = get_item_count(global.stone_annihilation_nodes, name)
    local formationCount = math.min(count, budget * stackSize / transportUnitsPerBelt)
    local actualFormationCount = insert(global.stone_formation_nodes, name, formationCount)
    remove(global.stone_annihilation_nodes, name, actualFormationCount)
    return actualFormationCount * transportUnitsPerBelt / stackSize
end

function get_item_count(containers, name)
    local count = 0
    for _, entity in ipairs(containers) do
        if entity.valid then
            outputInventory = entity.get_output_inventory()
            count = count + outputInventory.get_item_count(name)
        end
    end
    return count
end

function insert(containers, name, tryCount)
    local actualCount = 0
    for _, entity in ipairs(containers) do
        if tryCount == 0 then
            break
        end

        if entity.valid then
            local outputInventory = entity.get_output_inventory()
            local count = outputInventory.insert({ name = name, count = tryCount })
            tryCount = tryCount - count
            actualCount = actualCount + count
        end
    end
    return actualCount
end

function remove(containers, name, tryCount)
    for _, entity in ipairs(containers) do
        if tryCount == 0 then
            break
        end

        if entity.valid then
            local outputInventory = entity.get_output_inventory()
            local count = outputInventory.remove({ name = name, count = tryCount })
            tryCount = tryCount - count
        end
    end
end

script.on_configuration_changed(function(configuration_changed_data)
    global.stone_annihilation_nodes = global.stone_annihilation_nodes or {}
    global.stone_formation_nodes = global.stone_formation_nodes or {}
    global.stone_transport_nodes = global.stone_transport_nodes or {}
    global.remaining_transport_units = global.remaining_transport_units or 0
end)

script.on_event(
        defines.events.on_built_entity,
        on_stone_container_built,
        {
            { filter = "name", name = "stone-annihilation-node" },
            { filter = "name", name = "stone-formation-node" },
            { filter = "name", name = "stone-transport-node" } })

script.on_event(defines.events.on_tick, on_tick)