return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup {
    }
    vim.keymap.set("n", "<F1>", ":NvimTreeToggle<cr>")
    vim.keymap.set("i", "<F1>", "<ESC>:NvimTreeToggle<cr>")
  end
}
