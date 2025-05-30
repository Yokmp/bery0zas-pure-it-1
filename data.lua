
--- Template class holds entity, item and recipe informations
---@class (exact) PureItTemplate
---@field base_name string
---@field base_recipe table
---@field crafting_speed_multiplier number
---@field energy_units string
---@field energy_usage string
---@field entity table
---@field has_tint boolean
---@field item table
---@field recipe_tiers IngredientPrototype

---@class IngredientPrototype
---@field type string
---@field name string
---@field amount number

--- Global class which holds all functions
---@class bery0zas
---@field common table
---@field function table
---@field pure_it table

---@class pure_it: bery0zas
---@field entities table
---@field integration table mod integration
---@field add_crafting_categories function
---@field recipe_categories table<number, string>
---@field triggers table TRIGGER CHECKS

--- Helper functions
---@class common: bery0zas
---@field crafting_speeds table<number>
---@field level_tint table<Color>

--- Manipulation
---@class functions: bery0zas
---@field add_technology_recipe function adds a recipe as effect to a technology
---@field alter_recipe function
---@field pipe_pictures function
---@field register_entity function
---@field register_recipe_categories function
---@field remove_fluid function
---@field remove_item function
---@field remove_recipe function
---@field remove_technology_recipe function

bery0zas = bery0zas or {}

bery0zas.common = bery0zas.common or {}
require("prototypes.common")

bery0zas.functions = bery0zas.functions or {}
require("prototypes.functions")

require("prototypes.pure-it")

require("prototypes.item")
require("prototypes.fluid")
require("prototypes.entity")
require("prototypes.recipe")
require("prototypes.technology")

bery0zas.functions.register_recipe_categories(bery0zas.pure_it.recipe_categories)
bery0zas.pure_it.add_crafting_categories()

bery0zas.pure_it.integration = {}

if bery0zas.pure_it.triggers["integrate-bobplates"] then require("prototypes.integration.bobplates") end
if bery0zas.pure_it.triggers["integrate-angelspetrochem"] then require("prototypes.integration.angelspetrochem") end