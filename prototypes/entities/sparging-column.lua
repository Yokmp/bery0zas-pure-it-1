
bery0zas.pure_it.entities.sparging_column =
{
	name = "bery0zas-sparging-column",
	tiers = 1,
	has_tint = false,
	crafting_speed_multiplier = 1,
	energy_usage = 100,
	energy_units = "kW",
	factoriopedia = {{0, -1.9}, nil, 0},

	entity =
	{
		type = "assembling-machine",
		icons = {
			{icon = "__bery0zas-pure-it-updated__/graphics/icons/sparging-column.png", icon_size = 64,},
			{icon = "__bery0zas-pure-it-updated__/graphics/icons/sparging-column-tint.png", icon_size = 64,},
		},
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.5, result = "bery0zas-sparging-column" },
		fast_replaceable_group = "bery0zas-sparging-column",
		max_health = 150,
		corpse = "medium-remnants",
		--alert_icon_shift = util.by_pixel(-3, -12),
		collision_box = { { -1.4, -0.9 }, { 1.4, 0.9 } },
		selection_box = { { -1.5, -1 }, { 1.5, 1 } },
		--drawing_box = {{ -3.0, -6.5 }, { 3.0, 2.0 }},
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_picture = bery0zas.functions.pipe_pictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections =
				{
					-- { flow_direction = "input", position = { -1, -1.5 }, direction = defines.direction.north },
					{ flow_direction = "input", position = { -1, -.5 }, direction = defines.direction.north },
				},
				secondary_draw_orders = { north = -1 }
			},
			{
				production_type = "input",
				pipe_picture = bery0zas.functions.pipe_pictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections =
				{
					{ flow_direction = "input", position = { 1, -.5 }, direction = defines.direction.north },
				},
				secondary_draw_orders = { north = -1 }
			},
			{
				production_type = "output",
				pipe_picture = bery0zas.functions.pipe_pictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections =
				{
					{ flow_direction = "output", position = { 1, .5 }, direction = defines.direction.south },
					{ flow_direction = "output", position = { -1, .5 }, direction = defines.direction.south },
				},
				secondary_draw_orders = { north = -1 }
			},
			--off_when_no_fluid_recipe = true
		},
		crafting_categories = { "bery0zas-air-filtering-sparging" },
		return_ingredients_on_change = true,
		crafting_speed = 0.5,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = { pollution = 6 }
		},

		module_slots = 2,
		allowed_effects = { "consumption", "speed" },
		integration_patch_render_layer = "higher-object-above",
		match_animation_speed_to_activity = true,
		graphics_set =
		{
			animation_progress = 0,
			animation =
			{
				east =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/sparging-column/hr-sparging-column-east.png",
							priority = "extra-high",
							width = 576,
							height = 576,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(80, -82),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/sparging-column/hr-sparging-column-east-shadow.png",
							priority = "medium",
							width = 576,
							height = 576,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(80, -82),
							scale = 0.5
						}
					}
				},
				north =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/sparging-column/hr-sparging-column-north.png",
							priority = "extra-high",
							width = 576,
							height = 576,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(78, -72),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/sparging-column/hr-sparging-column-north-shadow.png",
							priority = "medium",
							width = 576,
							height = 576,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(78, -72),
							scale = 0.5
						}
					}
				},
				west =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/sparging-column/hr-sparging-column-west.png",
							priority = "extra-high",
							width = 576,
							height = 576,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(80, -66),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/sparging-column/hr-sparging-column-west-shadow.png",
							priority = "medium",
							width = 576,
							height = 576,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(80, -66),
							scale = 0.5
						}
					}
				},
				south =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/sparging-column/hr-sparging-column-south.png",
							priority = "extra-high",
							width = 576,
							height = 576,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(78, -72),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/sparging-column/hr-sparging-column-south-shadow.png",
							priority = "medium",
							width = 576,
							height = 576,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(78, -72),
							scale = 0.5
						}
					}
				}
			}
		},

		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		working_sound =
		{
			sound = { { filename = "__base__/sound/chemical-plant-3.ogg", volume = 0.7 } },
			idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
			apparent_volume = 1.5,
		},
	},

	item =
	{
		type = "item",
		icons = { { icon = "__bery0zas-pure-it-updated__/graphics/icons/sparging-column.png", icon_size = 64,} },
		subgroup = "production-machine",
		stack_size = 25
	},

	recipe =
	{
		type = "recipe",
		category = "bery0zas-air-filtering-machine",
		enabled = false,
		energy_required = 10.0,
		ingredients =
		{
			{ type = "item", name = "electric-engine-unit", amount = 3 },
			{ type = "item", name = "electronic-circuit",   amount = 3 },
			{ type = "item", name = "iron-plate",           amount = 10 },
			{ type = "item", name = "steel-plate",          amount = 10 },
			{ type = "item", name = "pipe",                 amount = 10 }
		},
	},

	recipe_tiers =
	{
		{}, --[[@as PureIt.IngredientPrototype]]
	}
}
