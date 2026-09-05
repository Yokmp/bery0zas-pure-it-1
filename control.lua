--#region debug
local test_report_name = "bery0zas-pure-it-test-report"
local test_report_path = "bery0zas-pure-it-updated/test-report.json"
--#endregion

local chunk_size = 32
local pollution_cleaning_entities = {
	["bery0zas-air-suction-tower-1"] = 1,
	["bery0zas-air-suction-tower-2"] = 2,
	["bery0zas-air-suction-tower-3"] = 3,
}

--#region debug
local function write_test_report()
	if not prototypes or not prototypes.mod_data then return end

	local report = prototypes.mod_data[test_report_name]
	if not (report and report.data) then return end

	local contents = helpers.table_to_json(report.data)
	helpers.write_file(test_report_path, contents, false)
	log("[bery0zas-test] Wrote " .. test_report_path)
end
--#endregion

local function runtime_pollution_cleaning_enabled()
	local setting = settings.startup["bery0zas-pure-it-clean-pollution-runtime"]
	return setting and setting.value == true
end

local function pollution_cleaning_interval()
	local setting = settings.startup["bery0zas-pure-it-clean-pollution-interval"]
	return ((setting and setting.value) or 3) * 60
end

local function pollution_cleaning_amount()
	local setting = settings.startup["bery0zas-pure-it-amountofcollectedpollution"]
	return (setting and setting.value) or 25
end

local function entity_pollution_cleaning_tier(entity)
	return entity and entity.valid and pollution_cleaning_entities[entity.name] or nil
end

local function ensure_pollution_cleaning_storage()
	storage.bery0zas_pure_it_pollution_cleaners = storage.bery0zas_pure_it_pollution_cleaners or {}
	return storage.bery0zas_pure_it_pollution_cleaners
end

local function add_pollution_cleaner(entity)
	if not runtime_pollution_cleaning_enabled() or not entity_pollution_cleaning_tier(entity) then return end
	table.insert(ensure_pollution_cleaning_storage(), entity)
end

local function remove_pollution_cleaner(entity)
	if not (entity and entity.valid) then return end

	local cleaners = ensure_pollution_cleaning_storage()
	for index = #cleaners, 1, -1 do
		if cleaners[index] == entity then
			table.remove(cleaners, index)
			return
		end
	end
end

local function rebuild_pollution_cleaners()
	local cleaners = ensure_pollution_cleaning_storage()
	for index = #cleaners, 1, -1 do
		cleaners[index] = nil
	end

	if not runtime_pollution_cleaning_enabled() then return end

	for _, surface in pairs(game.surfaces) do
		for name in pairs(pollution_cleaning_entities) do
			for _, entity in pairs(surface.find_entities_filtered({ name = name })) do
				table.insert(cleaners, entity)
			end
		end
	end
end

local function chunk_center(position)
	local chunk_x = math.floor(position.x / chunk_size)
	local chunk_y = math.floor(position.y / chunk_size)
	return chunk_x * chunk_size + chunk_size / 2, chunk_y * chunk_size + chunk_size / 2
end

local function apply_pollution_cleaning(surface, x, y, amount)
	local position = { x, y }
	local current = surface.get_pollution(position)
	if current <= 0 then return end
	surface.set_pollution(position, math.max(0, current - amount))
end

local function clean_pollution()
	if not runtime_pollution_cleaning_enabled() then return end

	local cleaners = ensure_pollution_cleaning_storage()
	local base_amount = pollution_cleaning_amount()
	for index = #cleaners, 1, -1 do
		local entity = cleaners[index]
		local tier = entity_pollution_cleaning_tier(entity)
		if not tier then
			table.remove(cleaners, index)
		else
			local center_x, center_y = chunk_center(entity.position)
			local center_amount = base_amount * tier
			local neighbor_amount = center_amount / 4
			for dx = -1, 1 do
				for dy = -1, 1 do
					apply_pollution_cleaning(
						entity.surface,
						center_x + dx * chunk_size,
						center_y + dy * chunk_size,
						(dx == 0 and dy == 0) and center_amount or neighbor_amount
					)
				end
			end
		end
	end
end

local function register_pollution_cleaning_tick()
	script.on_nth_tick(pollution_cleaning_interval(), nil)
	if runtime_pollution_cleaning_enabled() then
		script.on_nth_tick(pollution_cleaning_interval(), clean_pollution)
	end
end

local function on_init()
	--#region debug
	write_test_report()
	--#endregion
	rebuild_pollution_cleaners()
	register_pollution_cleaning_tick()
end

local function on_load()
	register_pollution_cleaning_tick()
end

local function on_configuration_changed()
	--#region debug
	write_test_report()
	--#endregion
	rebuild_pollution_cleaners()
	register_pollution_cleaning_tick()
end

local circuit_wire_connector_ids = {
	defines.wire_connector_id.circuit_red,
	defines.wire_connector_id.circuit_green,
}

local function save_circuit_wire_connections(entity)
	local saved = {}
	if not (entity and entity.valid and entity.get_wire_connector) then return saved end

	for _, connector_id in ipairs(circuit_wire_connector_ids) do
		local connector = entity.get_wire_connector(connector_id, false)
		if connector then
			local connections = {}
			for _, connection in ipairs(connector.real_connections or {}) do
				if connection.target and connection.target.valid then
					table.insert(connections, {
						target = connection.target,
						origin = connection.origin,
					})
				end
			end
			saved[connector_id] = connections
		end
	end

	return saved
end

local function restore_circuit_wire_connections(entity, saved)
	if not (entity and entity.valid and entity.get_wire_connector) then return end

	for connector_id, connections in pairs(saved or {}) do
		local connector = entity.get_wire_connector(connector_id, true)
		if connector then
			for _, connection in ipairs(connections) do
				if connection.target and connection.target.valid then
					connector.connect_to(connection.target, false, connection.origin)
				end
			end
		end
	end
