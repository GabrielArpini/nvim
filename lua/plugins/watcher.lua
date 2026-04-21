return {
  {
    dir = "/home/arpola/Documents/nvim-watcher",
    name = "nvim-watcher",
    event = "VeryLazy",
    opts = {
      idle_ms = 3000,
      memory_scope = "local",
      keymap_prefix = "<leader>w",
      model = {
        enabled = true,
        provider = "ollama",
        name = "qwen2.5:0.5b",
        url = "http://localhost:11434",
        timeout_ms = 20000,
        max_context_chars = 2000,
      },
    },
    config = function(_, opts)
      require("nvim-watcher").setup(opts)
    end,
  },
}
