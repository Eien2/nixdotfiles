local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "
local set = vim.keymap.set

-- Panes
set("n", "<C-h>", ":wincmd h<cr>")
set("n", "<C-j>", ":wincmd j<cr>")
set("n", "<C-k>", ":wincmd k<cr>")
set("n", "<C-l>", ":wincmd l<cr>")

-- Movement
set("v", "J", ":m '>+1<cr>gv=gv")
set("v", "K", ":m '<-2<cr>gv=gv")

set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("v", "<", "<gv", opts)
set("v", ">", ">gv", opts)

-- Buffers
set("n", "<leader>l", ":bnext<cr>", opts)
set("n", "<leader>h", ":bprevious<cr>", opts)

-- Plugins
set("n", "<leader>e", ":Oil<cr>")

set("n", "<leader>fs", ":Telescope find_files<cr>") 
