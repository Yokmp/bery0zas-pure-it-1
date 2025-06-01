
--set or alter surface conditions
---@param entity { type: string, name: string }
---@param property data.SurfaceCondition
function bery0zas.functions.set_surface_conditions(entity, property)

  if not bery0zas.functions.address_exists(data.raw, entity.type, entity.name) then
  log("entity not found: "..(entity.type or "nil").."/"..(entity.name or "nil")) return end

  log("new surface_conditions: "..entity.name.." - "..serpent.line(property))

  if type(data.raw[entity.type][entity.name].surface_conditions) ~= "table" then
    data.raw[entity.type][entity.name].surface_conditions = {property}
    return
  end

  local entity_data = util.table.deepcopy(data.raw[entity.type][entity.name])
  for index in ipairs(entity_data["surface_conditions"]) do
    if entity_data["surface_conditions"][index].property == property.property then
      table.remove(entity_data["surface_conditions"], index)
    end
  end

  table.insert(entity_data["surface_conditions"], property)
  data:extend({entity_data})
end

