

bery0zas = bery0zas or {}

bery0zas.common = bery0zas.common or {}
require("prototypes.common")

bery0zas.functions = bery0zas.functions or {}
require("prototypes.functions")
require("prototypes.simulation")

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

local inputs = {
  {"R",         "bery0zas-rotate-right",      "Rotate Clockwise"},
  {"SHIFT + R", "bery0zas-rotate-left",       "Rotate AntiClockwise"},
  }

for i,v in ipairs(inputs) do
  data:extend{{
      type = "custom-input",
      name = v[2],
      localised_name = {"", v[3]},
      key_sequence = v[1],
      -- consuming = "game-only",
      order = "pp"..i
    }}
end
