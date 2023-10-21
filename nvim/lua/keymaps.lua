local mapkey = require("utils.keymapper").mapkey

-- Buffer Navigation
mapkey("<S-TAB>", "BufferLineCyclePrev", "n") -- Prev buffer
mapkey("<TAB>", "BufferLineCycleNext", "n") -- Next buffer

-- Directory Navigatio}n
mapkey("<leader>m", "NvimTreeFocus", "n")
mapkey("<leader>e", "NvimTreeToggle", "n")

-- Window Management
mapkey("<leader>sv", "vsplit", "n") -- Split Vertically
mapkey("<leader>sh", "split", "n") -- Split Horizontally
mapkey("<C-w>z", "WindowsMaximize", "n")
mapkey("<C-w>_", "WindowsMaximizeVertically", "n")
mapkey("<C-w>|", "WindowsMaximizeHorizontally", "n")
mapkey("<C-w>=", "WindowsEqualize", "n")

--[[
-- Indenting
mapkey("<", "v", "<gv") -- Shift Indentation to Left
mapkey(">", "v", ">gv") -- Shift Indentation to Right

-- Show Full File-Path
mapkey("<leader>pa", "echo expand('%:p')", "n") -- Show Full File Path

-- Comments
vim.api.nvim_set_keymap("n", "<C-_>", "gtc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "goc", { noremap = false })
]]--
