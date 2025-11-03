-- colors/rezescheme.lua
local colors = {
	bg = "#1d1548",
	fg = "#c0b0bd",
	accent = "#553c92",
	string = "#8c5d88",
	number = "#ffaa88",
}

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "rezescheme"

local set_hl = vim.api.nvim_set_hl

-- Editor UI
set_hl(0, "Normal", { fg = colors.fg, bg = colors.bg })
set_hl(0, "Visual", { bg = colors.accent })
set_hl(0, "CursorLine", { bg = "#2a1d66" })
set_hl(0, "LineNr", { fg = "#665f8a" })
set_hl(0, "CursorLineNr", { fg = colors.number, bold = true })
set_hl(0, "StatusLine", { fg = colors.fg, bg = "#2a1d66" })
set_hl(0, "VertSplit", { fg = "#2a1d66" })

-- Syntax groups
set_hl(0, "Comment", { fg = "#665f8a", italic = true })
set_hl(0, "Keyword", { fg = colors.accent, bold = true })
set_hl(0, "Function", { fg = colors.string })
set_hl(0, "String", { fg = colors.string })
set_hl(0, "Number", { fg = colors.number })
set_hl(0, "Constant", { fg = colors.number })
set_hl(0, "Type", { fg = colors.accent })
set_hl(0, "Identifier", { fg = colors.fg })
set_hl(0, "Statement", { fg = colors.accent })
set_hl(0, "PreProc", { fg = colors.number })
set_hl(0, "Special", { fg = colors.string })

-- Diagnostics
set_hl(0, "DiagnosticError", { fg = "#ff6a6a" })
set_hl(0, "DiagnosticWarn", { fg = "#ffaa88" })
set_hl(0, "DiagnosticInfo", { fg = "#8c5d88" })
set_hl(0, "DiagnosticHint", { fg = "#c0b0bd" })

-- Treesitter highlight groups (if you use it)
set_hl(0, "@keyword", { link = "Keyword" })
set_hl(0, "@function", { link = "Function" })
set_hl(0, "@string", { link = "String" })
set_hl(0, "@number", { link = "Number" })
set_hl(0, "@type", { link = "Type" })
set_hl(0, "@constant", { link = "Constant" })
set_hl(0, "@variable", { link = "Identifier" })
