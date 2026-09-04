if mods["angelspetrochem"] then
	for _, name in ipairs({"angels-air-filter", "angels-air-filter-2", "angels-air-filter-3"}) do
		local machine = data.raw["assembling-machine"][name]
		if machine and machine.energy_source then
			machine.energy_source.emissions_per_minute = { pollution = 0 }
		end
	end
end
