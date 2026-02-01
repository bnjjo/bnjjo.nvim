return {
  {
    { 'NMAC427/guess-indent.nvim', opts = {} },
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      delay = 0,
      icons = { mappings = vim.g.have_nerd_font },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },
    },
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'nvim-mini/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()

      -- Statusline
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function() return '%2l:%-2v' end
    end,
  },

  -- SPC P C to compile project like in emacs
  {
    'ej-shafran/compile-mode.nvim',
    version = '^5.0.0',
    branch = 'latest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- 'm00qek/baleia.nvim',
    },
    config = function()
      ---@type CompileModeOpts
      vim.g.compile_mode = {
        focus_compilation_buffer = true,
      }
    end,

    vim.keymap.set('n', '<leader>pc', '<cmd>Compile<CR>', { desc = '[P]roject [C]ompile' }),
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'compilation',
      callback = function(event)
        vim.keymap.set('n', '<Esc>', function()
          vim.cmd 'wincmd j'
          vim.cmd('bd ' .. event.buf)
        end, { buffer = event.buf, desc = 'Close compilation buffer' })
      end,
    }),
  },
}
