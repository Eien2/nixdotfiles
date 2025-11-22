return {
  "stevearc/oil.nvim",
  opts = {
    keymaps = {
      ["'"] = { "actions.parent", mode = "n" }
    }
  },
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
}
