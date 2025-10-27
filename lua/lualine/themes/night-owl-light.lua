local colors = {
	dark = "#fbfbfb",
	light = "#403f53",
	magenta = "#994CC3",
	green = "#08916a",
	yellow = "#e0af02",
	orange = "#F78C6C",
	cyan = "#0C969B",
	dark_blue = "#f0f0f0",
	light_blue = "#989fb1",
	none = "NONE",
}

local night_owl_light = {
	normal = {
		a = { bg = colors.none, fg = colors.magenta, gui = "bold" },
		b = { bg = colors.none, fg = colors.light },
		c = { bg = colors.none, fg = colors.light },
	},
	insert = {
		a = { bg = colors.none, fg = colors.green, gui = "bold" },
		b = { bg = colors.none, fg = colors.light },
		c = { bg = colors.none, fg = colors.light },
	},
	visual = {
		a = { bg = colors.none, fg = colors.yellow, gui = "bold" },
		b = { bg = colors.none, fg = colors.light },
		c = { bg = colors.none, fg = colors.light },
	},
	replace = {
		a = { bg = colors.none, fg = colors.orange, gui = "bold" },
		b = { bg = colors.none, fg = colors.light },
		c = { bg = colors.none, fg = colors.light },
	},
	command = {
		a = { bg = colors.none, fg = colors.cyan, gui = "bold" },
		b = { bg = colors.none, fg = colors.light },
		c = { bg = colors.none, fg = colors.light },
	},
	inactive = {
		a = { bg = colors.none, fg = colors.light_blue, gui = "bold" },
		b = { bg = colors.none, fg = colors.light_blue },
		c = { bg = colors.none, fg = colors.light_blue },
	},
}

return night_owl_light