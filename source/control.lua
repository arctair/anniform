function on_stone_annihilation_node_built(event)
    log('stone annihilation node was built')
    global.last_built_registration_number = script.register_on_entity_destroyed(event.created_entity)
end

function on_entity_destroyed(event)
    if global.last_built_registration_number and event.registration_number == global.last_built_registration_number then
        on_last_built_stone_annihilation_node_destroyed(event)
    end
end

function on_last_built_stone_annihilation_node_destroyed(event)
    log('last built stone annihilation node was destroyed')
end

script.on_event(
        defines.events.on_built_entity,
        on_stone_annihilation_node_built,
        { { filter = "name", name = "stone-annihilation-node" } })

script.on_event(defines.events.on_entity_destroyed, on_entity_destroyed)
