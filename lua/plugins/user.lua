-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.mapping = cmp.mapping.preset.insert {
        ["<Tab>"] = cmp.mapping.select_next_item(),       -- cmp.mapping.select_next_item(), -- 選擇下一個補全項
        ["<A-Space>"] = cmp.mapping.complete(),           -- 打開補全菜單
        ["<CR>"] = cmp.mapping.confirm { select = true }, -- 確認補全
        ["<Down>"] = cmp.mapping.select_next_item(),      -- 選擇下一個補全項
        ["<Up>"] = cmp.mapping.select_prev_item(),        -- 選擇上一個補全項
        ["<C-j>"] = cmp.mapping.select_next_item(),       -- 選擇下一個補全項
        ["<C-k>"] = cmp.mapping.select_prev_item(),       -- 選擇上一個補全項
      }

      -- 整合 entry_filter 過濾邏輯
      opts.sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          entry_filter = function(entry)
            if
                entry:get_kind()
                == require("cmp.types").lsp.CompletionItemKind.Snippet
                and entry.source:get_debug_name() == "nvim_lsp:emmet_ls"
            then
              return false
            end
            return true
          end,
        },
        { name = "copilot" },
        { name = "luasnip" },
      }, {
        {
          name = "buffer",
          option = {
            get_bufnrs = function() return vim.api.nvim_list_bufs() end,
          },
        },
      })
      -- 整合 entry_filter 過濾邏輯

      return opts
    end,

    -- "hrsh7th/cmp-nvim-lsp",
    -- enabled = false, -- 禁用該插件
  },
  { "max397574/better-escape.nvim", enabled = true },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip" (plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      luasnip.filetype_extend("typescript", { "typescriptreact" })
    end,

    -- "L3MON4D3/LuaSnip",
    -- enabled = false, -- 禁用該插件
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs" (plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
          -- don't add a pair if the next character is %
              :with_pair(
                cond.not_after_regex "%%"
              )
          -- don't add a pair if  the previous character is xxx
              :with_pair(
                cond.not_before_regex("xxx", 3)
              )
          -- don't move right when repeat character
              :with_move(
                cond.none()
              )
          -- don't delete if the next character is xx
              :with_del(
                cond.not_after_regex "xx"
              )
          -- disable adding a newline when you press <cr>
              :with_cr(
                cond.none()
              ),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    {
      "AstroNvim/astroui",
      ---@type AstroUIOpts
      opts = {
        icons = {
          ActiveLSP = "",
          ActiveTS = " ",
          BufferClose = "󰰱",
          DapBreakpoint = "",
          DapBreakpointCondition = "",
          DapBreakpointRejected = "",
          DapLogPoint = "",
          DapStopped = "",
          DefaultFile = "",
          Diagnostic = "",
          DiagnosticError = "",
          DiagnosticHint = "",
          DiagnosticInfo = "",
          DiagnosticWarn = "",
          Ellipsis = "",
          FileModified = "",
          FileReadOnly = "",
          FoldClosed = "",
          FoldOpened = "",
          FolderClosed = "",
          FolderEmpty = "",
          FolderOpen = "",
          Git = "",
          GitAdd = "",
          GitBranch = "",
          GitChange = "",
          GitConflict = "",
          GitDelete = "",
          GitIgnored = "",
          GitRenamed = "",
          GitStaged = "",
          GitUnstaged = "",
          GitUntracked = "",
          LSPLoaded = "",
          LSPLoading1 = "",
          LSPLoading2 = "",
          LSPLoading3 = "",
          MacroRecording = "",
          Paste = "",
          Search = "",
          Selected = "",
          TabClose = "",
        },
      },
    },
    {
      "onsails/lspkind.nvim",
      opts = function(_, opts)
        -- use codicons preset
        opts.preset = "codicons"
        opts.mode = "symbol_text"
        -- set some missing symbol types
        opts.symbol_map = {
          Array = "",
          Boolean = "",
          Key = "",
          Namespace = "",
          Null = "",
          Number = "",
          Object = "",
          Package = "",
          String = "",
        }
      end,
    },
  },
}
