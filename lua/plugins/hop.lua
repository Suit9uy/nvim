return {
  {
    -- Hop.nvim 快速跳转插件配置
    "smoka7/hop.nvim",
    version = "*", -- 使用最新版本

    -- 定义触发插件加载的按键映射
    keys = {
      -- F 键：跳转到任意两个字符
      {
        "F",
        function() vim.cmd "HopChar2" end,
        mode = { "n", "x", "o" },
      },
      -- f 键：跳转到单词
      {
        "f",
        function() vim.cmd "HopWord" end,
        mode = { "n", "x", "o" }, -- 在普通、可视和操作符待决模式下生效
      },
      -- 當前行單詞跳轉
      {
        "w",
        function() vim.cmd "HopWordCurrentLine" end,
        mode = { "n", "x", "o" },
      },
      -- 额外功能：跳转到行首
      {
        "gl",
        function() vim.cmd "HopLineStart" end,
        mode = { "n", "x", "o" },
      },
    },

    -- Hop.nvim 的其他配置选项
    opts = {
      multi_windows = true,             -- 启用多窗口跳转
      keys = "etovxqpdygfblzhckisuran", -- 使用新版本推荐的按键顺序
      case_insensitive = true,          -- 大小写不敏感跳转
      jump_on_sole_occurrence = true,   -- 唯一匹配时直接跳转
    },
  },
}
