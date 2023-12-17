-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Important
-- Moving Around, Searching and Patterns
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Tags
-- Displaying Text
vim.opt.scrolloff = 3
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 6

-- Syntax, Highlighting and Spelling
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.colorcolumn = 79

-- Multiple Windows
-- Multiple Tab Pages
-- Terminal
-- Using the Mouse
-- Messages and Info
-- Selecting Text
-- Editing Text
-- Tabs and Indenting
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Folding
-- Diff Mode
-- Mapping
-- Reading and Writing Files
vim.opt.backup = false

-- The Swap File
vim.opt.swapfile = false

-- Command Line Editing
vim.opt.cmdheight = 2

-- Executing External Commands
-- Running Make and Jumping to Errors (Quickfix)
-- Language Specific
-- Multi-byte Characters
-- Various
vim.opt.signcolumn = "yes"
