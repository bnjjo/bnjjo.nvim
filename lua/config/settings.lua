-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--
vim.g.have_nerd_font = true -- Nerd Font support
-- Line numbers
vim.o.number = true
vim.o.relativenumber = true
--
vim.o.mouse = "a" -- Mouse support
vim.o.showmode = false -- Hide mode indicator
-- System clipboard integration
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
vim.o.breakindent = true -- Indentation
vim.o.undofile = true -- Persistent undo
-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true
--
vim.o.signcolumn = "yes" -- Sign column always visible
vim.o.updatetime = 250 -- Faster updates (CursorHold, swap file writes)
vim.o.timeoutlen = 3000 -- Longer key sequence timeout (3s)
-- Split window behavior
vim.o.splitright = true
vim.o.splitbelow = true
--
vim.o.list = true -- Show whitespace characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split" -- Live preview of substitutions
vim.o.cursorline = true -- Highlight current line
vim.o.scrolloff = 10 -- Minimum lines to keep above/below cursor
vim.o.mousescroll = "ver:1,hor:1" -- Makes scrolling smoother
vim.o.confirm = true -- Confirm before failing operations due to unsaved changes
-- Indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
--
vim.opt.colorcolumn = "100" -- Color column
