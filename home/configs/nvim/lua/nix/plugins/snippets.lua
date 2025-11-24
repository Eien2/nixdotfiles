return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
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
