local function append_badge(prototype, badge)
	if not (prototype and badge) then return end
	prototype.icons = prototype.icons or {}
	for _, icon in ipairs(prototype.icons) do
		if icon.icon == badge then return end
	end
	table.insert(prototype.icons, { icon = badge, icon_size = 64 })
end

local function recipe(name)
	return data.raw.recipe[name]
end

append_badge(recipe("bery0zas-spray-surface-recycling"), bery0zas.functions.badge_icons.recycling)
