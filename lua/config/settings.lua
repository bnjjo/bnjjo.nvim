-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Mouse support
vim.o.mouse = "a"

-- Hide mode indicator (shown in statusline instead)
vim.o.showmode = false

-- System clipboard integration
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Indentation
vim.o.breakindent = true

-- Persistent undo
vim.o.undofile = true

-- Search settings
vim.o.ignorecase = true
vim.o.smartcase = true

-- Sign column always visible
vim.o.signcolumn = "yes"

-- Faster updates (CursorHold, swap file writes)
vim.o.updatetime = 250

-- Faster key sequence timeout
vim.o.timeoutlen = 300

-- Split window behavior
vim.o.splitright = true
vim.o.splitbelow = true

-- Show whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Live preview of substitutions
vim.o.inccommand = "split"

-- Highlight current line
vim.o.cursorline = true

-- Minimum lines to keep above/below cursor
vim.o.scrolloff = 10

-- make scrolling slightly smoother (still no per-pixel scroll :c)
vim.o.mousescroll = "ver:1,hor:1"

-- Confirm before failing operations due to unsaved changes
vim.o.confirm = true

-- hide command line when not in use
vim.opt.cmdheight = 0
vim.opt.shortmess:append("c") -- hides some cmdline noise

-- Indentation settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = false
vim.opt.autoindent = true