end

local function save_recipe(entity)
	if not (entity and entity.valid and entity.get_recipe) then return nil end

	local recipe = entity.get_recipe()
	return recipe and recipe.name or nil
end

local function restore_recipe(entity, recipe_name)
	if not (entity and entity.valid and recipe_name and entity.set_recipe) then return end

	entity.set_recipe(recipe_name)
end

---reads, destroys and creates an entity
---@param player LuaPlayer
---@param entity { name: string, inner_name: string, position: MapPosition, direction: defines.direction  }
---@param rotation integer
local function swap_entities(player, entity, rotation)

  if not player.selected then game.print("no selection") return end
	local selected = player.selected
  local old_position, quality = selected.position, selected.quality -- or nil
  local surface = selected.surface.name
	local wire_connections = save_circuit_wire_connections(selected)
	local recipe_name = save_recipe(selected)
	local old_direction = entity.direction

	entity.direction = entity.direction + rotation
	if entity.direction > defines.direction.west then
		entity.direction = defines.direction.north --[[@as defines.direction]]
	elseif entity.direction < defines.direction.north then
		entity.direction = defines.direction.west --[[@as defines.direction]]
	end

  if selected.destroy({player = player}) then -- or die(force?, cause?)
		if not game.surfaces[surface].can_place_entity({
			name        			= entity.name,
      inner_name  			= entity.inner_name,
      position    			= entity.position,
      direction   			= entity.direction,
      force       			= game.forces.player,
			-- build_check_type  = defines.build_check_type.manual
		})
		then
			game.surfaces[surface].play_sound({path="utility/cannot_build", position=old_position})
			player.create_local_flying_text({	text = {"", {"cant-be-rotated"}},	position = {entity.position.x +1, entity.position.y}})
			entity.direction = old_direction
			if entity.direction == 0 or entity.direction == 8 then -- shift back normal rotations
				entity.position.x = entity.position.x + 1
			else
				entity.position.y = entity.position.y + 1
			end
		else
			game.surfaces[surface].play_sound({path="utility/rotated_huge", position=old_position})
		end
    local new_entity = game.surfaces[surface].create_entity{
      name        = entity.name,
      inner_name  = entity.inner_name,
      position    = entity.position,
      force       = game.forces.player,
      direction   = entity.direction,
      quality     = quality,
      create_build_effect_smoke = false,
    }
		restore_recipe(new_entity, recipe_name)
		restore_circuit_wire_connections(new_entity, wire_connections)
  end
end


---returns the corrected positions
---@param t_entity table
---@return table
local function correct_position( t_entity)
	if t_entity.name:match("adsorber") then return t_entity end

	if t_entity.direction == defines.direction.north then
		t_entity.position.x = t_entity.position.x - 1
		t_entity.position.y = t_entity.position.y - 0
	end
	if t_entity.direction == defines.direction.east then
		t_entity.position.x = t_entity.position.x - 0
		t_entity.position.y = t_entity.position.y - 1
	end
	if t_entity.direction == defines.direction.south then
		t_entity.position.x = t_entity.position.x - 1
		t_entity.position.y = t_entity.position.y - 0
	end
	if t_entity.direction == defines.direction.west then
		t_entity.position.x = t_entity.position.x - 0
		t_entity.position.y = t_entity.position.y - 1
	end
	return t_entity
end


---rotate clockwise
---@param event EventData
script.on_event("bery0zas-rotate-right", function(event)

  local player = game.players[event.player_index] ---@diagnostic disable-line
  if not player.selected or not player.selected.name:match("bery0zas") then return end
	if player.cursor_stack and player.cursor_stack.valid_for_read then return end
	local entity = player.selected or {}

	local t_entity = {
		name = entity.name,
		inner_name = entity.type == "entity_ghost" and entity.ghost_name or entity.name,
		position = player.selected.position,
		direction = entity.direction
	}

	t_entity = correct_position(t_entity)
  swap_entities(player, t_entity, 4)

end)
---rotate CounterClockwise
---@param event EventData
script.on_event("bery0zas-rotate-left", function(event)

  local player = game.players[event.player_index] ---@diagnostic disable-line
  if not player.selected or not player.selected.name:match("bery0zas") then return end
	if player.cursor_stack and player.cursor_stack.valid_for_read then return end
	local entity = player.selected or {}

	local t_entity = {
		name = entity.name,
		inner_name = entity.type == "entity_ghost" and entity.ghost_name or entity.name,
		position = player.selected.position,
		direction = entity.direction
	}

	t_entity = correct_position(t_entity)
  swap_entities(player, t_entity, -4)

end)

script.on_event(defines.events.on_built_entity, function(event)
	add_pollution_cleaner(event.entity)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	add_pollution_cleaner(event.entity)
end)

script.on_event(defines.events.script_raised_built, function(event)
	add_pollution_cleaner(event.entity)
end)

script.on_event(defines.events.script_raised_revive, function(event)
	add_pollution_cleaner(event.entity)
end)

script.on_event(defines.events.on_player_mined_entity, function(event)
	remove_pollution_cleaner(event.entity)
end)

script.on_event(defines.events.on_robot_mined_entity, function(event)
	remove_pollution_cleaner(event.entity)
end)

script.on_event(defines.events.on_entity_died, function(event)
	remove_pollution_cleaner(event.entity)
end)

script.on_event(defines.events.script_raised_destroy, function(event)
	remove_pollution_cleaner(event.entity)
end)

script.on_init(on_init)
script.on_load(on_load)
script.on_configuration_changed(on_configuration_changed)
