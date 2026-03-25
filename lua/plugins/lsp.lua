return {
  { "williamboman/mason.nvim", config = true },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "ts_ls", "gopls" },
        automatic_installation = true,
      })

      -- Keymaps applied whenever any LSP attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = desc })
          end
          map("gd",         vim.lsp.buf.definition,                              "Go to definition")
          map("gD",         vim.lsp.buf.declaration,                             "Go to declaration")
          map("gr",         vim.lsp.buf.references,                              "Go to references")
          map("gi",         vim.lsp.buf.implementation,                          "Go to implementation")
          map("K",          vim.lsp.buf.hover,                                   "Hover docs")
          map("<leader>lr", vim.lsp.buf.rename,                                  "Rename symbol")
          map("<leader>la", vim.lsp.buf.code_action,                             "Code action")
          map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format file")
          map("<leader>ld", vim.diagnostic.open_float,                           "Show diagnostic")
          map("[d",         vim.diagnostic.goto_prev,                            "Previous diagnostic")
          map("]d",         vim.diagnostic.goto_next,                            "Next diagnostic")
        end,
      })

      -- Per-server config overrides (new vim.lsp.config API)
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      -- Enable servers (mason-lspconfig + nvim-lspconfig provide the cmd/filetypes)
      vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "gopls" })
    end,
  },
}
