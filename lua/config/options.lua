vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.mouse = "a"

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.scrolloff = 8

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- spaces instead of tabs
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true -- case-sensitive if you use uppercase
opt.hlsearch = false -- don't keep search highlighted after done
opt.incsearch = true -- highlight as you type

opt.signcolumn = "yes"
opt.wrap = false

opt.splitright = true
opt.splitbelow = true

opt.clipboard = "unnamedplus"
