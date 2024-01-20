return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require("bufferline")
    vim.keymap.set('n', "<TAB>", function() bufferline.cycle(1) end, { desc = "BufferLine Cycle Next" })
    vim.keymap.set('n', "<S-TAB>", function() bufferline.cycle(-1) end, { desc = "BufferLine Cycle Prev" })
    bufferline.setup({
      options = {
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            separator = "|"
          }
        },
        diagnostics = "nvim_lsp",
        separator_style = "slant",
      }
    })
  end
}
