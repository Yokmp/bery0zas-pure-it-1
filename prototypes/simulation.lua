

---@param entity_name string
---@param simulation? PureIt.SimulationDefinition
function bery0zas.functions.update_factoriopedia_simulation(entity_name, simulation)
  simulation            = simulation or {}
  simulation.position   = simulation.position or {0, -1.7}
  simulation.zoom       = simulation.zoom or 1.1
  simulation.direction  = simulation.direction or 4
  local entity = data.raw["assembling-machine"][entity_name]

  data.raw["assembling-machine"][entity_name].factoriopedia_simulation = { init = [[
    game.simulation.camera_position = {]]..simulation.position[1]..[[,]]..simulation.position[2]..[[}
    game.simulation.camera_zoom = ]]..simulation.zoom..[[

    game.surfaces[1].create_entity{name = "]]..entity_name..[[", position = {0, 0}, direction = ]]..simulation.direction..[[}
    ]],
    checkboard = true,
    hide_factoriopedia_gradient = true
  }
end


    -- for x = -20, 20, 1 do
    --   for y = -15, 15 do
    --     game.surfaces[1].set_tiles{{position = {x, y}, name = "empty-space"}}
    --   end
    -- end