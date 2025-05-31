if bery0zas.pure_it.triggers["integrate-angelspetrochem"] then require("prototypes.integration.angelspetrochem-updates") end

if mods["angelspetrochem"] then
	data.raw["assembling-machine"]["angels-air-filter"].energy_source.emissions_per_minute = 0
	data.raw["assembling-machine"]["angels-air-filter-2"].energy_source.emissions_per_minute = 0
end

local setting_emission = settings.startup["bery0zas-pure-it-amountofcollectedpollution"].value --[[@as number]]
bery0zas.functions.alter_emissions(
	{ type= "assembling-machine", name= "bery0zas-air-suction-tower" },
	{ pollution= setting_emission * -1}
)