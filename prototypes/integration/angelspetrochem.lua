bery0zas.pure_it.integration.angelspetrochem = {}

---@diagnostic disable

if not bery0zas.pure_it.triggers["leave-halite"] then
	bery0zas.functions.remove_technology_recipe("bery0zas-air-purification-3", "bery0zas-iron-halite-extraction")
	bery0zas.functions.remove_technology_recipe("bery0zas-air-purification-3", "bery0zas-copper-halite-extraction")
	bery0zas.functions.remove_recipe("bery0zas-iron-halite-extraction")
	bery0zas.functions.remove_recipe("bery0zas-copper-halite-extraction")
	bery0zas.functions.remove_item("bery0zas-halite")
end

bery0zas.functions.alter_recipe("bery0zas-spray-surface-recycling", "energy_required", nil, nil, nil, 5)
bery0zas.functions.alter_recipe("bery0zas-spray-surface-recycling", "ingredients", "name", "bery0zas-polluted-spray-surface", "amount", 3)
bery0zas.functions.alter_recipe("bery0zas-spray-surface-recycling", "results", "name", "bery0zas-spray-surface", "amount", 3)

bery0zas.functions.alter_recipe("bery0zas-water-absorption", "results", "name", "bery0zas-polluted-water", "name", "water-mineralized")
bery0zas.functions.alter_recipe("bery0zas-water-absorption-with-spraying", "results", "name", "bery0zas-polluted-water", "name", "water-mineralized")
bery0zas.functions.alter_recipe("bery0zas-oxygen-sparged-water-absorption", "ingredients", "name", "bery0zas-oxygen-sparged-water", "name", "bery0zas-oxygen-solution")
bery0zas.functions.alter_recipe("bery0zas-oxygen-sparged-water-absorption", "results", "name", "bery0zas-polluted-water", "name", "water-mineralized")
bery0zas.functions.alter_recipe("bery0zas-oxygen-sparged-water-absorption-with-spraying", "ingredients", "name", "bery0zas-oxygen-sparged-water", "name", "bery0zas-oxygen-solution")
bery0zas.functions.alter_recipe("bery0zas-oxygen-sparged-water-absorption-with-spraying", "results", "name", "bery0zas-polluted-water", "name", "water-mineralized")
bery0zas.functions.alter_recipe("bery0zas-sodium-hydroxide-sparged-water-absorption", "ingredients", "name", "bery0zas-sodium-hydroxide-sparged-water", "name", "liquid-aqueous-sodium-hydroxide")
bery0zas.functions.alter_recipe("bery0zas-sodium-hydroxide-sparged-water-absorption", "ingredients", "name", "bery0zas-polluted-air", "amount", 6)
bery0zas.functions.alter_recipe("bery0zas-sodium-hydroxide-sparged-water-absorption", "ingredients", "name", "liquid-aqueous-sodium-hydroxide", "amount", 12)
bery0zas.functions.alter_recipe("bery0zas-sodium-hydroxide-sparged-water-absorption", "results", "name", "bery0zas-polluted-water", "name", "water-mineralized")
bery0zas.functions.alter_recipe("bery0zas-sodium-hydroxide-sparged-water-absorption-with-spraying", "ingredients", "name", "bery0zas-sodium-hydroxide-sparged-water", "name", "liquid-aqueous-sodium-hydroxide")
bery0zas.functions.alter_recipe("bery0zas-sodium-hydroxide-sparged-water-absorption-with-spraying", "results", "name", "bery0zas-polluted-water", "name", "water-mineralized")

bery0zas.functions.alter_recipe("bery0zas-adsorption-coil-mk1-with-activated-carbon", "energy_required", nil, nil, nil, 1)
bery0zas.functions.alter_recipe("bery0zas-adsorption-coil-mk1-with-activated-carbon", "ingredients", "name", "bery0zas-adsorption-coil-mk1", "amount", 3)
bery0zas.functions.alter_recipe("bery0zas-adsorption-coil-mk1-with-activated-carbon", "results", "name", "bery0zas-adsorption-coil-mk1-with-activated-carbon", "amount", 3)
bery0zas.functions.alter_recipe("bery0zas-adsorption-coil-mk2-with-cellular-carbon", "energy_required", nil, nil, nil, 1)
bery0zas.functions.alter_recipe("bery0zas-adsorption-coil-mk2-with-cellular-carbon", "ingredients", "name", "bery0zas-adsorption-coil-mk2", "amount", 3)
bery0zas.functions.alter_recipe("bery0zas-adsorption-coil-mk2-with-cellular-carbon", "results", "name", "bery0zas-adsorption-coil-mk2-with-cellular-carbon", "amount", 3)
data.raw["assembling-machine"]["bery0zas-air-adsorber-1"].energy_usage = "100kW"

bery0zas.functions.alter_recipe("bery0zas-coal-adsorption", "energy_required", nil, nil, nil, 30)
bery0zas.functions.alter_recipe("bery0zas-coal-adsorption", "ingredients", "name", "bery0zas-polluted-air", "amount", 2)
bery0zas.functions.alter_recipe("bery0zas-coal-adsorption-with-steam", "ingredients", "name", "coal", "amount", 1)
bery0zas.functions.alter_recipe("bery0zas-coal-adsorption-with-steam", "energy_required", nil, nil, nil, 30)
bery0zas.functions.alter_recipe("bery0zas-activated-carbon-adsorption", "energy_required", nil, nil, nil, 30)
bery0zas.functions.alter_recipe("bery0zas-cellular-carbon-adsorption", "energy_required", nil, nil, nil, 30)

