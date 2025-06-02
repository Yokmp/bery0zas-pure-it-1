bery0zas.pure_it.entities = {}

require("entities.air-absorber")
require("entities.air-adsorber")
require("entities.air-suction-tower")
require("entities.sparging-column")


local entities = {
  bery0zas.pure_it.entities.air_suction_tower,
  bery0zas.pure_it.entities.air_absorber,
  bery0zas.pure_it.entities.air_adsorber,
  bery0zas.pure_it.entities.sparging_column
}

for _, entity in ipairs(entities) do
  bery0zas.functions.register_entity(entity)
  for i = 1, entity.tiers, 1 do
    bery0zas.functions.update_factoriopedia_simulation(entity.name.."-"..i, entity.factoriopedia)
  end
end



-- bery0zas.functions.update_factoriopedia_simulation("bery0zas-air-suction-tower-1")
-- bery0zas.functions.update_factoriopedia_simulation("bery0zas-sparging-column-1")
-- bery0zas.functions.update_factoriopedia_simulation("bery0zas-air-absorber-1")
-- bery0zas.functions.update_factoriopedia_simulation("bery0zas-air-adsorber-1")