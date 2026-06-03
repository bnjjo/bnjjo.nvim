vim.pack.add({
	{
		src = "https://github.com/vieitesss/miniharp.nvim",
		version = vim.version.range("v*"), -- latest stable release
		-- version = 'nightly', -- latest changes from main
	},
})

local miniharp = require("miniharp")

miniharp.setup({
	autoload = true, -- load marks for this cwd on startup (default: true)
	autosave = true, -- save marks for this cwd on exit (default: true)
	show_on_autoload = false, -- show popup list after a successful autoload (default: false)
	notifications = true, -- enable notification and status messages (default: true)
	ui = {
		position = "center", -- 'center' | 'top-left' | 'top-right' | 'bottom-left' | 'bottom-right'
		show_hints = true, -- show close hints in the floating list (default: true)
		enter = true, -- enter the floating window when it opens (default: true)
	},
})

vim.keymap.set("n", "<leader>a", miniharp.toggle_file, { desc = "miniharp: toggle file mark" })
vim.keymap.set("n", "<C-n>", miniharp.next, { desc = "miniharp: next file mark" })
vim.keymap.set("n", "<C-p>", miniharp.prev, { desc = "miniharp: prev file mark" })
vim.keymap.set("n", "<C-e>", miniharp.show_list, { desc = "miniharp: toggle marks list" })
-- vim.keymap.set("n", "<leader>L", miniharp.enter_list, { desc = "miniharp: enter marks list" })

for i = 0, 9 do
	vim.keymap.set("n", "\x1b" .. i, function()
		miniharp.go_to(i == 0 and 10 or i)
	end)
end
