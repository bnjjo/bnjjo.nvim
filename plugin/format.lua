-- [[ Formatting ]]
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

local langs = require("langs")
require("conform").setup({
	notify_on_error = false,
	format_on_save = { timeout_ms = 700 },
	formatters_by_ft = langs.formatters,
})

vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true })
end, { desc = "[F]ormat buffer" })
