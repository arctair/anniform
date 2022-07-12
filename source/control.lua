local transportGasPerStack = 200

function initialize()
    global.containers_by_name = global.containers_by_name or {}
    global.containers_by_name["annihilation-chest"] = global.containers_by_name["annihilation-chest"] or global.annihilation_chests
    global.containers_by_name["formation-chest"] = global.containers_by_name["formation-chest"] or global.formation_chests
    global.containers_by_name["transport-chest"] = global.containers_by_name["transport-chest"] or global.transport_chests
    global.remaining_transport_units = global.remaining_transport_units or 0
end

function on_built_anniform_chest(event)
    target = global.containers_by_name[event.created_entity.name]
    if target ~= nil then
        table.insert(target, event.created_entity)
    else
        global.containers_by_name[event.created_entity.name] = { target }
    end
end

function on_tick(event)
    transport_engines = global.containers_by_name["transport-engine"] or {}
    local budget = get_fluid_count(transport_engines, "transport-gas")
    local cost = -global.remaining_transport_units
    for _, name in ipairs({ "stone", "iron-ore" }) do
        cost = cost + transport(budget - cost, name)
    end
    remove_fluid(transport_engines, "transport-gas", cost)
    global.remaining_transport_units = 0
end

function get_fluid_count(containers, name)
    local count = 0
    for _, entity in ipairs(containers) do
        if entity.valid then
            count = count + entity.get_fluid_count(name)
        end
    end
    return count
end

function transport(budget, name)
    annihilation_chests = global.containers_by_name["annihilation-chest"]
    formation_chests = global.containers_by_name["formation-chest"]
    local stackSize = game.item_prototypes[name].stack_size
    local count = get_item_count(annihilation_chests, name)
    local formationCount = math.min(count, math.floor(budget * stackSize / transportGasPerStack))
    local actualFormationCount = insert(formation_chests, name, formationCount)
    remove_items(annihilation_chests, name, actualFormationCount)
    return actualFormationCount * transportGasPerStack / stackSize
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

function remove_items(containers, name, tryCount)
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

function remove_fluid(containers, name, tryCount)
    for _, entity in ipairs(containers) do
        if tryCount == 0 then
            break
        end

        if entity.valid then
            local count = entity.remove_fluid({ name = name, amount = tryCount })
            tryCount = tryCount - count
        end
    end
end

script.on_init(initialize)
script.on_configuration_changed(initialize)
script.on_event(
        defines.events.on_built_entity,
        on_built_anniform_chest,
        { { filter = "name", name = "annihilation-chest" },
          { filter = "name", name = "formation-chest" },
          { filter = "name", name = "transport-engine" } })

script.on_event(defines.events.on_tick, on_tick)