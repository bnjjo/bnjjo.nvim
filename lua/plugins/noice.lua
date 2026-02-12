return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		routes = {
			-- notify when macro starts recording
			{
				view = "notify",
				filter = {
					event = "msg_showmode",
					any = {
						{ find = "recording" },
					},
				},
			},
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		{
			"rcarriga/nvim-notify",
			opts = {
				top_down = true,
				timeout = 1500, -- how long msgs stay
				max_width = 50, -- max width
				max_height = 5, -- max height
				minimum_width = 30, -- min width
			},
		},
	},
}
