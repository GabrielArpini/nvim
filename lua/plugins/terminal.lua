return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.4)
          end
        end,
        open_mapping = [[<C-\>]],
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = false,
      })

      -- Keymaps that only apply inside a terminal buffer:
      --   <Esc><Esc> → leave terminal-insert mode (go to normal mode)
      --   <C-h/j/k/l> → jump to adjacent split, even from insert mode
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function(args)
          local opts = { buffer = args.buf, silent = true }
          vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], opts)
          vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
          vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
          vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
          vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        end,
      })
    end,
  },
}
