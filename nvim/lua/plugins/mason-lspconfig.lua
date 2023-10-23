local opts = {
  ensure_installed = {
    "pyright",
  },
  automatic_installation = true
}

return {
  "williamboman/mason-lspconfig.nvim",
  opts = opts,
  event = "BufReadPre",
  dependencies = "williamboman/mason.nvim",
}
