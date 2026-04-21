return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "python", "javascript", "typescript", "tsx",
          "go", "rust", "c", "cpp", "cuda", "bash", "json", "yaml",
          "html", "css", "markdown", "markdown_inline", "vim", "vimdoc",
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next     = { ["<leader>sn"] = "@parameter.inner" },
            swap_previous = { ["<leader>sp"] = "@parameter.inner" },
          },
        },
      })
    end,
  },
}
