-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup {
        -- Manual mode doesn't automatically change your root directory, so you have
        -- the option to manually do so using `:ProjectRoot` command.
        manual_mode = false,

        -- Methods of detecting the root directory. **"lsp"** uses the native neovim
        -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
        -- order matters: if one is not detected, the other is used as fallback. You
        -- can also delete or rearangne the detection methods.
        detection_methods = { 'lsp', 'pattern' },

        -- All the patterns used to detect root dir, when **"pattern"** is in
        -- detection_methods
        patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json' },

        -- Table of lsp clients to ignore by name
        -- eg: { "efm", ... }
        ignore_lsp = {},

        -- Don't calculate root dir on specific directories
        -- Ex: { "~/.cargo/*", ... }
        exclude_dirs = {},

        -- Show hidden files in telescope
        show_hidden = false,

        -- When set to false, you will get a message when project.nvim changes your
        -- directory.
        silent_chdir = false,

        -- What scope to change the directory, valid options are
        -- * global (default)
        -- * tab
        -- * win
        scope_chdir = 'global',

        -- Path where project.nvim will store the project history for use in
        -- telescope
        datapath = vim.fn.stdpath 'data',
      }
    end,
  },
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      { 'folke/snacks.nvim', opts = { input = {}, picker = {}, terminal = {} } },
    },
    keys = {
      {
        '<leader>aa',
        function()
          require('opencode').toggle()
        end,
        mode = { 'n' },
        desc = 'Toggle OpenCode',
      },
      {
        '<leader>as',
        function()
          require('opencode').select { submit = true }
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode select',
      },
      {
        '<leader>ai',
        function()
          require('opencode').ask('', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode ask',
      },
      {
        '<leader>aI',
        function()
          require('opencode').ask('@this: ', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode ask with context',
      },
      {
        '<leader>ab',
        function()
          require('opencode').ask('@file ', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode ask about buffer',
      },
      {
        '<leader>ap',
        function()
          require('opencode').prompt('@this', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode prompt',
      },
      -- Built-in prompts
      {
        '<leader>ape',
        function()
          require('opencode').prompt('explain', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode explain',
      },
      {
        '<leader>apf',
        function()
          require('opencode').prompt('fix', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode fix',
      },
      {
        '<leader>apd',
        function()
          require('opencode').prompt('diagnose', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode diagnose',
      },
      {
        '<leader>apr',
        function()
          require('opencode').prompt('review', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode review',
      },
      {
        '<leader>apt',
        function()
          require('opencode').prompt('test', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode test',
      },
      {
        '<leader>apo',
        function()
          require('opencode').prompt('optimize', { submit = true })
        end,
        mode = { 'n', 'x' },
        desc = 'OpenCode optimize',
      },
    },
    config = function()
      vim.g.opencode_opts = {
        provider = {
          snacks = {
            win = {
              position = 'left',
            },
          },
        },
      }
      vim.o.autoread = true
    end,
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nvim_tmux_nav = require 'nvim-tmux-navigation'

      nvim_tmux_nav.setup {
        disable_when_zoomed = true, -- defaults to false
      }

      vim.keymap.set('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', '<C-\\>', nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', '<C-Space>', nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  },
  {
    'karb94/neoscroll.nvim',
    opts = {},
  },
  {
    'Exafunction/windsurf.vim',
    event = 'BufEnter',
  },
  {
    'utilyre/barbecue.nvim',
    name = 'barbecue',
    version = '*',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons', -- optional dependency
    },
    opts = {
      -- configurations go here
      theme = 'auto',
      -- show_dirname = false,
      -- show_basename = false,
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'tokyonight',
          globalstatus = true,
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', { 'diff', colored = true } },
          lualine_c = { { 'filename', path = 3, symbols = { modified = ' ●', readonly = ' ' } } },
          lualine_x = { 'diagnostics', 'encoding', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },
  {
    'sphamba/smear-cursor.nvim',
    opts = {
      -- Smear cursor when switching buffers or windows.
      smear_between_buffers = true,

      -- Smear cursor when moving within line or to neighbor lines.
      -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
      smear_between_neighbor_lines = true,

      -- Draw the smear in buffer space instead of screen space when scrolling
      scroll_buffer_space = true,

      -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
      -- Smears and particles will look a lot less blocky.
      legacy_computing_symbols_support = false,

      -- Smear cursor in insert mode.
      -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
      smear_insert_mode = true,
      stiffness = 0.8, -- 0.6      [0, 1]
      trailing_stiffness = 0.6, -- 0.45     [0, 1]
      stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      trailing_stiffness_insert_mode = 0.7, -- 0.5      [0, 1]
      damping = 0.95, -- 0.85     [0, 1]
      damping_insert_mode = 0.95, -- 0.9      [0, 1]
      distance_stop_animating = 0.5,
    },
  },
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        '                                               ▓                      ',
        '                                            ▒██▒      ░               ',
        '                                         ░▓▓██▓    ░░░░░░░░           ',
        '                                      ░▒█▓███▒      ░░░░░░░░          ',
        '                                   ▒▓█▓████▒        ░░░░░░░░▒         ',
        '                                ▒██████▓░            ▒░░░░░░▒         ',
        '                                ██░░                 ░░░░░░░░         ',
        '                               ░█▒                   ░░░░░░░          ',
        '                               ▒█                    ░░░░░▒▒░░░░░░░▒  ',
        '           ░░░                 █░                    ▒░░░░░░▒░░░░░░░▒ ',
        '    ░▒▓██▓▓██▓▓█▓░         ░░▒▒▓░▒▒░░               ░░░░▒░░░░░░░░░░░▒ ',
        ' ▒▓▓▓▓████▓▒    ░▓█▓░  ░░░░░░░░░░░░░░░░░            ░░░░░░░░░░░░░░░▒  ',
        '  ░░░░░            ░█▓░░░░░░░░░░░▒░░░░░░▒           ░░░░░░░░░░░░░▒░░░░',
        '                   ░▒░░░░░░░░░░▓█▒  ▒░░░░▒          ░░░░▒▒▒▒▒▒░░░░░░░░',
        '                   ░░░░░░░░░░▓▒░▒   ░░░░░░░         ░░░▒░░░░░░░░░░░░░ ',
        '                 ░▒░░░░░░░▓█▓       ▒░░░░░░         ░▒░░▒░░░░░░░░▒░░░ ',
        '                 ░   ░██▒░░▒       ▒░░░░░░░▒       ▒░░░▒░░░▒▒▒░░░░░░  ',
        '                 ░      ░░░░░░ ░░▒░░░░░░░░▒░░░   ▒░░░░░▒░░░░░░░░░░░░  ',
        '                  ▒▒░░▒▒░░░░░░░░▒▒░░░░▒▒▒░░▒░░░▒░░░░░░    ░░░▒░░░     ',
        '                ░░░░░░░░░░░░░░░░░░░░▒░░░░░▒░░▒░░░▒░                   ',
        '               ▒░░░░░░░░░░▒░░░░░░░░░░░░░░░░░░░▒▒                      ',
        '             ░░▒▓▓▓▓▓▓▓▓▓▓█▓░░░░▒░░░░░░░░░░░░░░▓░                     ',
        '           ░▓▓▓▓▓▓██▓▓▓████░░░░░░░░░░░░░░░░░░░░█▓                     ',
        '           ▒████▓████████▓░░░░░░░▒░░░░░░░░░░░░░░░                     ',
        '          ▒░░░▒█████████░░▒░░░░░▒░▒░░░░░░░░░░░░░▓░                    ',
        '       ░▒░▒░░░░░░░▒▓▓▓░ ▒░░▒▒░▒░░░░░░░░░░░░░░░▒██                     ',
        '        ░░▒▒░░░░░░    ░░▒░░░░░░░░░░░░░░░░░░░░▓█░░                     ',
        '       ▒▒░░        ░░░░░░░░░░░░░░░░░░░░░░░░░▓██▒▒                     ',
        '                 ░░░░░░░░░░░░░░░░░░░░░░░░░░░████░                     ',
        '                ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▓▓▒                       ',
      }
      -- 🧭 Botones del menú principal
      dashboard.section.buttons.val = {
        dashboard.button('f', '󰈞  Buscar archivo', ':Telescope find_files <CR>'),
        dashboard.button('r', '  Archivos recientes', ':Telescope oldfiles <CR>'),
        dashboard.button('p', '  Proyectos', ':Telescope projects <CR>'),
        dashboard.button('n', '  Nuevo archivo', ':ene <BAR> startinsert <CR>'),
        dashboard.button('q', '  Salir', ':qa<CR>'),
      }

      -- -- 🎨 Pie de página dinámico
      -- dashboard.section.footer.val = function()
      --   local datetime = os.date '%H:%M - %d/%m/%Y'
      --   local plugins = require('lazy').stats().count
      --   return '⚡ Neovim listo  |  ' .. plugins .. ' plugins cargados  |  ' .. datetime
      -- end

      dashboard.opts.opts.noautocmd = true
      alpha.setup(dashboard.opts)

      -- Colores opcionales
      vim.cmd [[
        hi AlphaHeader guifg=#89b4fa
        hi AlphaButton guifg=#a6e3a1
        hi AlphaFooter guifg=#cba6f7
      ]]
    end,
  },
}
