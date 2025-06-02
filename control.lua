

---reads, destroys and creates an entity
---@param player LuaPlayer
---@param entity { name: string, inner_name: string, position: MapPosition, direction: defines.direction  }
local function swap_entities(player, entity)

  if not player.selected then game.print("no selection") return end
  local old_position, quality = player.selected.position, player.selected.quality
  local surface = player.selected.surface.name
	local old_direction = entity.direction

	entity.direction = entity.direction + 4
	if entity.direction > defines.direction.west then
		entity.direction = defines.direction.north --[[@as defines.direction]]
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
			entity.direction = old_direction
			entity.position.x = entity.position.x + 1
		end
		game.surfaces[surface].play_sound({path="utility/rotated_huge", position=old_position})
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


---rotate clockwise
---@param event EventData
script.on_event("bery0zas-rotate-right", function(event)

  local player = game.players[event.player_index] ---@diagnostic disable-line

  if not player.selected or not player.selected.name:match("bery0zas") then return end

  -- local selected = player.selected
  -- local name = selected and selected.name or "unknown"
  -- game.print("pipette "..name.." dir: "..selected.direction)
  -- game.print("pos x: "..selected.position.x.." y: "..selected.position.y)

	local entity = player.selected or ""  -- already checked for nil

	local t_entity = {
		name = entity.name,
		inner_name = entity.type == "entity_ghost" and entity.ghost_name or entity.name,
		position = player.selected.position,
		direction = entity.direction
	}

	if not player.selected.name:match("adsorber") then
		if entity.direction == defines.direction.north then
			t_entity.position.x = entity.position.x - 1
			t_entity.position.y = entity.position.y - 0
		end
		if entity.direction == defines.direction.east then
			t_entity.position.x = entity.position.x - 0
			t_entity.position.y = entity.position.y - 1
		end
		if entity.direction == defines.direction.south then
			t_entity.position.x = entity.position.x - 1
			t_entity.position.y = entity.position.y - 0
		end
		if entity.direction == defines.direction.west then
			t_entity.position.x = entity.position.x - 0
			t_entity.position.y = entity.position.y - 1
		end
	end


  swap_entities(player, t_entity)

end)