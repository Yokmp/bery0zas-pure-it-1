bery0zas.pure_it.entities = {}

require("entities.air-absorber")
require("entities.air-adsorber")
require("entities.air-suction-tower")
require("entities.sparging-column")

bery0zas.functions.register_entity(bery0zas.pure_it.entities.air_suction_tower, 3)
bery0zas.functions.register_entity(bery0zas.pure_it.entities.air_absorber, 3)
bery0zas.functions.register_entity(bery0zas.pure_it.entities.air_adsorber, 1)
bery0zas.functions.register_entity(bery0zas.pure_it.entities.sparging_column, 1)


-- log(serpent.block(data.raw["assembling-machine"]["bery0zas-air-adsorber-1"].name))
-- log(serpent.block(data.raw.recipe["bery0zas-air-adsorber-1"]))
-- log(serpent.block(data.raw.item["bery0zas-air-adsorber-1"].name))
-- log(serpent.block(data.raw["assembling-machine"]["bery0zas-sparging-column-1"].name))
-- log(serpent.block(data.raw.recipe["bery0zas-sparging-column-1"]))
-- log(serpent.block(data.raw.item["bery0zas-sparging-column-1"].name))