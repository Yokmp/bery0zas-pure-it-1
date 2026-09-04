data:extend({
	{
		type = "recipe",
		name = "bery0zas-spray-surface",
		energy_required = 10,
		category = "bery0zas-air-filtering-item",
		enabled = false,
		ingredients = { { type = "item", name = "iron-plate", amount = 2 }, { type = "item", name = "iron-stick", amount = 6 } },
		icons = { {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/spray-surface.png",
			icon_size = 64,
		} },
		subgroup = "bery0zas-air-filter-materials",
		order = "b[spray-surface]-a[craft]",
		results = { { type = "item", name = "bery0zas-spray-surface", amount = 1 } }
	},
	{
		type = "recipe",
		name = "bery0zas-iron-halite-extraction",
		energy_required = 2,
		category = "bery0zas-air-filtering-item",
		enabled = false,
		ingredients = { { type = "item", name = "iron-ore", amount = 20 } },
		icons = { {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/iron-halite-extraction.png",
			icon_size = 64,
		} },
		subgroup = "bery0zas-air-filter-materials",
		order = "c[halite]-a[iron]",
		results =
		{
			{ type = "item", name = "iron-ore",        amount = 19 },
			{ type = "item", name = "bery0zas-halite", amount = 1 }
		}
	},
	{
		type = "recipe",
		name = "bery0zas-copper-halite-extraction",
		energy_required = 2,
		category = "bery0zas-air-filtering-item",
		enabled = false,
		ingredients = { { type = "item", name = "copper-ore", amount = 20 } },
		icons = { {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/copper-halite-extraction.png",
			icon_size = 64,
		} },
		subgroup = "bery0zas-air-filter-materials",
		order = "c[halite]-b[copper]",
		results =
		{
			{ type = "item", name = "copper-ore",      amount = 19 },
			{ type = "item", name = "bery0zas-halite", amount = 1 }
		}
	},
	{
		type = "recipe",
		name = "bery0zas-adsorption-coil-mk1",
		energy_required = 10,
		category = "bery0zas-air-filtering-item",
		enabled = false,
		ingredients = { { type = "item", name = "iron-plate", amount = 3 }, { type = "item", name = "iron-stick", amount = 8 } },
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorption-coil-mk1.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.tier[1]),
		subgroup = "bery0zas-air-filter-components",
		order = "a[coil]-a[mk1-empty]",
		results = { { type = "item", name = "bery0zas-adsorption-coil-mk1", amount = 1 } }
	},
	{
		type = "recipe",
		name = "bery0zas-adsorption-coil-mk2",
		energy_required = 10,
		category = "bery0zas-air-filtering-item",
		enabled = false,
		ingredients = {
			{ type = "item", name = "steel-plate", amount = 3 },
			{ type = "item", name = "iron-stick",  amount = 8 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorption-coil-mk2.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.tier[2]),
		subgroup = "bery0zas-air-filter-components",
		order = "a[coil]-b[mk2-empty]",
		results = { { type = "item", name = "bery0zas-adsorption-coil-mk2", amount = 1 } }
	},
	{
		type = "recipe",
		name = "bery0zas-adsorption-coil-mk1-with-activated-carbon",
		energy_required = 3,
		category = "bery0zas-air-filtering-item",
		enabled = false,
		ingredients =
		{
			{ type = "item", name = "bery0zas-adsorption-coil-mk1", amount = 1 },
			{ type = "item", name = "bery0zas-activated-carbon",    amount = 1 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorption-coil-mk1-with-activated-carbon.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.tier[1]),
		subgroup = "bery0zas-air-filter-components",
		order = "b[filter]-a[mk1-loaded]",
		results = { { type = "item", name = "bery0zas-adsorption-coil-mk1-with-activated-carbon", amount = 1 } }
	},
	{
		type = "recipe",
		name = "bery0zas-adsorption-coil-mk2-with-cellular-carbon",
		energy_required = 6,
		category = "bery0zas-air-filtering-item",
		enabled = false,
		ingredients = {
			{ type = "item", name = "bery0zas-adsorption-coil-mk2", amount = 1 },
			{ type = "item", name = "bery0zas-cellular-carbon",     amount = 1 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorption-coil-mk2-with-cellular-carbon.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.tier[2]),
		subgroup = "bery0zas-air-filter-components",
		order = "b[filter]-b[mk2-loaded]",
		results = { { type = "item", name = "bery0zas-adsorption-coil-mk2-with-cellular-carbon", amount = 1 } }
	},
	{
		type = "recipe",
		name = "bery0zas-spray-surface-recycling",
		energy_required = 7,
		category = "bery0zas-air-filtering-burning",
		enabled = false,
		ingredients = { { type = "item", name = "bery0zas-polluted-spray-surface", amount = 1 } },
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/polluted-spray-surface-recycling.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.recycling),
		subgroup = "bery0zas-air-filter-recipes",
		order = "d[recycling]-b[spray-surface]",
		results = { { type = "item", name = "bery0zas-spray-surface", amount = 1 } },
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-activated-carbon",
		energy_required = 10,
		category = "bery0zas-air-filtering-chemistry",
		enabled = false,
		ingredients =
		{
			{ type = "item",  name = "coal",          amount = 10 },
			{ type = "fluid", name = "sulfuric-acid", amount = 20 }
		},
		icons = { {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/activated-carbon.png",
			icon_size = 64,
		} },
		subgroup = "bery0zas-air-filter-materials",
		order = "a[carbon]-a[activated]",
		results = { { type = "item", name = "bery0zas-activated-carbon", amount = 8 } }
	},
	{
		type = "recipe",
		name = "bery0zas-cellular-carbon",
		energy_required = 10,
		category = "bery0zas-air-filtering-chemistry",
		enabled = false,
		ingredients =
		{
			{ type = "item",  name = "bery0zas-activated-carbon", amount = 10 },
			{ type = "fluid", name = "petroleum-gas",             amount = 20 }
		},
		icons = { {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/cellular-carbon.png",
			icon_size = 64,
		} },
		subgroup = "bery0zas-air-filter-materials",
		order = "a[carbon]-b[cellular]",
		results = { { type = "item", name = "bery0zas-cellular-carbon", amount = 8 } }
	},
	{
		type = "recipe",
		name = "bery0zas-air-suction",
		energy_required = 1,
		category = "bery0zas-air-filtering-suction",
		enabled = false,
		-- ingredients = { { type = "fluid", name = "bery0zas-pollution", amount = 1, fluidbox_index = 1 } },
		icons = bery0zas.functions.with_badges({ {
			icon = "__base__/graphics/icons/fluid/steam.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-recipes",
		order = "a[suction]-a[polluted-air]",
		results = { { type = "fluid", name = "bery0zas-polluted-air", amount = 1 } },
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-water-absorption",
		energy_required = 30,
		category = "bery0zas-air-filtering-absorption",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "water",                 amount = 2, fluidbox_index = 1 },
			{ type = "fluid", name = "bery0zas-polluted-air", amount = 2, fluidbox_index = 2 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/water-absorption.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-recipes",
		order = "c[absorption]-a[water]",
		results = { { type = "fluid", name = "bery0zas-polluted-water", amount = 4 } },
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-oxygen-extraction",
		energy_required = 10,
		category = "bery0zas-air-filtering-chemistry",
		enabled = false,
		ingredients = {},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/fluid/oxygen.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-fluids",
		order = "a[oxygen]-a[extraction]",
		results = { { type = "fluid", name = "bery0zas-oxygen", amount = 2 } },
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-oxygen-sparging",
		energy_required = 20,
		category = "bery0zas-air-filtering-sparging",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "water",           amount = 10 },
			{ type = "fluid", name = "bery0zas-oxygen", amount = 10 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/oxygen-sparging.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-fluids",
		order = "a[oxygen]-b[sparging]",
		results = {
			{
				type = "fluid",
				name = "bery0zas-oxygen-sparged-water",
				amount = 20
			}
		},
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-oxygen-sparged-water-absorption",
		energy_required = 20,
		category = "bery0zas-air-filtering-absorption",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "bery0zas-oxygen-sparged-water", amount = 4, fluidbox_index = 1 },
			{ type = "fluid", name = "bery0zas-polluted-air",         amount = 4, fluidbox_index = 2 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/oxygen-sparged-water-absorption.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-recipes",
		order = "c[absorption]-b[oxygen-water]",
		results = { { type = "fluid", name = "bery0zas-polluted-water", amount = 8 } },
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-sodium-hydroxide-sparged-water-absorption",
		energy_required = 15,
		category = "bery0zas-air-filtering-absorption",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "bery0zas-sodium-hydroxide-sparged-water", amount = 12, fluidbox_index = 1 },
			{ type = "fluid", name = "bery0zas-polluted-air",                   amount = 8,  fluidbox_index = 2 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/sodium-hydroxide-sparged-water-absorption.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-recipes",
		order = "c[absorption]-c[sodium-hydroxide-water]",
		results = { { type = "fluid", name = "bery0zas-polluted-water", amount = 16 } },
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-water-absorption-with-spraying",
		energy_required = 20,
		category = "bery0zas-air-filtering-absorption",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "water",                  amount = 2, fluidbox_index = 1 },
			{ type = "fluid", name = "bery0zas-polluted-air",  amount = 2, fluidbox_index = 2 },
			{ type = "item",  name = "bery0zas-spray-surface", amount = 2 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/water-absorption-with-spraying.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-recipes",
		order = "c[absorption]-d[water-spraying]",
		results =
		{
			{ type = "fluid", name = "bery0zas-polluted-water",         amount = 4 },
			{ type = "item",  name = "bery0zas-polluted-spray-surface", amount = 2 }
		}
	},
	{
		type = "recipe",
		name = "bery0zas-oxygen-sparged-water-absorption-with-spraying",
		energy_required = 15,
		category = "bery0zas-air-filtering-absorption",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "bery0zas-oxygen-sparged-water", amount = 4, fluidbox_index = 1 },
			{ type = "fluid", name = "bery0zas-polluted-air",         amount = 4, fluidbox_index = 2 },
			{ type = "item",  name = "bery0zas-spray-surface",        amount = 1 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/oxygen-sparged-water-absorption-with-spraying.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-recipes",
		order = "c[absorption]-e[oxygen-water-spraying]",
		results =
		{
			{ type = "fluid", name = "bery0zas-polluted-water",         amount = 8 },
			{ type = "item",  name = "bery0zas-polluted-spray-surface", amount = 1 }
		}
	},
	{
		type = "recipe",
		name = "bery0zas-sodium-hydroxide",
		energy_required = 10,
		category = "bery0zas-air-filtering-chemistry",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "water",           amount = 30 },
			{ type = "item",  name = "bery0zas-halite", amount = 3 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/fluid/sodium-hydroxide.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-fluids",
		order = "b[sodium-hydroxide]-a[solution]",
		results = {
			{
				type = "fluid",
				name = "bery0zas-sodium-hydroxide",
				amount = 30
			}
		},
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-sodium-hydroxide-sparging",
		energy_required = 20,
		category = "bery0zas-air-filtering-sparging",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "water",                     amount = 10 },
			{ type = "fluid", name = "bery0zas-sodium-hydroxide", amount = 10 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/sodium-hydroxide-sparging.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-fluids",
		order = "b[sodium-hydroxide]-b[sparging]",
		results = {
			{
				type = "fluid",
				name = "bery0zas-sodium-hydroxide-sparged-water",
				amount = 20
			}
		},
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-sodium-hydroxide-sparged-water-absorption-with-spraying",
		energy_required = 10,
		category = "bery0zas-air-filtering-absorption",
		enabled = false,
		ingredients =
		{
			{ type = "fluid", name = "bery0zas-sodium-hydroxide-sparged-water", amount = 8, fluidbox_index = 1 },
			{ type = "fluid", name = "bery0zas-polluted-air",                   amount = 8, fluidbox_index = 2 },
			{ type = "item",  name = "bery0zas-spray-surface",                  amount = 1 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/sodium-hydroxide-sparged-water-absorption-with-spraying.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-recipes",
		order = "c[absorption]-f[sodium-hydroxide-water-spraying]",
		results =
		{
			{ type = "fluid", name = "bery0zas-polluted-water",         amount = 16 },
			{ type = "item",  name = "bery0zas-polluted-spray-surface", amount = 1 }
		}
	},
	{
		type = "recipe",
		name = "bery0zas-polluted-water-recycling",
		energy_required = 10,
		category = "bery0zas-air-filtering-chemistry",
		enabled = false,
		ingredients = { { type = "fluid", name = "bery0zas-polluted-water", amount = 20 } },
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/recipe/polluted-water-recycling.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning, bery0zas.functions.badge_icons.recycling),
		subgroup = "bery0zas-air-filter-recipes",
		order = "d[recycling]-a[polluted-water]",
		results =
		{
			{ type = "fluid", name = "water",      amount = 15 },
			{ type = "fluid", name = "crude-oil",  probability = 0.05, amount = 20 },
			{ type = "item",  name = "coal",       probability = 0.05, amount = 2 },
			{ type = "item",  name = "iron-ore",   probability = 0.05, amount = 2 },
			{ type = "item",  name = "copper-ore", probability = 0.05, amount = 2 }
		}
	},
	{
		type = "recipe",
		name = "bery0zas-coal-adsorption",
		energy_required = 40,
		category = "bery0zas-air-filtering-adsorption",
		enabled = false,
		ingredients =
		{
			{ type = "item",  name = "coal",                  amount = 1 },
			{ type = "fluid", name = "bery0zas-polluted-air", amount = 3, fluidbox_index = 2 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__base__/graphics/icons/coal.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-recipes",
		order = "b[adsorption]-a[coal]",
		results = {}
	},
	{
		type = "recipe",
		name = "bery0zas-coal-adsorption-with-steam",
		energy_required = 40,
		category = "bery0zas-air-filtering-adsorption",
		enabled = false,
		ingredients =
		{
			{ type = "item",  name = "coal",                  amount = 2 },
			{ type = "fluid", name = "steam",                 amount = 3, fluidbox_index = 1 },
			{ type = "fluid", name = "bery0zas-polluted-air", amount = 5, fluidbox_index = 2 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__base__/graphics/icons/fluid/steam.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		subgroup = "bery0zas-air-filter-recipes",
		order = "b[adsorption]-b[coal-steam]",
		results = {}
	},
	{
		type = "recipe",
		name = "bery0zas-activated-carbon-adsorption",
		energy_required = 40,
		category = "bery0zas-air-filtering-adsorption",
		enabled = false,
		ingredients =
		{
			{ type = "item",  name = "bery0zas-adsorption-coil-mk1-with-activated-carbon", amount = 1 },
			{ type = "fluid", name = "bery0zas-polluted-air",                              amount = 8, fluidbox_index = 2 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorption-coil-mk1-with-activated-carbon.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.tier[1], bery0zas.functions.badge_icons.air_cleaning, bery0zas.functions.badge_icons.recycling),
		subgroup = "bery0zas-air-filter-recipes",
		order = "b[adsorption]-c[activated-carbon]",
		results =
		{
			{ type = "item", name = "bery0zas-adsorption-coil-mk1", amount = 1 }
		},
		main_product = ""
	},
	{
		type = "recipe",
		name = "bery0zas-cellular-carbon-adsorption",
		energy_required = 40,
		category = "bery0zas-air-filtering-adsorption",
		enabled = false,
		ingredients =
		{
			{ type = "item",  name = "bery0zas-adsorption-coil-mk2-with-cellular-carbon", amount = 1 },
			{ type = "fluid", name = "bery0zas-polluted-air",                             amount = 12, fluidbox_index = 2 }
		},
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorption-coil-mk2-with-cellular-carbon.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.tier[2], bery0zas.functions.badge_icons.air_cleaning, bery0zas.functions.badge_icons.recycling),
		subgroup = "bery0zas-air-filter-recipes",
		order = "b[adsorption]-d[cellular-carbon]",
		results = { { type = "item", name = "bery0zas-adsorption-coil-mk2", amount = 1 } },
		main_product = ""
	}
})
