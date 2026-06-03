-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local function run_build(name, cmd, cwd)
	local result = vim.system(cmd, { cwd = cwd }):wait()
	if result.code ~= 0 then
		local stderr = result.stderr or ""
		local stdout = result.stdout or ""
		local output = stderr ~= "" and stderr or stdout
		if output == "" then
			output = "No output from build command."
		end
		vim.notify(("Build failed for %s:\n%s"):format(name, output), vim.log.levels.ERROR)
	end
end

-- This autocommand runs after a plugin is installed or updated and
--  runs the appropriate build command for that plugin if necessary.
--
-- See `:help vim.pack-events`
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name = ev.data.spec.name
		local kind = ev.data.kind
		if kind ~= "install" and kind ~= "update" then
			return
		end

		if name == "telescope-fzf-native.nvim" and vim.fn.executable("make") == 1 then
			run_build(name, { "make" }, ev.data.path)
			return
		end

		if name == "LuaSnip" then
			if vim.fn.has("win32") ~= 1 and vim.fn.executable("make") == 1 then
				run_build(name, { "make", "install_jsregexp" }, ev.data.path)
			end
			return
		end

		if name == "nvim-treesitter" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
			return
		end
	end,
})

-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Show message when macro recording ends
local macro_group = vim.api.nvim_create_augroup("MacroRecording", { clear = true })
vim.api.nvim_create_autocmd("RecordingLeave", {
	group = macro_group,
	callback = function()
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
