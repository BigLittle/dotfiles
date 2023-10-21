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
  end
}
