return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    local api = require("nvim-tree.api")
    vim.keymap.set("n", '<leader>m', api.tree.open, { desc = "NvimTree Focus" })
    vim.keymap.set("n", '<leader>e', api.tree.toggle, { desc = "NvimTree Toggle" })
    --vim.keymap.set("n", '<leader>m', ":NvimTreeFocus<CR>", {})
    --vim.keymap.set("n", '<leader>e', ":NvimTreeToggle<CR>", {})
    require("nvim-tree").setup()
  end
}
