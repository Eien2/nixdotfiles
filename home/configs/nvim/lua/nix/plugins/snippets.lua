return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    ft_func = function (filetype)
      local ft = { filetype }

      if filetype == "php"  then
        table.insert(ft, "html")
      end

      return ft
    end,
  },
}
