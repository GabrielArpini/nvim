return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {
      heading = {
        icons = { "▊ ", "▋ ", "▌ ", "▍ ", "▎ ", "▏ " },
        backgrounds = { "NONE", "NONE", "NONE", "NONE", "NONE", "NONE" },
        foregrounds = {
          "RenderMarkdownH1",
          "RenderMarkdownH2",
          "RenderMarkdownH3",
          "RenderMarkdownH4",
          "RenderMarkdownH5",
          "RenderMarkdownH6",
        },
      },
      code = {
        style = "full",
        border = "thin",
        highlight = "RenderMarkdownCode",
        highlight_inline = "RenderMarkdownCodeInline",
      },
      bullet = {
        icons = { "●", "○", "◆", "◇" },
        highlight = "RenderMarkdownBullet",
      },
      dash = { highlight = "RenderMarkdownDash" },
      quote = { highlight = "RenderMarkdownQuote" },
      checkbox = {
        unchecked = { icon = "□", highlight = "RenderMarkdownUnchecked" },
        checked   = { icon = "■", highlight = "RenderMarkdownChecked" },
      },
      link = {
        hyperlink = "🔗",
        highlight = "RenderMarkdownLink",
      },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)

      -- Heading levels
      vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#d4a85a", bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#6aadad", bold = true })
      vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#c8934a" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#4a8080" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#b0a080" })
      vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#5a4e38" })

      -- Nighthawks palette highlights
      vim.api.nvim_set_hl(0, "RenderMarkdownCode",         { bg = "#131210" })
      vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline",   { fg = "#d4a85a", bg = "#1e1a12" })
      vim.api.nvim_set_hl(0, "RenderMarkdownBullet",       { fg = "#4a8080" })
      vim.api.nvim_set_hl(0, "RenderMarkdownDash",         { fg = "#2a2620" })
      vim.api.nvim_set_hl(0, "RenderMarkdownQuote",        { fg = "#5a4e38" })
      vim.api.nvim_set_hl(0, "RenderMarkdownUnchecked",    { fg = "#5a4e38" })
      vim.api.nvim_set_hl(0, "RenderMarkdownChecked",      { fg = "#4a8080" })
      vim.api.nvim_set_hl(0, "RenderMarkdownLink",         { fg = "#6aadad" })
    end,
  },
}
