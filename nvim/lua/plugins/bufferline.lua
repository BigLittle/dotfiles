return {
  "akinsho/bufferline.nvim",
  version = "v3.*",
  config = function()
    require("bufferline").setup {
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = "|"
          }
        },
        separator_style = "slant"
      }
    }
    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")
  end
}
