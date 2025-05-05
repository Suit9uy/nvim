return {
  "Saghen/blink.cmp",
  optional = true,
  opts = function(_, opts)
    if not opts.keymap then
      opts.keymap = {}
    end
    opts.keymap["<C-l>"] = {
      "snippet_forward",
      function()
        if vim.g.ai_accept then
          return vim.g.ai_accept()
        end
      end,
      "fallback",
    }
    opts.keymap["<CR>"] = { "snippet_forward","select_and_accept","fallback" }
  end,
}
