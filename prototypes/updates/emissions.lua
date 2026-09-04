local setting_emission = settings.startup["bery0zas-pure-it-amountofcollectedpollution"].value --[[@as number]]
for tier = 1, 3, 1 do
	bery0zas.functions.alter_emissions(
		{ type= "assembling-machine", name= "bery0zas-air-suction-tower", tier= tier },
		{ pollution= setting_emission * -1}
	)
end
