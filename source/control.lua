script.on_init(function()
    global.stone_annihilation_node_registration_numbers = {}
end)

function on_stone_annihilation_node_built(event)
    log('stone annihilation node was built')
    global.stone_annihilation_node_registration_numbers[script.register_on_entity_destroyed(event.created_entity)] = true
end

function on_entity_destroyed(event)
    if global.stone_annihilation_node_registration_numbers[event.registration_number] ~= nil then
        on_stone_annihilation_node_destroyed(event)
    end
end

function on_stone_annihilation_node_destroyed(event)
    log('stone annihilation node was destroyed')
end

script.on_event(
        defines.events.on_built_entity,
        on_stone_annihilation_node_built,
        { { filter = "name", name = "stone-annihilation-node" } })

script.on_event(defines.events.on_entity_destroyed, on_entity_destroyed)
