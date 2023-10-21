return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup {
      options = {
        theme = "vscode"
      },
      extensions = {
        "nvim-tree"
      }
    }
  end
}
