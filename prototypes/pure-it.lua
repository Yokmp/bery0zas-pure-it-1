bery0zas.pure_it = {}

bery0zas.pure_it.recipe_categories =
{
	"bery0zas-air-filtering-machine",
	"bery0zas-air-filtering-item",
	"bery0zas-air-filtering-suction",
	"bery0zas-air-filtering-sparging",
	"bery0zas-air-filtering-chemistry",
	"bery0zas-air-filtering-absorption",
	"bery0zas-air-filtering-adsorption",
	"bery0zas-air-filtering-burning"
}

bery0zas.pure_it.triggers = {}
bery0zas.pure_it.triggers["integrate-bobplates"] = mods["bobplates"] and settings.startup["bery0zas-pure-it-integrate-bobs"].value
bery0zas.pure_it.triggers["integrate-angelspetrochem"] = mods["angelspetrochem"] and settings.startup["bery0zas-pure-it-integrate-angelspetrochem"].value
bery0zas.pure_it.triggers["leave-halite"] = not (mods["angelspetrochem"] and settings.startup["bery0zas-pure-it-integrate-angelspetrochem"].value) or
settings.startup["bery0zas-pure-it-leave-halite"].value

function bery0zas.pure_it.add_crafting_categories()
	bery0zas.functions.add_crafting_category("character", "character", "bery0zas-air-filtering-machine")
	bery0zas.functions.add_crafting_category("assembling-machine", "assembling-machine-1", "bery0zas-air-filtering-machine")
	bery0zas.functions.add_crafting_category("assembling-machine", "assembling-machine-1", "bery0zas-air-filtering-item")
	bery0zas.functions.add_crafting_category("assembling-machine", "assembling-machine-2", "bery0zas-air-filtering-machine")
	bery0zas.functions.add_crafting_category("assembling-machine", "assembling-machine-2", "bery0zas-air-filtering-item")
	bery0zas.functions.add_crafting_category("assembling-machine", "assembling-machine-3", "bery0zas-air-filtering-machine")
	bery0zas.functions.add_crafting_category("assembling-machine", "assembling-machine-3", "bery0zas-air-filtering-item")
	bery0zas.functions.add_crafting_category("assembling-machine", "chemical-plant", "bery0zas-air-filtering-chemistry")
	bery0zas.functions.add_crafting_category("furnace", "stone-furnace", "bery0zas-air-filtering-burning")
	bery0zas.functions.add_crafting_category("furnace", "steel-furnace", "bery0zas-air-filtering-burning")
	bery0zas.functions.add_crafting_category("furnace", "electric-furnace", "bery0zas-air-filtering-burning")

	if mods["angelspetrochem"] then
		for _, name in ipairs({
			"angels-chemical-plant",
			"angels-chemical-plant-2",
			"angels-chemical-plant-3",
			"angels-chemical-plant-4",
			"advanced-chemical-plant",
			"advanced-chemical-plant-2",
			"angels-advanced-chemical-plant",
			"angels-advanced-chemical-plant-2",
		}) do
			bery0zas.functions.add_crafting_category("assembling-machine", name, "bery0zas-air-filtering-chemistry")
		end
	end
end
