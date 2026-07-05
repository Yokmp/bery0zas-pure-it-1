local runner = {}

local function array_contains(values, value)
	for _, item in ipairs(values or {}) do
		if item == value then return true end
	end
	return false
end

local function technology_unlocks_recipe(technology_name, recipe_name)
	local technology = data.raw.technology[technology_name]
	for _, effect in ipairs((technology and technology.effects) or {}) do
		if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
			return true
		end
	end
	return false
end

local function result_named(recipe_name, result_name)
	for _, result in ipairs((data.raw.recipe[recipe_name] and data.raw.recipe[recipe_name].results) or {}) do
		if result.name == result_name then return result end
	end
	return nil
end

local function ingredient_named(recipe_name, ingredient_name)
	for _, ingredient in ipairs((data.raw.recipe[recipe_name] and data.raw.recipe[recipe_name].ingredients) or {}) do
		if ingredient.name == ingredient_name then return ingredient end
	end
	return nil
end

local function angel_mineralized_water_name()
	if data.raw.fluid["angels-water-mineralized"] then return "angels-water-mineralized" end
	return "water-mineralized"
end

local function entity_templates()
	return {
		bery0zas.pure_it.entities.air_suction_tower,
		bery0zas.pure_it.entities.air_absorber,
		bery0zas.pure_it.entities.air_adsorber,
		bery0zas.pure_it.entities.sparging_column
	}
end

