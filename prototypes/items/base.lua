data:extend(
	{

		{
			type = "item",
			name = "bery0zas-halite",
			icons = { {
				icon = "__bery0zas-pure-it-updated__/graphics/icons/halite.png",
				icon_size = 64,
			} },
			subgroup = "raw-resource",
			stack_size = 100,
			order = "h[halite]"
		},
		{
			type = "item",
			name = "bery0zas-activated-carbon",
			icons = { {
				icon = "__bery0zas-pure-it-updated__/graphics/icons/activated-carbon.png",
				icon_size = 64,
			} },
			subgroup = "bery0zas-air-filter-materials",
			order = "a[carbon]-a[activated]",
			stack_size = 100
		},
		{
			type = "item",
			name = "bery0zas-cellular-carbon",
			icons = { {
				icon = "__bery0zas-pure-it-updated__/graphics/icons/cellular-carbon.png",
				icon_size = 64,
			} },
			subgroup = "bery0zas-air-filter-materials",
			order = "a[carbon]-b[cellular]",
			stack_size = 100
		},
		{
			type = "item",
			name = "bery0zas-spray-surface",
			icons = { {
				icon = "__bery0zas-pure-it-updated__/graphics/icons/spray-surface.png",
				icon_size = 64,
			} },
			subgroup = "bery0zas-air-filter-materials",
			order = "b[spray-surface]-a[clean]",
			stack_size = 100,
		},
		{
			type = "item",
			name = "bery0zas-polluted-spray-surface",
			icons = { {
				icon = "__bery0zas-pure-it-updated__/graphics/icons/polluted-spray-surface.png",
				icon_size = 64,
			} },
			subgroup = "bery0zas-air-filter-materials",
			order = "b[spray-surface]-b[polluted]",
			stack_size = 100
		},
		{
			type = "item",
			name = "bery0zas-adsorption-coil-mk1",
			icons = bery0zas.functions.with_badges({ {
				icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorption-coil-mk1.png",
				icon_size = 64,
			} }, bery0zas.functions.badge_icons.tier[1]),
			subgroup = "bery0zas-air-filter-components",
			order = "a[coil]-a[mk1-empty]",
			stack_size = 100
		},
		{
			type = "item",
			name = "bery0zas-adsorption-coil-mk2",
			icons = bery0zas.functions.with_badges({ {
				icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorption-coil-mk2.png",
				icon_size = 64,
			} }, bery0zas.functions.badge_icons.tier[2]),
			subgroup = "bery0zas-air-filter-components",
			order = "a[coil]-b[mk2-empty]",
			stack_size = 100
		},
		{
			type = "item",
			name = "bery0zas-adsorption-coil-mk1-with-activated-carbon",
			icons = bery0zas.functions.with_badges({ {
				icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorption-coil-mk1-with-activated-carbon.png",
				icon_size = 64,
			} }, bery0zas.functions.badge_icons.tier[1]),
			subgroup = "bery0zas-air-filter-components",
			order = "b[filter]-a[mk1-loaded]",
			stack_size = 100
		},
		{
			type = "item",
			name = "bery0zas-adsorption-coil-mk2-with-cellular-carbon",
			icons = bery0zas.functions.with_badges({ {
				icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorption-coil-mk2-with-cellular-carbon.png",
				icon_size = 64,
			} }, bery0zas.functions.badge_icons.tier[2]),
			subgroup = "bery0zas-air-filter-components",
			order = "b[filter]-b[mk2-loaded]",
			stack_size = 100
		},
	})
