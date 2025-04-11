return {
  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup {
        transparent_background = true,
        integrations = {
          cmp = true,
          fidget = true,
          gitsigns = true,
          harpoon = true,
          indent_blankline = {
            enabled = false,
            scope_color = "sapphire",
            colored_indent_levels = false,
          },
          mason = true,
          dap = true, -- 自己新增
          dap_ui = true, -- 自己新增
          hop = true, -- 自己新增
          neotree = true, -- 自己新增
          lsp_trouble = true, -- 自己新增

          mini = { -- 自己新增
            enabled = true,
            indentscope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
          },

          native_lsp = { enabled = true },
          noice = true,
          notify = true,
          symbols_outline = true,
          telescope = true,
          treesitter = true,
          treesitter_context = true,
        },
      }

      vim.cmd.colorscheme "catppuccin-mocha"

      -- Hide all semantic highlights until upstream issues are resolved (https://github.com/catppuccin/nvim/issues/480)
      for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
        vim.api.nvim_set_hl(0, group, {})
      end
    end,
  },
}
