function bery0zas.pure_it.integration.angelspetrochem.halite_recipe(ore_number)
	table.insert(data.raw.recipe["angelsore" .. ore_number .. "-crushed-processing"].results, { name = "bery0zas-halite", probability = 0.05, amount = 1 })
	table.insert(data.raw.recipe["angelsore" .. ore_number .. "-chunk-processing"].results, { name = "bery0zas-halite", probability = 0.1, amount = 1 })
	table.insert(data.raw.recipe["angelsore" .. ore_number .. "-crystal-processing"].results, { name = "bery0zas-halite", probability = 0.2, amount = 1 })
	table.insert(data.raw.recipe["angelsore" .. ore_number .. "-pure-processing"].results, { name = "bery0zas-halite", probability = 0.4, amount = 1 })
end

if bery0zas.pure_it.triggers["leave-halite"] then
	bery0zas.pure_it.integration.angelspetrochem.halite_recipe(1)
	bery0zas.pure_it.integration.angelspetrochem.halite_recipe(2)
	bery0zas.pure_it.integration.angelspetrochem.halite_recipe(3)
	bery0zas.pure_it.integration.angelspetrochem.halite_recipe(4)
end

bery0zas.functions.alter_recipe("filter-coal", "ingredients", "name", "coal", "amount", 2)