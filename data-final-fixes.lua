local test_mode = settings.startup["bery0zas-pure-it-test-mode"]

if test_mode and test_mode.value then
	local profile = {}
	local ok, loaded_profile = pcall(require, "tools.test.profile")
	if ok and type(loaded_profile) == "table" then
		profile = loaded_profile
	end

	bery0zas = bery0zas or {}
	bery0zas.pure_it = bery0zas.pure_it or {}
	bery0zas.pure_it.test_profile = profile.name or "default"
	bery0zas.pure_it.test_settings = profile.settings or {}

	local runner = require("tools.test.runner")
	data:extend({
		{
			type = "mod-data",
			name = "bery0zas-pure-it-test-report",
			data_type = "bery0zas-pure-it-test-report/v1",
			data = runner.run(profile)
		}
	})
end
