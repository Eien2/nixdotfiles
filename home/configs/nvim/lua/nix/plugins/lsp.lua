return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable({
      "lua_ls",
      "nixd",
      "pyright",
      "bashls",
      "jsonls",
      "html",
      "cssls",
      "ts_ls"
    })

    vim.diagnostic.config({
      virtual_text = true,
    })
  end
}
