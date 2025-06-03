

---reads, destroys and creates an entity
---@param player LuaPlayer
---@param entity { name: string, inner_name: string, position: MapPosition, direction: defines.direction  }
---@param rotation integer
local function swap_entities(player, entity, rotation)

  if not player.selected then game.print("no selection") return end
  local old_position, quality = player.selected.position, player.selected.quality
  local surface = player.selected.surface.name
	local old_direction = entity.direction

	entity.direction = entity.direction + rotation
	if entity.direction > defines.direction.west then
		entity.direction = defines.direction.north --[[@as defines.direction]]
	elseif entity.direction < defines.direction.north then
		entity.direction = defines.direction.west --[[@as defines.direction]]
	end

  if player.selected.destroy({player = player}) then -- or die(force?, cause?)
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
    game.surfaces[surface].create_entity{
      name        = entity.name,
      inner_name  = entity.inner_name,
      position    = entity.position,
      force       = game.forces.player,
      direction   = entity.direction,
      quality     = quality,
      create_build_effect_smoke = false,
    }
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