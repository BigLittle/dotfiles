return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      indent = { enable = true },
      autotag = { enable = true },
      event = {
        "BufReadPre",
        "BufNewFile",
      },
      ensure_installed = {
        "markdown",
        "yaml",
        "css",
        "bash",
        "lua",
        "gitignore",
        "python"
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-s>",
          node_incremental = "<C-s>",
          scope_incremental = false,
          node_decremental = "<BS>",
        }
      }
    })
  end
}
