script.on_event(defines.events.on_built_entity, function(event)
    log(event.item.name .. ' was built')
end, {{ filter="name",name="stone-annihilation-node" }})