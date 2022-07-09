local transportUnitsPerBelt = 200

function initialize()
    global.annihilation_chests = global.annihilation_chests or global.stone_annihilation_nodes or {}
    global.formation_chests = global.formation_chests or global.stone_formation_nodes or {}
    global.transport_chests = global.transport_chests or global.stone_transport_nodes or {}
    global.remaining_transport_units = global.remaining_transport_units or 0
end

function on_built_anniform_chest(event)
    target = nil
    if event.created_entity.name == "annihilation-chest" then
        target = global.annihilation_chests
    elseif event.created_entity.name == "formation-chest" then
        target = global.formation_chests
    else
        target = global.transport_chests
    end
    table.insert(target, event.created_entity)
end

function on_tick(event)
    local transportBeltCount = get_item_count(global.transport_chests, "transport-belt")
    local budget = transportBeltCount * transportUnitsPerBelt
    local cost = -global.remaining_transport_units
    for _, name in ipairs({ "stone", "iron-ore" }) do
        cost = cost + transport(budget - cost, name)
    end

    local annihilationCount = math.ceil(cost / transportUnitsPerBelt)
    remove(global.transport_chests, "transport-belt", annihilationCount)
    global.remaining_transport_units = annihilationCount * transportUnitsPerBelt - cost
end

function transport(budget, name)
    local stackSize = game.item_prototypes[name].stack_size
    local count = get_item_count(global.annihilation_chests, name)
    local formationCount = math.min(count, budget * stackSize / transportUnitsPerBelt)
    local actualFormationCount = insert(global.formation_chests, name, formationCount)
    remove(global.annihilation_chests, name, actualFormationCount)
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

script.on_init(initialize)
script.on_configuration_changed(initialize)
script.on_event(
        defines.events.on_built_entity,
        on_built_anniform_chest,
        {
            { filter = "name", name = "annihilation-chest" },
            { filter = "name", name = "formation-chest" },
            { filter = "name", name = "transport-chest" } })

script.on_event(defines.events.on_tick, on_tick)