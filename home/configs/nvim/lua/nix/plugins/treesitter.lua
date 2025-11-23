return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    additional_vim_regex_highlighting = false,
    highlight = {
      enable = true,
    },
    indent = {
      enable = true;
    },
    ensure_installed = { "lua", "vim" },
    auto_install = true,
    ignore_install = {},
  }
}
