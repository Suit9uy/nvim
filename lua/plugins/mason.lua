-- if true then return {} end

---@type LazySpec
return {
  -- Mason LSP 配置
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        -- Lua
        "lua_ls",

        -- JavaScript / TypeScript
        "eslint", -- ESLint 語言服務器

        -- React / Next.js
        "tailwindcss", -- Tailwind CSS 語言服務器
        "cssls",       -- CSS 語言服務器
        -- "html",        -- HTML 語言服務器

        -- Python
        "pyright", -- Python 語言服務器

        -- Prisma
        "prismals", -- Prisma 語言服務器

        -- GraphQL (如果有用到)
        -- "graphql",

        -- Rust
        "rust_analyzer", -- Rust 語言服務器

        -- Prisma format tool
        "prismals",
      },
    },
  },

  -- Mason Null-LS 配置（格式化和 Linting）
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = {
        -- JavaScript / TypeScript
        "prettier", -- 通用程式碼格式化工具
        "eslint_d", -- ESLint 快速版本
        -- "biomejs",  -- 現代 JavaScript/TypeScript 格式化和 Linter

        -- Python
        "black",  -- Python 程式碼格式化工具
        "isort",  -- Python import 排序
        "flake8", -- Python Linter
        "mypy",   -- Python 靜態型別檢查

        -- Lua
        "stylua", -- Lua 程式碼格式化工具

        -- Web
        "prettierd", -- Prettier 精簡版本
        "djlint",    -- HTML 模板 Linter

        -- Rust 格式化工具
        "rustfmt", -- Rust 程式碼格式化工具
      },
    },
  },

  -- Mason DAP（調試適配器）配置
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "python", -- Python 調試器
        "js",     -- JavaScript 調試器
        "chrome", -- Chrome 調試器（React/Next.js）
        "lldb",   -- Rust 使用的調試器
      },
    },
  },

  -- 額外的 Mason 配置
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    config = function()
      -- 使用 mason-tool-installer 確保所有工具都被安裝
      require("mason-tool-installer").setup {
        ensure_installed = {
          -- LSP
          "lua_ls",
          "eslint",
          "tailwindcss",
          "prismals",
          "pyright",

          -- 格式化和 Linting
          "prettier",
          "eslint_d",
          "black",
          "flake8",
          "mypy",
          "stylua",

          -- 調試工具
          "debugpy", -- Python 調試器

          -- 安裝 typescript-language-server
          "typescript-language-server",

          -- Rust 工具
          "rustfmt",       -- Rust 格式化工具
          "rust-analyzer", -- Rust 語言伺服器
        },
      }
    end,
  },
}
