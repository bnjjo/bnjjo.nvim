return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = true,
	-- don't show lualine on dashboard
	init = function()
		if vim.fn.argc(-1) == 0 then
			vim.o.laststatus = 0
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				if ft == "snacks_dashboard" or ft == "checkhealth" then
					vim.o.laststatus = 0
					vim.schedule(function()
						local ok, lualine = pcall(require, "lualine")
						if ok then
							lualine.hide({
								place = { "statusline", "tabline", "winbar" },
								unhide = false,
							})
						end
					end)
				elseif ft ~= "" then
					vim.o.laststatus = 2
					if not package.loaded["lualine"] then
						require("lazy").load({ plugins = { "lualine.nvim" } })
					else
						local ok, lualine = pcall(require, "lualine")
						if ok then
							lualine.hide({
								place = { "statusline", "tabline", "winbar" },
								unhide = true,
							})
						end
					end
				end
			end,
		})
	end,
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
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
					refresh_time = 16, -- ~60fps
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
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
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
