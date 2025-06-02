

--- Template class holds entity, item and recipe informations
---@class (exact) PureIt.Template
---@field name string
---@field tiers integer
---@field recipe table
---@field factoriopedia PureIt.SimulationDefinition
---@field crafting_speed_multiplier number
---@field energy_units string
---@field energy_usage integer
---@field entity table
---@field has_tint boolean
---@field item table
---@field recipe_tiers PureIt.IngredientPrototype


---@class PureIt.IngredientPrototype
---@field type string
---@field name string
---@field amount number


---@class PureIt.SimulationDefinition
---@field position MapPosition.0
---@field zoom number
---@field direction defines.direction|integer
