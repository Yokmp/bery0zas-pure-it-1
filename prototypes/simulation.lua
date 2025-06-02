
---@param old_entity_name string current name
---@param new_entity_name string new name
---@param simulation data.SimulationDefinition Entity simulation data
function bery0zas.functions.update_factoriopedia_simulation(old_entity_name, new_entity_name, simulation)
  simulation.init = simulation.init or ""
  simulation.init = simulation.init .. [[
    for _, surface in pairs(game.surfaces) do
      local original_entities = surface.find_entities_filtered { name = "]] .. old_entity_name .. [[" }
      for _, original_entity in pairs(original_entities) do
        surface.create_entity {
          name = "]] .. new_entity_name .. [[",
          position = original_entity.position,
          force = original_entity.force,
          direction = original_entity.direction,
          fluidbox = original_entity.fluidbox,
          fast_replace = true,
          spill = false
        }
      end
    end
  ]]
end