function bery0zas.pure_it.integration.angelspetrochem.halite_recipe(ore_number)
	local recipes = {
		{ name = "angelsore" .. ore_number .. "-crushed-processing", probability = 0.05 },
		{ name = "angelsore" .. ore_number .. "-chunk-processing", probability = 0.1 },
		{ name = "angelsore" .. ore_number .. "-crystal-processing", probability = 0.2 },
		{ name = "angelsore" .. ore_number .. "-pure-processing", probability = 0.4 },
	}
	for _, entry in ipairs(recipes) do
		local recipe = data.raw.recipe[entry.name]
		if recipe then
			recipe.results = recipe.results or {}
			table.insert(recipe.results, { type = "item", name = "bery0zas-halite", probability = entry.probability, amount = 1 })
		end
	end
end

if bery0zas.pure_it.triggers["leave-halite"] then
	bery0zas.pure_it.integration.angelspetrochem.halite_recipe(1)
	bery0zas.pure_it.integration.angelspetrochem.halite_recipe(2)
	bery0zas.pure_it.integration.angelspetrochem.halite_recipe(3)
	bery0zas.pure_it.integration.angelspetrochem.halite_recipe(4)
end

bery0zas.functions.alter_recipe("filter-coal", "ingredients", "name", "coal", "amount", 2)
bery0zas.functions.alter_recipe("angels-filter-coal", "ingredients", "name", "coal", "amount", 2)