function runner.run(profile)
	profile = profile or {}

	local report = {
		schema = "bery0zas-pure-it-test-report/v1",
		mod = "bery0zas-pure-it-updated",
		factorio_version = helpers and helpers.game_version or "unknown",
		profile = profile.name or bery0zas.pure_it.test_profile or "default",
		status = "pass",
		summary = { total = 0, passed = 0, failed = 0 },
		cases = {},
		context = {
			mods = mods,
			settings = {
				collected_pollution = settings.startup["bery0zas-pure-it-amountofcollectedpollution"].value,
				integrate_bobs = settings.startup["bery0zas-pure-it-integrate-bobs"] and settings.startup["bery0zas-pure-it-integrate-bobs"].value,
				integrate_angelspetrochem = settings.startup["bery0zas-pure-it-integrate-angelspetrochem"] and settings.startup["bery0zas-pure-it-integrate-angelspetrochem"].value,
			}
		}
	}

	local function add_case(id, name, ok, message, details)
		report.summary.total = report.summary.total + 1
		if ok then
			report.summary.passed = report.summary.passed + 1
		else
			report.summary.failed = report.summary.failed + 1
			report.status = "fail"
		end
		table.insert(report.cases, {
			id = id,
			name = name,
			status = ok and "pass" or "fail",
			message = message or (ok and "ok" or "failed"),
			details = details,
		})
	end

	add_case("settings.test-mode", "hidden startup setting enables the data-stage test report",
		settings.startup["bery0zas-pure-it-test-mode"] and settings.startup["bery0zas-pure-it-test-mode"].value == true)

	for _, category in ipairs(bery0zas.pure_it.recipe_categories or {}) do
		add_case("category." .. category, category .. " recipe category exists",
			data.raw["recipe-category"][category] ~= nil)
	end

	add_case("input.rotate-right", "rotate-right custom input exists",
		data.raw["custom-input"]["bery0zas-rotate-right"] ~= nil)
	add_case("input.rotate-left", "rotate-left custom input exists",
		data.raw["custom-input"]["bery0zas-rotate-left"] ~= nil)

	for _, fluid_name in ipairs({
		"bery0zas-polluted-air",
		"bery0zas-polluted-water",
		"bery0zas-oxygen",
		"bery0zas-oxygen-sparged-water",
		"bery0zas-sodium-hydroxide",
		"bery0zas-sodium-hydroxide-sparged-water",
	}) do
		local expected = true
		if bery0zas.pure_it.triggers["integrate-bobplates"] and fluid_name == "bery0zas-oxygen" then
			expected = false
		end
		if bery0zas.pure_it.triggers["integrate-angelspetrochem"] and (
			fluid_name == "bery0zas-oxygen" or
			fluid_name == "bery0zas-oxygen-sparged-water" or
			fluid_name == "bery0zas-sodium-hydroxide" or
			fluid_name == "bery0zas-sodium-hydroxide-sparged-water"
		) then
			expected = false
		end
		add_case("fluid." .. fluid_name, fluid_name .. " fluid has expected presence",
			(data.raw.fluid[fluid_name] ~= nil) == expected,
			nil,
			{ expected = expected })
	end

	for _, item_name in ipairs({
		"bery0zas-spray-surface",
		"bery0zas-polluted-spray-surface",
		"bery0zas-activated-carbon",
		"bery0zas-cellular-carbon",
		"bery0zas-adsorption-coil-mk1",
		"bery0zas-adsorption-coil-mk2",
	}) do
		add_case("item." .. item_name, item_name .. " item exists",
			data.raw.item[item_name] ~= nil)
	end

	add_case("item.halite-presence", "halite follows angelspetrochem leave-halite trigger",
		(data.raw.item["bery0zas-halite"] ~= nil) == bery0zas.pure_it.triggers["leave-halite"],
		nil,
		{ expected = bery0zas.pure_it.triggers["leave-halite"] })

	for _, template in ipairs(entity_templates()) do
		for tier = 1, template.tiers do
			local name = template.name .. "-" .. tier
			local prototype = data.raw[template.entity.type] and data.raw[template.entity.type][name]
			local item = data.raw.item[name]
			local recipe = data.raw.recipe[name]
			add_case("entity." .. name, name .. " entity, item, and recipe are registered",
				prototype ~= nil and item ~= nil and recipe ~= nil,
				nil,
				{ type = template.entity.type, has_entity = prototype ~= nil, has_item = item ~= nil, has_recipe = recipe ~= nil })
			add_case("entity." .. name .. ".links", name .. " item and recipe point back to the entity",
				prototype and item and recipe and
					item.place_result == name and
					prototype.minable and prototype.minable.result == name and
					recipe.results and recipe.results[1] and recipe.results[1].name == name,
				nil,
				{ place_result = item and item.place_result, minable = prototype and prototype.minable, results = recipe and recipe.results })
		end
	end

	local setting_emission = settings.startup["bery0zas-pure-it-amountofcollectedpollution"].value
	for tier = 1, 3 do
		local name = "bery0zas-air-suction-tower-" .. tier
		local machine = data.raw["assembling-machine"][name]
		local pollution = machine and machine.energy_source and machine.energy_source.emissions_per_minute and
			machine.energy_source.emissions_per_minute.pollution
		add_case("emissions." .. name, name .. " collected pollution setting is applied",
			pollution == -setting_emission * tier,
			nil,
			{ expected = -setting_emission * tier, actual = pollution })
	end

	add_case("recipe.air-suction", "air suction produces polluted air",
		result_named("bery0zas-air-suction", "bery0zas-polluted-air") ~= nil)
	add_case("recipe.water-absorption", "water absorption consumes polluted air and produces polluted water",
		ingredient_named("bery0zas-water-absorption", "bery0zas-polluted-air") ~= nil and
			(
				result_named("bery0zas-water-absorption", "bery0zas-polluted-water") ~= nil or
				(bery0zas.pure_it.triggers["integrate-angelspetrochem"] and
					result_named("bery0zas-water-absorption", angel_mineralized_water_name()) ~= nil)
			))
	add_case("recipe.polluted-water-recycling", "polluted water recycling returns water and byproducts when present",
		not data.raw.recipe["bery0zas-polluted-water-recycling"] or
			result_named("bery0zas-polluted-water-recycling", "water") ~= nil)

	for _, check in ipairs({
		{ tech = "bery0zas-air-purification-1", recipe = "bery0zas-air-suction-tower-1" },
		{ tech = "bery0zas-air-purification-1", recipe = "bery0zas-air-absorber-1" },
		{ tech = "bery0zas-air-purification-1", recipe = "bery0zas-air-adsorber-1" },
		{ tech = "bery0zas-air-purification-2", recipe = "bery0zas-air-suction-tower-2" },
		{ tech = "bery0zas-air-purification-2", recipe = "bery0zas-sparging-column-1" },
		{ tech = "bery0zas-air-purification-3", recipe = "bery0zas-air-suction-tower-3" },
	}) do
		add_case("technology." .. check.tech .. "." .. check.recipe, check.tech .. " unlocks " .. check.recipe,
			technology_unlocks_recipe(check.tech, check.recipe))
	end

	for tech_name, tech in pairs(data.raw.technology or {}) do
		if tech_name:match("^bery0zas%-") then
			for index, effect in ipairs(tech.effects or {}) do
				if effect.type == "unlock-recipe" then
					add_case("technology." .. tech_name .. ".unlock." .. index,
						tech_name .. " unlock target exists: " .. effect.recipe,
						data.raw.recipe[effect.recipe] ~= nil,
						nil,
						{ recipe = effect.recipe })
				end
			end
		end
	end

	add_case("crafting.assembling-machine-1.machine", "assembling-machine-1 can craft Pure It machine recipes",
		array_contains(data.raw["assembling-machine"]["assembling-machine-1"].crafting_categories, "bery0zas-air-filtering-machine"))
	add_case("crafting.chemical-plant.chemistry", "chemical plant can craft Pure It chemistry recipes",
		array_contains(data.raw["assembling-machine"]["chemical-plant"].crafting_categories, "bery0zas-air-filtering-chemistry"))

	if mods["space-age"] then
		local oxygen_extraction = data.raw.recipe["bery0zas-oxygen-extraction"]
		local conditions = oxygen_extraction and oxygen_extraction.surface_conditions
		add_case("space-age.oxygen-extraction.surface-conditions", "space-age oxygen extraction has pressure conditions when present",
			oxygen_extraction == nil or
				(conditions and conditions[1] and conditions[1].property == "pressure" and conditions[1].min == 1000 and conditions[1].max == 2000),
			nil,
			{ surface_conditions = conditions, present = oxygen_extraction ~= nil })
	end

	return report
end

return runner
