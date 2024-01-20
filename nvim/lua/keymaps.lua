local mapkey = require("utils.keymapper").mapkey

-- Window Management
mapkey("<C-w>z", "WindowsMaximize", "n")
mapkey("<C-w>_", "WindowsMaximizeVertically", "n")
mapkey("<C-w>|", "WindowsMaximizeHorizontally", "n")

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
