local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.cursorline = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

opt.updatetime = 300

opt.ignorecase = true
opt.smartcase = true

opt.list = true
opt.listchars = {
    tab = '» ',
    trail = '·',
    nbsp = '␣',
    extends = '»',
    precedes = '«',
}
opt.termguicolors = true

vim.cmd("syntax on")

vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

