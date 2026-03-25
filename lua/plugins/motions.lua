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
      require("mini.surround").setup()   -- sa/sd/sr to add/delete/replace surrounds
      require("mini.pairs").setup()      -- auto-close brackets/quotes
      require("mini.comment").setup()    -- gcc to comment line, gc in visual
      require("mini.files").setup()

      vim.keymap.set("n", "<leader>e", function() require("mini.files").open() end, { desc = "File explorer" })
    end,
  },
}
