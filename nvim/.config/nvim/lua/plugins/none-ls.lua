return {
    "nvimtools/none-ls.nvim",
    config = function()
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "LSP Formatting" })
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                -- null_ls.builtins.formatting.ruff,
            },
        })
    end,
}
