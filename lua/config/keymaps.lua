-- [[ Basic Keymaps ]]
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	-- Can switch between these as you prefer
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines
	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
})

-- leader+d: show diagnostics float for current line only
vim.keymap.set("n", "<leader>d", function()
	vim.diagnostic.open_float({
		scope = "line",
		focusable = false,
		border = "rounded",
		source = "if_many",
		header = "Line Diagnostics",
		prefix = function(diag, _)
			local icons = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = " ",
				[vim.diagnostic.severity.INFO] = "󰌕 ",
				[vim.diagnostic.severity.HINT] = "󰌕 ",
			}
			return (icons[diag.severity] or "󰌕 ") .. " "
		end,
	})
end, { desc = "Diagnostics: current line" })

-- leader+D: open location list with all diagnostics in the file
vim.keymap.set("n", "<leader>D", function()
	vim.diagnostic.setloclist({
		open = true,
		title = "All Diagnostics",
		severity = { min = vim.diagnostic.severity.HINT },
	})
end, { desc = "Diagnostics: all in file" })

-- make location list closable with esc
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function(event)
		vim.keymap.set("n", "<Esc>", "<cmd>lclose<cr>", { buffer = event.buf, silent = true })
	end,
})

-- close the command-line window (cmdwin) without executing
vim.api.nvim_create_autocmd("CmdwinEnter", {
	callback = function()
		vim.keymap.set(
			"n",
			"<Esc>",
			"<Cmd>q<CR>",
			{ buffer = true, noremap = true, silent = true, desc = "Close cmdwin" }
		)
	end,
})

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
