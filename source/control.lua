script.on_configuration_changed(function(configuration_changed_data)
    global.stone_annihilation_nodes = global.stone_annihilation_nodes or {}
    global.stone_formation_nodes = global.stone_formation_nodes or {}
    global.stone_transport_nodes = global.stone_transport_nodes or {}
    global.transport_belt_remainder = global.transport_belt_remainder or 0
end)

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
    local maxStackSize = 50

    local stoneCount = get_item_count(global.stone_annihilation_nodes, "stone")
    local transportBeltCount = get_item_count(global.stone_transport_nodes, "transport-belt") + global.transport_belt_remainder
    local stoneFormationCount = math.min(stoneCount, math.floor(transportBeltCount * maxStackSize))
    local actualStoneFormationCount = insert(global.stone_formation_nodes, "stone", stoneFormationCount)
    remove(global.stone_annihilation_nodes, "stone", actualStoneFormationCount)

    local transportBeltCost = actualStoneFormationCount / maxStackSize - global.transport_belt_remainder
    local transportBeltCostCeil = math.ceil(transportBeltCost)
    global.transport_belt_remainder = transportBeltCostCeil - transportBeltCost
    remove(global.stone_transport_nodes, "transport-belt", transportBeltCostCeil)
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

script.on_event(
        defines.events.on_built_entity,
        on_stone_container_built,
        {
            { filter = "name", name = "stone-annihilation-node" },
            { filter = "name", name = "stone-formation-node" },
            { filter = "name", name = "stone-transport-node" } })

script.on_event(defines.events.on_tick, on_tick)