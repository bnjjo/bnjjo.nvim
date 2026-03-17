return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				if ft == "snacks_dashboard" then
					vim.o.laststatus = 0
				elseif ft ~= "" then
					vim.o.laststatus = 2
					if not package.loaded["lualine"] then
						require("lazy").load({ plugins = { "lualine.nvim" } })
					end
				end
			end,
		})
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "NONE" })
				vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "NONE" })
			end,
		})
		vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "NONE" })
		vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = "NONE" })
	end,
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "/", right = "\\" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {
						"snacks_dashboard",
					},
					winbar = {
						"snacks_dashboard",
					},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16,
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { {
					"mode",
					icons_enabled = true,
					icon = "",
				} },
				lualine_b = { "branch" },
				lualine_c = { "filename", "diagnostics" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
