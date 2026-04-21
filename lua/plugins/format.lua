return {
  {
    "nvimdev/guard.nvim",
    dependencies = { "nvimdev/guard-collection" },
    event = "BufReadPre",
    config = function()
      vim.g.guard_config = {
        fmt_on_save = true,
        lsp_as_default_formatter = false,
        save_on_fmt = true,
        refresh_diagnostic = true,
      }

      local ft = require("guard.filetype")
      ft("c,cpp,cuda"):fmt("clang-format")
      ft("json"):fmt("clang-format")
    end,
  },
}
