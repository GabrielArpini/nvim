return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          progress = {
            enabled = true,
            format = "lsp_progress",
            format_done = "lsp_progress_done",
            view = "mini",
          },
        },
        presets = {
          bottom_search         = false,
          command_palette       = false,
          long_message_to_split = true,
          inc_rename            = false,
        },
        cmdline = {
          enabled = true,
          view = "cmdline_popup",
          format = {
            cmdline    = { icon = "»" },
            search_down = { icon = "/" },
            search_up  = { icon = "?" },
            filter     = { icon = "$" },
            lua        = { icon = "☽" },
            help       = { icon = "·" },
          },
        },
        messages = {
          enabled = true,
          view = "mini",              -- small inline, not intrusive
          view_error = "mini",
          view_warn = "mini",
        },
        notify = {
          enabled = true,
          view = "mini",
        },
        views = {
          cmdline_popup = {
            position = { row = "45%", col = "50%" },
            size = { width = 60, height = "auto" },
            border = {
              style = "single",
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = {
                Normal = "NoicePopup",
                FloatBorder = "NoicePopupBorder",
              },
            },
          },
          mini = {
            win_options = { winblend = 0 },
            position = { row = -2, col = -2 },
          },
        },
      })

      -- Highlight groups to match Nighthawks
      vim.api.nvim_set_hl(0, "NoicePopup",         { fg = "#b0a080", bg = "#090908" })
      vim.api.nvim_set_hl(0, "NoicePopupBorder",   { fg = "#2a2620", bg = "#090908" })
      vim.api.nvim_set_hl(0, "NoiceCmdlineIcon",   { fg = "#d4a85a" })
      vim.api.nvim_set_hl(0, "NoiceCmdlinePopup",  { fg = "#b0a080", bg = "#090908" })
      vim.api.nvim_set_hl(0, "NoiceConfirm",       { fg = "#b0a080", bg = "#090908" })
      vim.api.nvim_set_hl(0, "NoiceMini",          { fg = "#5a4e38", bg = "#0f0e0c" })
    end,
  },
}
