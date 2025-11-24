vim.o.incsearch = true
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.hlsearch = false

vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smarttab = true

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
vim.o.smoothscroll = true

vim.o.termguicolors = true
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"

vim.o.wrap = false
vim.o.linebreak = true

vim.o.number = true
vim.o.signcolumn = "yes"


vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("hi StatusLine guibg=NONE ctermbg=NONE")
    vim.cmd("hi StatusLineNC guibg=NONE ctermbg=NONE")
  end
})
