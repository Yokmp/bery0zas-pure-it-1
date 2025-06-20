
bery0zas.pure_it.entities.air_adsorber =
{
	name = "bery0zas-air-adsorber",
	tiers = 1,
	has_tint = false,
	crafting_speed_multiplier = 1,
	energy_usage = 200,
	energy_units = "kW",
	factoriopedia = {position = {0,-1}, zoom = 1.4, direction = 12},

	entity =
	{
		type = "assembling-machine",
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.5, result = "bery0zas-air-adsorber" },
		fast_replaceable_group = "bery0zas-air-adsorber",
		max_health = 150,
		corpse = "medium-remnants",

		collision_box = { { -1.3, -1.3 }, { 1.3, 1.3 } },
		selection_box = { { -1.5, -1.5 }, { 1.5, 1.5 } },
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_picture = bery0zas.functions.pipe_pictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections =
				{
					{ flow_direction = "input", position = { -1, -1 }, direction = defines.direction.north },
				},
			},
			{
				production_type = "input",
				pipe_picture = bery0zas.functions.pipe_pictures(),
				pipe_covers = pipecoverspictures(),
				volume = 1000,
				pipe_connections =
				{
					{ flow_direction = "input", position = { 1, -1 }, direction = defines.direction.north },
				},
			}
		},

		crafting_categories = { "bery0zas-air-filtering-adsorption" },
		return_ingredients_on_change = true,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = { pollution = 6 }
		},

		module_specification = { module_slots = 2 },
		allowed_effects = { "consumption", "speed" },
		icons = {
			{ icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorber.png", icon_size = 64},
			{ icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorber-tint.png", icon_size = 64},
		},
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
							filename = "__bery0zas-pure-it-updated__/graphics/entity/adsorber/hr-adsorber-east.png",
							priority = "extra-high",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(31, -33),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/adsorber/hr-adsorber-east-shadow.png",
							priority = "medium",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(31, -33),
							scale = 0.5
						}
					}
				},
				north =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/adsorber/hr-adsorber-north.png",
							priority = "extra-high",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(32, -35),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/adsorber/hr-adsorber-north-shadow.png",
							priority = "medium",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(32, -35),
							scale = 0.5
						}
					}
				},
				west =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/adsorber/hr-adsorber-west.png",
							priority = "extra-high",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(32, -32),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/adsorber/hr-adsorber-west-shadow.png",
							priority = "medium",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(32, -32),
							scale = 0.5
						}
					}
				},
				south =
				{
					layers =
					{
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/adsorber/hr-adsorber-south.png",
							priority = "extra-high",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							shift = util.by_pixel(32, -34),
							scale = 0.5
						},
						{
							filename = "__bery0zas-pure-it-updated__/graphics/entity/adsorber/hr-adsorber-south-shadow.png",
							priority = "medium",
							width = 448,
							height = 448,
							frame_count = 1,
							animation_speed = 1.0,
							line_length = 1,
							draw_as_shadow = true,
							shift = util.by_pixel(32, -34),
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
			sound = { { filename = "__base__/sound/electric-furnace.ogg", volume = 0.7 },
								{ filename = "__base__/sound/chemical-plant-1.ogg", volume = 0.5 } },
			idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
			apparent_volume = 1.5,
		}
	},

	item =
	{
		type = "item",
		icons = { { icon = "__bery0zas-pure-it-updated__/graphics/icons/adsorber.png", icon_size = 64, tint = { r = 1, g = 1, b = 1, a = 1 } } },
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
			{ type = "item", name = "pipe",               amount = 10 },
			{ type = "item", name = "barrel",       			amount = 5 },
			{ type = "item", name = "engine-unit",        amount = 1 },
			{ type = "item", name = "electronic-circuit", amount = 3 },
		},
		results =
		{
			{ type = "item", name = "bery0zas-air-adsorber", amount = 1 }
		}
	},

	recipe_tiers =
	{
		{},
		{ { type = "item", name = "steel-plate", amount = 10 },  { type = "item", name = "advanced-circuit", amount = 5 } },
		{ { type = "item", name = "processor-unit", amount = 1 } }
	}
}
