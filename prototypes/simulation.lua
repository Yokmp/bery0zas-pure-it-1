

---@param entity_name string
---@param simulation? PureIt.SimulationDefinition
function bery0zas.functions.update_factoriopedia_simulation(entity_name, simulation)
  simulation = simulation or {}
  simulation.position = simulation.position or {0, -1.7}
  simulation.zoom = simulation.zoom or 1.1
  simulation.direction = simulation.direction or 4
  local entity = data.raw["assembling-machine"][entity_name]

  data.raw["assembling-machine"][entity_name].factoriopedia_simulation = { init = [[
    game.simulation.camera_position = {]]..simulation.position[1]..[[,]]..simulation.position[2]..[[}
    game.simulation.camera_zoom = ]]..simulation.zoom..[[
    for x = -20, 20, 1 do
      for y = -15, 15 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "empty-space"}}
      end
    end
    game.surfaces[1].create_entity{name = "]]..entity_name..[[", position = {0, 0}, direction = ]]..simulation.direction..[[}
    ]],
    checkboard = true,
    hide_factoriopedia_gradient = true
  }
end



      -- game.surfaces[1].create_entities_from_blueprint_string
      -- {
      --   string = "0eNqNj90OgjAMhd+l15sBw4jsVYwhAxvTBDrcj4qEd3fD6J2Jlz09/U7PAt0QcXLEAfQC1Fv2oI8LeLqwGbLGZkTQ0KGbi6fx0pCTPvaBLMtg7+hkCasA4jM+QJfrSQByoED4Jm3D3HIcEyIZxF9EAZP1lKX8QwLvq50SMIM+pDCHPU2/GPDZt9dohpSdfGzdmOrk5yjgmC+/vQXc0PktSdX7pmoaVauiVEW1ri8wUWFZ",
      --   position = {0, 0}
      -- }