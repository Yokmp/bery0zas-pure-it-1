
bery0zas.pure_it.entities.air_suction_tower =
{
	name = "bery0zas-air-suction-tower",
	tiers = 3,
	has_tint = true,
	crafting_speed_multiplier = 0.25,
	energy_usage = 100,
	energy_units = "kW",

	entity =
	{
		type = "assembling-machine",
		icons = {
			{ icon = "__bery0zas-pure-it-updated__/graphics/icons/suction-tower.png", icon_size = 64 },
			{ icon = "__bery0zas-pure-it-updated__/graphics/icons/suction-tower-tint.png", icon_size = 64}
		},
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.5, result = "bery0zas-air-suction-tower" },
		fast_replaceable_group = "bery0zas-air-suction-tower",
		max_health = 150,
		corpse = "medium-remnants",

		collision_box = { { -1.3, -1.9 }, { 1.3, 1.8 } },
		selection_box = { { -1.5, -2 }, { 1.5, 2 } },
		fluid_boxes =
		{
			{
				production_type = "input",
				volume = 1000,
				pipe_connections = {}
			},
			{
				production_type = "output",
				pipe_picture = bery0zas.functions.pipe_pictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections =
				{
					{ flow_direction = "output", position = { 0, -1.5 }, direction = defines.direction.north },
				},
			}
		},

		crafting_categories = { "bery0zas-air-filtering-suction" },
		fixed_recipe = "bery0zas-air-suction",
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
      emissions_per_minute = { pollution = -50 }
		},

		module_specification = { module_slots = 2 },
		allowed_effects = { "consumption", "speed" },
		integration_patch_render_layer = "higher-object-above",
		--match_animation_speed_to_activity = true,			
		always_draw_idle_animation = true,
		graphics_set =
    {
			animation_progress = 0.5,
			animation =
			{
				east =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-east.png",
							priority = "extra-high",
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							shift = util.by_pixel(63, -48),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-east-tint.png",
							priority = "extra-high",
							flags = { "mask" },
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							shift = util.by_pixel(63, -48),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-east-shadow.png",
							priority = "medium",
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							draw_as_shadow = true,
							shift = util.by_pixel(63, -48),
							scale = 0.5
						}
					}
				},
				north =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-north.png",
							priority = "extra-high",
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							shift = util.by_pixel(79, -34),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-north-tint.png",
							priority = "extra-high",
							flags = { "mask" },
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							shift = util.by_pixel(79, -34),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-north-shadow.png",
							priority = "medium",
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							draw_as_shadow = true,
							shift = util.by_pixel(79, -34),
							scale = 0.5
						}
					}
				},
				west =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-west.png",
							priority = "extra-high",
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							shift = util.by_pixel(64, -49),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-west-tint.png",
							priority = "extra-high",
							flags = { "mask" },
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							shift = util.by_pixel(64, -49),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-west-shadow.png",
							priority = "medium",
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							draw_as_shadow = true,
							shift = util.by_pixel(64, -49),
							scale = 0.5
						}
					}
				},
				south =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-south.png",
							priority = "extra-high",
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							shift = util.by_pixel(80, -31),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-south-tint.png",
							priority = "extra-high",
							flags = { "mask" },
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							shift = util.by_pixel(80, -31),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/suction-tower/hr-suction-tower-south-shadow.png",
							priority = "medium",
							width = 640,
							height = 640,
							frame_count = 8,
							animation_speed = 1.0,
							line_length = 3,
							draw_as_shadow = true,
							shift = util.by_pixel(80, -31),
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
		icons = {{ icon = "__bery0zas-pure-it-updated__/graphics/icons/suction-tower.png", icon_size = 64 }},
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
			{ type = "item", name = "iron-plate",         amount = 10 },
			{ type = "item", name = "pipe",               amount = 5 },
			{ type = "item", name = "electronic-circuit", amount = 5 },
			{ type = "item", name = "engine-unit",        amount = 5 }
		},
		results =
		{
			{ type = "item", name = "bery0zas-air-suction-tower", amount = 1 }
		}
	},

	recipe_tiers =
	{
		{}, --reserved for previous tier tower as ingredient
		{ { type = "item", name = "steel-plate", amount = 10 }, { type = "item", name = "advanced-circuit", amount = 5 } },
		{ { type = "fluid", name = "lubricant", amount = 50 }, { type = "item", name = "electric-engine-unit", amount = 5 } }
	}
}
