local on_attach = require("utils.lsp").on_attach
local diagnostic_signs = require("utils.lsp").diagnostic_signs

return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "windwp/nvim-autopairs",
    "williamboman/mason.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "LSP Code Action" })
      end,
    })
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()
    local lspconfig = require("lspconfig")

    -- lua
    lspconfig.lua_ls.setup({})

    -- python
    lspconfig.pyright.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        pyright = {
          disableOrganizeImports = false,
          analysis = {
            useLibraryCodeForTypes = true,
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            autoImportCompletions = true
          }
        }
      }
    })

    for type, icon in pairs(diagnostic_signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

  end,
}
