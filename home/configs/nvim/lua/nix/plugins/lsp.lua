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
      "ts_ls",
      "intelphense",
      "yamlls"
    })

    vim.lsp.config("html", {
      filetypes = { "html", "templ", "php" },
    })


    vim.diagnostic.config({
      virtual_text = true,
    })
  end
}
