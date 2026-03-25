return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- Mode indicator: single ambient character, no background block
      local mode_map = {
        ["NORMAL"]   = "·",
        ["INSERT"]   = "⚊",
        ["VISUAL"]   = "▪",
        ["V-LINE"]   = "▪",
        ["V-BLOCK"]  = "▪",
        ["REPLACE"]  = "×",
        ["COMMAND"]  = "»",
        ["TERMINAL"] = "~",
      }

      local function mode_icon()
        return mode_map[require("lualine.utils.mode").get_mode()] or "·"
      end

      local flat = {
        normal   = { a = { fg = "#d4a85a", bg = "#0f0e0c" },
                     b = { fg = "#5a4e38", bg = "#0f0e0c" },
                     c = { fg = "#5a4e38", bg = "#0f0e0c" } },
        insert   = { a = { fg = "#6aadad", bg = "#0f0e0c" } },
        visual   = { a = { fg = "#c8934a", bg = "#0f0e0c" } },
        replace  = { a = { fg = "#a84848", bg = "#0f0e0c" } },
        inactive = { a = { fg = "#2a2620", bg = "#0f0e0c" },
                     b = { fg = "#2a2620", bg = "#0f0e0c" },
                     c = { fg = "#2a2620", bg = "#0f0e0c" } },
      }

      require("lualine").setup({
        options = {
          theme = flat,
          component_separators = "",
          section_separators = "",
          globalstatus = true,
        },
        sections = {
          lualine_a = { mode_icon },
          lualine_b = {
            { "filename", path = 1, color = { fg = "#c4b48a" }, symbols = { modified = "  ●", readonly = "  ", unnamed = "—" } },
          },
          lualine_c = {
            { "branch",      color = { fg = "#4a8080" }, icon = "" },
            { "diff",        colored = false, color = { fg = "#5a4e38" },
              symbols = { added = " +", modified = " ~", removed = " -" } },
          },
          lualine_x = {
            { "diagnostics", sources = { "nvim_lsp" }, colored = false,
              color = { fg = "#5a4e38" },
              symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" } },
          },
          lualine_y = {},
          lualine_z = {
            { "location", color = { fg = "#5a4e38" } },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = { { "filename", color = { fg = "#2a2620" } } },
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },

  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("bufferline").setup({
        options = {
          separator_style = "thin",
          show_buffer_close_icons = false,
          show_close_icon = false,
          indicator = { style = "underline" },
          left_trunc_marker = "←",
          right_trunc_marker = "→",
          diagnostics = "nvim_lsp",
        },
        highlights = {
          fill                = { bg = "#090908" },
          background          = { fg = "#5a4e38", bg = "#090908" },
          tab                 = { fg = "#5a4e38", bg = "#090908" },
          tab_selected        = { fg = "#d8caa8", bg = "#0f0e0c", bold = true },
          buffer_visible      = { fg = "#6b4f22", bg = "#090908" },
          buffer_selected     = { fg = "#d8caa8", bg = "#0f0e0c", bold = true, italic = false },
          indicator_selected  = { fg = "#d4a85a", bg = "#0f0e0c" },
          separator           = { fg = "#131210", bg = "#090908" },
          separator_selected  = { fg = "#131210", bg = "#0f0e0c" },
          modified            = { fg = "#6b4f22", bg = "#090908" },
          modified_selected   = { fg = "#c8934a", bg = "#0f0e0c" },
          diagnostic          = { fg = "#5a4e38", bg = "#090908" },
          diagnostic_selected = { fg = "#d4a85a", bg = "#0f0e0c" },
        },
      })
    end,
  },

  -- Keybind hints
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
      require("which-key").add({
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>l", group = "lsp" },
        { "<leader>s", group = "split" },
        { "<leader>b", group = "buffer" },
        { "<leader>h", group = "harpoon" },
      })
    end,
  },

  -- Load colorscheme on startup
  {
    name = "nighthawks-theme",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("nighthawks")
    end,
  },
}
