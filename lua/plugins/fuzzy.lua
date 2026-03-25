return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf = require("fzf-lua")
      fzf.setup({ "telescope" }) -- telescope-like layout

      local map = vim.keymap.set

      -- Find files
      map("n", "<leader>ff", fzf.files, { desc = "Find files" })

      -- Live grep (the one you wanted — search a word across the whole project)
      map("n", "<leader>fg", fzf.live_grep, { desc = "Live grep (search project)" })

      -- Search word under cursor in project
      map("n", "<leader>fw", fzf.grep_cword, { desc = "Search word under cursor" })

      -- Recent files
      map("n", "<leader>fr", fzf.oldfiles, { desc = "Recent files" })

      -- Open buffers
      map("n", "<leader>fb", fzf.buffers, { desc = "Find buffer" })

      -- LSP references / symbols
      map("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "Document symbols" })
      map("n", "<leader>fS", fzf.lsp_workspace_symbols, { desc = "Workspace symbols" })
    end,
  },
}
