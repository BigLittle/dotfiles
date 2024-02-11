return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            on_open = function(term)
                vim.defer_fn(function()
                    vim.wo[term.window].winbar = ""
                end, 0)
            end,
        })
        local opts = { noremap = true }
        vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
        --      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        --      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        --      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        --      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        --      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end,
}
