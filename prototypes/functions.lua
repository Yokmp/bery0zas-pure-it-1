function bery0zas.functions.pipe_pictures()
	return {
		north = {
			filename = "__bery0zas-pure-it__/graphics/entity/pipe-covers/hr-pipe-cover-empty.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			shift = util.by_pixel(0, 0),
			scale = 0.5
		},
		east = {
			filename = "__bery0zas-pure-it__/graphics/entity/pipe-covers/hr-pipe-cover-empty.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			shift = util.by_pixel(0, 0),
			scale = 0.5
		},
		south = {
			filename = "__bery0zas-pure-it__/graphics/entity/pipe-covers/hr-pipe-cover-south.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			shift = util.by_pixel(0, -32),
			scale = 0.5
		},
		west = {
			filename = "__bery0zas-pure-it__/graphics/entity/pipe-covers/hr-pipe-cover-empty.png",
			priority = "extra-high",
			width = 64,
			height = 64,
			shift = util.by_pixel(0, 0),
			scale = 0.5
		}
	}
end


---@param t table
---@param ... string
---@return boolean
--- Checks if table and key values exist
--- <br> ``address_exists(table, "foo", "bar"...)``
function address_exists(t, ...)
  for i = 1, select("#", ...) do
    if t == nil then return false end
    t = t[select(i, ...)]
  end
  return true
end


---adds the given category
---@param categories table<string>
function bery0zas.functions.register_recipe_categories(categories)
	for _, category in pairs(categories) do
		local recipe_category = { type = "recipe-category", name = category }
		data:extend({ recipe_category })
	end
end


---comment
---@param template PureItTemplate
---@param num_tiers number
function bery0zas.functions.register_entity(template, num_tiers)
log("New entity: "..template.base_name)
	for i = 1, num_tiers, 1 do
		local proto = util.table.deepcopy(template.entity)
		local name = template.base_name
		local color_tint = bery0zas.common.level_tint[i]

		proto.name = name .. "-" .. tostring(i)
		proto.localised_name = {"", {"entity-name."..template.base_name} }
		proto.crafting_speed = bery0zas.common.crafting_speeds[i] * template.crafting_speed_multiplier
		proto.minable.result = proto.name


		if (num_tiers > 1 ) then
			proto.next_upgrade = (i < num_tiers) and name .. "-" .. tostring(i + 1) or ""
			proto.localised_name[3] = " MK"..tostring(i)
			proto.energy_source.emissions_per_minute.pollution = proto.energy_source.emissions_per_minute.pollution * i
		end

		if (template.has_tint) then
			proto.icons[2].tint = color_tint

			for _, v in pairs(proto.graphics_set.animation) do
				v.layers[2].tint = color_tint -- tint layer
			end
		elseif (num_tiers > 1) then
			proto.icons[2].tint = color_tint

			for _, v in pairs(proto.graphics_set.animation) do
				v.layers[1].tint = color_tint -- east layer
			end
		end

		proto.energy_usage = template.energy_usage * proto.crafting_speed .. template.energy_units

		local item = util.table.deepcopy(template.item)
		item.name = proto.name
		item.icons = proto.icons
		item.place_result = proto.name

		local recipe = util.table.deepcopy(template.base_recipe)
		recipe.name = proto.name
		recipe.localised_name = {"", {"entity-name."..template.base_name} }
		recipe.icons = proto.icons
		recipe.energy_required = recipe.energy_required * proto.crafting_speed
		recipe.results = recipe.results or {}

		if (i > 1) then
			recipe.ingredients = template.recipe_tiers[i]
			recipe.localised_name[3] = " MK"..tostring(i)
			table.insert(recipe.ingredients, { type = "item", name = name .. "-" .. tostring(i - 1), amount = 1 })
			table.insert(recipe.results, { type = "item", name = proto.name, amount = 1 })
		end

		data:extend({ proto, item, recipe })
	end
end


---@param item_name string
function bery0zas.functions.remove_item(item_name)
	for key, _ in pairs(data.raw.item) do
		if key == item_name then data.raw.item[key] = nil end
	end
