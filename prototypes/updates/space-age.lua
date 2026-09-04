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

	if data.raw.recipe["bery0zas-oxygen-extraction"] then
		data.raw.recipe["bery0zas-oxygen-extraction"].surface_conditions =	{{ property = "pressure", min = 1000, max = 2000 }}
	end
end
