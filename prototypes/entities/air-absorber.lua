
bery0zas.pure_it.entities.air_absorber =
{
	name = "bery0zas-air-absorber",
	tiers = 3,
	has_tint = true,
	crafting_speed_multiplier = 1,
	energy_usage = 100,
	energy_units = "kW",

	entity =
	{
		type = "assembling-machine",
		icons = {
			{ icon = "__bery0zas-pure-it-updated__/graphics/icons/absorber.png", icon_size = 64},
			{ icon = "__bery0zas-pure-it-updated__/graphics/icons/absorber-tint.png", icon_size = 64},
		},
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.5, result = "bery0zas-air-absorber" },
		fast_replaceable_group = "bery0zas-air-absorber",
		max_health = 150,
		corpse = "medium-remnants",

		collision_box = { { -1.5, -2 }, { 1.5, 2 } },
		selection_box = { { -1.5, -2 }, { 1.5, 2 } },
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_picture = bery0zas.functions.pipe_pictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections =
				{
					{ flow_direction = "input", position = { -1, -1.5 }, direction = defines.direction.north },
				},
			},
			{
				production_type = "input",
				pipe_picture = bery0zas.functions.pipe_pictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections =
				{
					{ flow_direction = "input", position = { 1, -1.5 }, direction = defines.direction.north },
				},
			},
			{
				production_type = "output",
				pipe_picture = bery0zas.functions.pipe_pictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections =
				{
					{ flow_direction = "output", position = { 0, 1.5 }, direction = defines.direction.south },
				},
			},
		},

		crafting_categories = { "bery0zas-air-filtering-absorption" },
		return_ingredients_on_change = true,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = { pollution = 6 }
		},

		module_slots = 2,
		allowed_effects = { "consumption", "speed" },
		integration_patch_render_layer = "lower-object-above-shadow",
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
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-east.png",
							priority = "extra-high",
							width = 448,
							height = 448,
							frame_count = 1,
							line_length = 1,
							shift = util.by_pixel(31, -1),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-east-tint.png",
							priority = "extra-high",
							blend_mode = "normal",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(31, -1),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-east-shadow.png",
							priority = "medium",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(31, -1),
							scale = 0.5
						}
					}
				},
				north =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-north.png",
							priority = "extra-high",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(32, 8),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-north-tint.png",
							priority = "extra-high",
							blend_mode = "normal",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(32, 8),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-north-shadow.png",
							priority = "medium",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(32, 8),
							scale = 0.5
						}
					}
				},
				west =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-west.png",
							priority = "extra-high",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(31, -1),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-west-tint.png",
							priority = "extra-high",
							blend_mode = "normal",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(31, -1),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-west-shadow.png",
							priority = "medium",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(31, -1),
							scale = 0.5
						}
					}
				},
				south =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-south.png",
							priority = "extra-high",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(32, 9),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-south-tint.png",
							priority = "extra-high",
							blend_mode = "normal",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(32, 9),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/absorber/hr-absorber-south-shadow.png",
							priority = "medium",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(32, 9),
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
			sound = { { filename = "__base__/sound/electric-furnace.ogg", volume = 0.7 } },
			idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
			apparent_volume = 1.5,
		}
	},

	item =
	{
		type = "item",
		icons = { { icon = "__bery0zas-pure-it-updated__/graphics/icons/absorber.png", icon_size = 64} },
		subgroup = "production-machine",
		stack_size = 25
	},

	recipe =
	{
		type = "recipe",
		category = "bery0zas-air-filtering-machine",
		enabled = false,
		energy_required = 20.0,
		ingredients =
		{
			{ type = "item", name = "iron-plate", 				amount = 10 },
			{ type = "item", name = "pipe",  							amount = 10 },
			{ type = "item", name = "barrel",  						amount = 1 },
			{ type = "item", name = "engine-unit",  			amount = 1 },
			{ type = "item", name = "electronic-circuit",	amount = 3 },
		},
		results =
		{
			{ type = "item", name = "bery0zas-air-absorber", amount = 1 }
		}
	},

	recipe_tiers =
	{
		{},
		{ { type = "item", name = "steel-plate", amount = 10 }, { type = "item", name = "advanced-circuit", amount = 5 } },
		{ { type = "item", name = "electric-engine-unit", amount = 1 } }
	}
}