end
---@param fluid_name string
function bery0zas.functions.remove_fluid(fluid_name)
	for key, _ in pairs(data.raw.fluid) do
		if key == fluid_name then data.raw.fluid[key] = nil end
	end
end
---@param recipe_name string
function bery0zas.functions.remove_recipe(recipe_name)
	for key, _ in pairs(data.raw.recipe) do
		if key == recipe_name then data.raw.recipe[key] = nil end
	end
end


---Can alter `energy_required`, `ingredients`, `results`
---@param recipe_name string
---@param field string
---@param sub_field? string|nil mandatory if field is ``"ingredients"`` or ``"results"``
---@param sub_field_value? any|nil
---@param target_sub_field? string|nil
---@param target_value any
function bery0zas.functions.alter_recipe(recipe_name, field, sub_field, sub_field_value, target_sub_field, target_value)
	if not field == "energy_required" and not target_sub_field then return end --TODO: should throw an error in logs

	if field == "energy_required" then
		data.raw.recipe[recipe_name][field] = target_value

	elseif field == "ingredients" or field == "results" then
		for _, fields in ipairs(data.raw.recipe[recipe_name][field]) do
			for f, sub in pairs(fields) do
				if f == sub_field and sub == sub_field_value then
					fields[target_sub_field] = target_value ---@diagnostic disable-line
				end
			end
		end
	end
end


---Add a recipe as a technology effect
---@param technology string
---@param recipe_name string
function bery0zas.functions.add_technology_recipe(technology, recipe_name)
	table.insert(data.raw.technology[technology].effects, {
		type = "unlock-recipe",
		recipe = recipe_name
	})
end


---Remove a recipe from a technology effect
---@param technology string
---@param recipe_name string
function bery0zas.functions.remove_technology_recipe(technology, recipe_name)
	local index = 1
	local size = #data.raw.technology[technology].effects
	while index <= size do
		if data.raw.technology[technology].effects[index].recipe == recipe_name then
			data.raw.technology[technology].effects[index] = data.raw.technology[technology].effects[size]
			data.raw.technology[technology].effects[size] = nil
			size = size - 1
		else
			index = index + 1
		end
	end
end


---Emissions are calculated by multiplying emissions * energy usage
---<br> This function does _not_ calculate this.
---<br>
---<br> https://lua-api.factorio.com/latest/prototypes/ElectricEnergyInterfacePrototype.html#energy_usage
---<br> https://lua-api.factorio.com/latest/types/BaseEnergySource.html#emissions_per_minute
---@param entity { type: string, name: string, tier?: number|string }
---@param emission_table { pollution: number, energy_usage?: string }
function bery0zas.functions.alter_emissions(entity, emission_table)

	entity.tier = entity.tier and tostring(entity.tier) or "1"
	entity.name = entity.name.."-"..entity.tier

	log("new pollution: "..entity.name.." - "..emission_table.pollution)
	if emission_table.energy_usage then log("new energy_usage: "..entity.name.." - "..emission_table.energy_usage) end

	if type(emission_table.energy_usage) == "string" then
		data.raw[entity.type][entity.name].energy_usage = emission_table.energy_usage
	end
	data.raw[entity.type][entity.name].energy_source.emissions_per_minute = {pollution = emission_table.pollution}
end


--TODO: 
--adds space age stuff
--<br> `"pressure"` `"gravity"`
--<br> max 1.79769313486229997955945236754e29
---@param entity { type: string, name: string }
---@param property { name: string, values: {min: number, max: number} }
function bery0zas.functions.spaceage(entity, property)
if not mods["space-age"] then return end

	if data.raw[entity.type][entity.name].surface_conditions then
		local surface_conditions = data.raw[entity.type][entity.name].surface_conditions or {{property = property.name}}
		local size = #surface_conditions

		for index = 1, size, 1 do
			if surface_conditions[index].property == property.name then
				surface_conditions[index].min = math.max(property.values.min, 0)
				surface_conditions[index].max = math.max(property.values.max, 0)
			end
		end
	end
end
