return {
  {
    "folke/which-key.nvim",
    optional = true,
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>r", group = "run" },
      })
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    optional = true,
    keys = {
      {
        "<leader>rr",
        function()
          vim.cmd("w")
          local file = vim.fn.expand("%:p")
          vim.cmd(
            string.format(
              "TermExec cmd='cr %q' direction=horizontal size=15 go_back=0",
              file
            )
          )
        end,
        desc = "Run current file",
      },
      {
        "<leader>rd",
        function()
          vim.cmd("w")
          local file = vim.fn.expand("%:p")
          vim.cmd(
            string.format(
              "TermExec cmd='cr %q -d' direction=horizontal size=15 go_back=0",
              file
            )
          )
        end,
        desc = "Run (debug: sanitizers + bounds checks)",
      },
    },
  },
}
