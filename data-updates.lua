if bery0zas.pure_it.triggers["integrate-angelspetrochem"] then require("prototypes.integration.angelspetrochem-updates") end

if mods["angelspetrochem"] then --? WHY ?
	data.raw["assembling-machine"]["angels-air-filter"].energy_source.emissions_per_minute = 0
	data.raw["assembling-machine"]["angels-air-filter-2"].energy_source.emissions_per_minute = 0
end

local setting_emission = settings.startup["bery0zas-pure-it-amountofcollectedpollution"].value --[[@as number]]
for tier = 1, 3, 1 do
	bery0zas.functions.alter_emissions(
		{ type= "assembling-machine", name= "bery0zas-air-suction-tower", tier= tier },
		{ pollution= setting_emission * -1}
	)
end

if mods["space-age"] then
	require("space-age.functions")

	local _t = {bery0zas.pure_it.entities.air_suction_tower, bery0zas.pure_it.entities.air_absorber, bery0zas.pure_it.entities.air_adsorber}
	local len = #_t or 1
	for i = 1, len, 1 do
		for tier = 1, _t[i].tiers, 1 do
			bery0zas.functions.set_surface_conditions(
				{ type=_t[i].entity.type, name=_t[i].name.."-"..tier }, { property = "pressure", min = 1000, max = 2000 }
			)
		end
	end

	data.raw["recipe"]["bery0zas-oxygen-extraction"].surface_conditions =	{{ property = "pressure", min = 1000, max = 2000 }}

end
