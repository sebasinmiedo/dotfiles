return {
  -- 1. Mantén indent-blankline SOLO para las líneas grises tenues (sin scope)
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = { char = '│', highlight = 'IblIndent' },
      scope = { enabled = false }, -- Desactivamos su scope porque es el que falla
    },
    config = function(_, opts)
      vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#2c323c' }) -- Casi invisible
      require('ibl').setup(opts)
    end,
  },

  -- 2. Usa mini.indentscope para el resaltado del Scope (es mucho más estable)
  {
    'echasnovski/mini.indentscope',
    version = false, -- Usa la última versión
    opts = {
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'help', 'alpha', 'dashboard', 'neo-tree', 'lazy', 'mason' },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      -- El color del scope: Azul frío e intenso
      vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { fg = '#61afef', bold = true })
      require('mini.indentscope').setup(opts)
    end,
  },
}
-- return {
--   {
--     'lukas-reineke/indent-blankline.nvim',
--     main = 'ibl',
--     opts = {
--       indent = {
--         -- char = '▏',
--         char = '│',
--         highlight = {
--           'RainbowRed',
--           'RainbowYellow',
--           'RainbowBlue',
--           'RainbowOrange',
--           'RainbowGreen',
--           'RainbowViolet',
--           'RainbowCyan',
--         },
--       },
--       scope = {
--         enabled = true,
--         show_start = true,
--         show_end = false,
--         highlight = { 'IblScope' },
--       },
--       exclude = {
--         filetypes = { 'help', 'dashboard', 'NvimTree', 'neo-tree', 'Trouble', 'lazy' },
--         buftypes = { 'terminal', 'nofile' },
--       },
--     },
--     config = function(_, opts)
--       local hooks = require 'ibl.hooks'
--       -- 🎨 Colores personalizados (Rainbow)
--       hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--         vim.api.nvim_set_hl(0, 'RainbowRed', { fg = '#E06C75' })
--         vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = '#E5C07B' })
--         vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = '#61AFEF' })
--         vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = '#D19A66' })
--         vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = '#98C379' })
--         vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = '#C678DD' })
--         vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = '#56B6C2' })
--       end)
--
--       require('ibl').setup(opts)
--     end,
--   },
-- }
