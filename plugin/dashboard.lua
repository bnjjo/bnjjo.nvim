vim.pack.add({ "https://github.com/goolord/alpha-nvim" })

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[                                                    ]],
	[[                                                    ]],
	[[ █▄                                                 ]],
	[[ ██    ▄     ▀▀ ▀▀           ▄           ▀▀ ▄       ]],
	[[ ████▄ ████▄ ██ ██ ▄███▄     ████▄▀█▄ ██▀██ ███▄███▄]],
	[[ ██ ██ ██ ██ ██ ██ ██ ██     ██ ██ ██▄██ ██ ██ ██ ██]],
	[[▄████▀▄██ ▀█▄██▄██▄▀███▀ ██ ▄██ ▀█  ▀█▀ ▄██▄██ ██ ▀█]],
	[[             ██ ██                                  ]],
	[[           ▀▀▀▀▀▀                                   ]],
}

dashboard.section.buttons.val = {
	dashboard.button("n", "  new file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("o", "  search org mode files", ":Tv org <CR>"),
	dashboard.button("f", "  search files", ":Tv files <CR>"),
	dashboard.button("c", "  search config", ":Tv nvim <CR>"),
	dashboard.button("l", "  list packages", ":lua vim.pack.update(nil, { offline = true }) <CR>"),
	dashboard.button("u", "  update packages", ":lua vim.pack.update(nil, { force = true }) <CR>"),
	dashboard.button("C", "  check health", ":checkhealth <CR>"),
	dashboard.button("q", "󰅚  quit neovim", ":qa <CR>"),
}

-- center dashboard vertically
local layout = {
	type = "group",
	val = {
		dashboard.section.header,
		{ type = "padding", val = 2 },
		dashboard.section.buttons,
		dashboard.section.footer,
	},
	opts = { position = "v_center" },
}

dashboard.config.layout = { layout }
dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)
