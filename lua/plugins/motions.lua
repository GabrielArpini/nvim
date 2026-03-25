return {
  -- Flash: jump anywhere on screen with 2 keystrokes
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    config = function()
      require("flash").setup()
    end,
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter select" },
    },
  },

  -- Harpoon v2: pin up to 4 files, jump instantly
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      local map = vim.keymap.set

      map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add file" })
      map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

      -- Jump to pinned file 1-4
      map("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
      map("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
      map("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
      map("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
    end,
  },

  -- Mini: surround, pairs, comments, and more — all in one
  {
    "echasnovski/mini.nvim",
    config = function()
      require("mini.surround").setup()
      require("mini.pairs").setup()
      require("mini.comment").setup()
      require("mini.files").setup()
      vim.keymap.set("n", "<leader>e", function() require("mini.files").open() end, { desc = "File explorer" })

      local starter = require("mini.starter")
      starter.setup({
        header = function()
          local hour = tonumber(vim.fn.strftime("%H"))
          local greeting
          if     hour <  6 then greeting = "still up."
          elseif hour < 12 then greeting = "morning."
          elseif hour < 18 then greeting = "afternoon."
          else                   greeting = "evening."
          end
          return "nvim\n\n" .. greeting
        end,
        items = {
          starter.sections.recent_files(7, true),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet("  › ", false),
          starter.gen_hook.aligning("center", "center"),
        },
        footer = "",
      })

      vim.api.nvim_set_hl(0, "MiniStarterHeader",  { fg = "#d4a85a", bold = true })
      vim.api.nvim_set_hl(0, "MiniStarterItem",    { fg = "#5a4e38" })
      vim.api.nvim_set_hl(0, "MiniStarterCurrent", { fg = "#c4b48a" })
      vim.api.nvim_set_hl(0, "MiniStarterBullet",  { fg = "#2a2620" })
      vim.api.nvim_set_hl(0, "MiniStarterSection", { fg = "#1e4040" })
      vim.api.nvim_set_hl(0, "MiniStarterFooter",  { fg = "#1e1a12" })
      vim.api.nvim_set_hl(0, "MiniStarterQuery",   { fg = "#d4a85a" })
    end,
  },
}
