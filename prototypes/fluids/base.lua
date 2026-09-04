data:extend({
	-- {
	-- 	type = "fluid",
	-- 	name = "bery0zas-pollution",
	-- 	default_temperature = 15,
	-- 	max_temperature = 100,
	-- 	gas_temperature = 0,
	-- 	base_color = { r = 0.1, g = 0.05, b = 0.05 },
	-- 	flow_color = { r = 0.1, g = 0.05, b = 0.05 },
	-- 	icons = { {
	-- 		icon = "__bery0zas-pure-it-updated__/graphics/icons/fluid/pollution.png",
	-- 		icon_size = 64,
	-- 	} },
	-- 	auto_barrel = false
	-- },
	{
		type = "fluid",
		name = "bery0zas-polluted-air",
		subgroup = "bery0zas-air-filter-fluids",
		order = "a[polluted-air]",
		default_temperature = 15,
		max_temperature = 100,
		gas_temperature = 0,
		base_color = { r = 0.1, g = 0.05, b = 0.05 },
		flow_color = { r = 0.1, g = 0.05, b = 0.05 },
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/fluid/pollution.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		auto_barrel = false
	},
	{
		type = "fluid",
		name = "bery0zas-polluted-water",
		subgroup = "bery0zas-air-filter-fluids",
		order = "b[polluted-water]",
		default_temperature = 15,
		max_temperature = 100,
		base_color = { r = 0.06, g = 0.2, b = 0.22 },
		flow_color = { r = 0.06, g = 0.2, b = 0.22 },
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/fluid/polluted-water.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		auto_barrel = false
	},
	{
		type = "fluid",
		name = "bery0zas-oxygen",
		subgroup = "bery0zas-air-filter-fluids",
		order = "c[oxygen]",
		default_temperature = 15,
		max_temperature = 100,
		gas_temperature = 0,
		base_color = { r = 0.98, g = 0.1, b = 0.1 },
		flow_color = { r = 0.98, g = 0.1, b = 0.1 },
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/fluid/oxygen.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		auto_barrel = true
	},
	{
		type = "fluid",
		name = "bery0zas-oxygen-sparged-water",
		subgroup = "bery0zas-air-filter-fluids",
		order = "d[oxygen-sparged-water]",
		default_temperature = 15,
		max_temperature = 100,
		base_color = { r = 0.62, g = 0.7, b = 0.95 },
		flow_color = { r = 0.62, g = 0.7, b = 0.95 },
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/fluid/oxygen-sparged-water.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		auto_barrel = false
	},
	{
		type = "fluid",
		name = "bery0zas-sodium-hydroxide",
		subgroup = "bery0zas-air-filter-fluids",
		order = "e[sodium-hydroxide]",
		default_temperature = 15,
		max_temperature = 100,
		gas_temperature = 0,
		base_color = { r = 0.96, g = 0.98, b = 1.0 },
		flow_color = { r = 0.96, g = 0.98, b = 1.0 },
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/fluid/sodium-hydroxide.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		auto_barrel = true
	},
	{
		type = "fluid",
		name = "bery0zas-sodium-hydroxide-sparged-water",
		subgroup = "bery0zas-air-filter-fluids",
		order = "f[sodium-hydroxide-sparged-water]",
		default_temperature = 15,
		max_temperature = 100,
		base_color = { r = 0.87, g = 0.7, b = 0.95 },
		flow_color = { r = 0.87, g = 0.7, b = 0.95 },
		icons = bery0zas.functions.with_badges({ {
			icon = "__bery0zas-pure-it-updated__/graphics/icons/fluid/sodium-hydroxide-sparged-water.png",
			icon_size = 64,
		} }, bery0zas.functions.badge_icons.air_cleaning),
		auto_barrel = false
	}
})
