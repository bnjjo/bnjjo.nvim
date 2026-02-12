-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- show message when macro recording ends
local macro_group = vim.api.nvim_create_augroup("MacroRecording", { clear = true })
vim.api.nvim_create_autocmd("RecordingLeave", {
	group = macro_group,
	callback = function()
		-- Display a message when macro recording stops
		print("macro recording stopped")
	end,
})

-- Close LSP hover windows with Esc
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "noice", "markdown", "help" },
	callback = function(ev)
		vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = ev.buf, silent = true })
	end,
})

-- Open compilation window in separate tab
vim.api.nvim_create_autocmd("FileType", {
	pattern = "compilation",
	callback = function()
		local orig_win = vim.api.nvim_get_current_win()

		vim.cmd("tab split")
		vim.cmd("tabprevious")
		vim.api.nvim_win_close(orig_win, true)
		vim.cmd("tabnext")
	end,
	desc = "Move compilation to new tab & close original split",
})