bery0zas.functions.remove_technology_recipe("bery0zas-air-purification-1", "bery0zas-polluted-water-recycling")
bery0zas.functions.remove_technology_recipe("bery0zas-air-purification-2", "bery0zas-oxygen-extraction")
bery0zas.functions.remove_technology_recipe("bery0zas-air-purification-2", "bery0zas-oxygen-sparging")
bery0zas.functions.remove_technology_recipe("bery0zas-air-purification-3", "bery0zas-iron-halite-extraction")
bery0zas.functions.remove_technology_recipe("bery0zas-air-purification-3", "bery0zas-copper-halite-extraction")
bery0zas.functions.remove_technology_recipe("bery0zas-air-purification-3", "bery0zas-sodium-hydroxide")
bery0zas.functions.remove_technology_recipe("bery0zas-air-purification-3", "bery0zas-sodium-hydroxide-sparging")

bery0zas.functions.remove_recipe("bery0zas-iron-halite-extraction")
bery0zas.functions.remove_recipe("bery0zas-copper-halite-extraction")
bery0zas.functions.remove_recipe("bery0zas-oxygen-extraction")
bery0zas.functions.remove_recipe("bery0zas-oxygen-sparging")
bery0zas.functions.remove_recipe("bery0zas-sodium-hydroxide")
bery0zas.functions.remove_recipe("bery0zas-sodium-hydroxide-sparging")
bery0zas.functions.remove_recipe("bery0zas-polluted-water-recycling")

bery0zas.functions.remove_fluid("bery0zas-oxygen")
bery0zas.functions.remove_fluid("bery0zas-oxygen-sparged-water")
bery0zas.functions.remove_fluid("bery0zas-sodium-hydroxide")
bery0zas.functions.remove_fluid("bery0zas-sodium-hydroxide-sparged-water")

-- FLUIDS --
data:extend({
	{
		type = "fluid",
		name = "bery0zas-oxygen-solution",
		default_temperature = 15,
		max_temperature = 100,
		base_color = { r = 0.62, g = 0.7, b = 0.95 },
		flow_color = { r = 0.62, g = 0.7, b = 0.95 },
		--create_viscous_liquid_fluid_icon(molecule_icon, tints)
		icons = angelsmods.functions.create_viscous_liquid_fluid_icon(nil, {{094, 114, 174}, {198, 011, 011}}),
		auto_barrel = false
	},
})

-- RECIPES --
data:extend({
	{
		type = "recipe",
		name = "bery0zas-oxygen-solution",
		energy_required = 10,
		category = "bery0zas-air-filtering-sparging",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "water-purified", amount = 20 },
			{ type = "fluid", name = "gas-oxygen", amount = 200 }
		},
		--create_liquid_recipe_icon(bot_molecules_icon, tints, top_molecules_icon)
		icons = angelsmods.functions.create_liquid_recipe_icon(nil, {{249, 013, 013}, {094, 114, 174}, {088, 101, 155}}),
		subgroup = "liquifying",
		results = {{ type = "fluid", name = "bery0zas-oxygen-solution", amount = 20 }},
		order = "l[oxygen-solution]-a[generation]",
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-sodium-hydroxide-solution",
		energy_required = 10,
		category = "bery0zas-air-filtering-sparging",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "water-purified", amount = 50 },
			{ type = "item", name = "solid-sodium-hydroxide", amount = 1 }
		},
		icons = angelsmods.functions.create_liquid_recipe_icon(nil, {{151, 212, 255}, {255, 255, 255}, {255, 255, 255}}),
		subgroup = "liquifying",
		results = {{ type = "fluid", name = "liquid-aqueous-sodium-hydroxide", amount = 50 }},
		order = "k[liquid-sodium-hydroxide]-b[hydroxide]",
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-coal-filter-adsorption",
		energy_required = 30,
		category = "bery0zas-air-filtering-adsorption",
		enabled = false,
		ingredients =
		{
			{ type = "item", name = "filter-coal", amount = 3 },
			{ type = "fluid", name = "bery0zas-polluted-air", amount = 4, fluidbox_index = 2 }
		},
		icon = "__angelsrefining__/graphics/icons/filter-coal.png",
		icon_size = 32,
		subgroup = "terrain",
		results =
		{
			{ type = "item", name = "filter-frame", amount = 3 }
		},
		main_product = ""
	}
})

if bery0zas.pure_it.triggers["leave-halite"] then
	data:extend({
		{
			type = "recipe",
			name = "bery0zas-solid-sodium-hydroxide",
			energy_required = 10,
			category = "liquifying",
			enabled = false,
			ingredients = {
				{ type = "item", name = "bery0zas-halite", amount = 5 },
				{ type = "fluid", name = "water-purified", amount = 50 }
			},
			icon_size = 32,
			subgroup = "petrochem-sodium",
			results = {{ type = "item", name = "solid-sodium-hydroxide", amount = 5 }},
			order = "c[sodium-hydroxide]-a[generation]",
			main_product = "solid-sodium-hydroxide"
		}
	})
end

--TECHNOLOGIES--
bery0zas.functions.add_technology_recipe("bery0zas-air-purification-2", "bery0zas-oxygen-solution")
bery0zas.functions.add_technology_recipe("bery0zas-air-purification-2", "bery0zas-coal-filter-adsorption")
bery0zas.functions.add_technology_recipe("bery0zas-air-purification-3", "bery0zas-sodium-hydroxide-solution")

if bery0zas.pure_it.triggers["leave-halite"] then
	bery0zas.functions.add_technology_recipe("bery0zas-air-purification-3", "bery0zas-solid-sodium-hydroxide")
end
