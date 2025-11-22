return {
  "nvim-mini/mini.completion",
  version = "*",
  dependencies = {
    "nvim-mini/mini.icons",
    "nvim-mini/mini.snippets",
  },
  config = function()
    require("mini.completion").setup()
  end
}
