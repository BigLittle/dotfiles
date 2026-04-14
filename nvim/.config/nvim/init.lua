--[[ Options ]] --
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
-- vim.opt.colorcolumn = { 81 }

-- Multiple Windows
vim.opt.splitbelow = true
vim.opt.splitright = true
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
vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.fillchars = [[eob: ,fold: ,foldopen:▽,foldsep: ,foldclose:▶]]
-- Diff Mode
-- Mapping
-- Reading and Writing Files
vim.opt.backup = false

-- The Swap File
vim.opt.swapfile = false

-- Command Line Editing
vim.opt.cmdheight = 1

-- Executing External Commands
-- Running Make and Jumping to Errors (Quickfix)
-- Language Specific
-- Multi-byte Characters
-- Various
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"

-- [[ Plugins ]]--
-- Common dependencies
vim.pack.add {
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
}

-- Appearance
vim.pack.add {
    "https://github.com/romgrk/barbar.nvim",
    "https://github.com/luukvbaal/statuscol.nvim",
    "https://github.com/dstein64/nvim-scrollview",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
}
require("barbar").setup()
require("statuscol").setup({
    relculright = true,
    segments = {
        { text = { "%s" }, click = "v:lua.ScSa" },
        { text = { require("statuscol.builtin").lnumfunc, " " }, click = "v:lua.ScLa" },
        { text = { require("statuscol.builtin").foldfunc, " " }, click = "v:lua.ScFa" },
    },
})
require("lualine").setup()

-- QoL collections
vim.pack.add {
    "https://github.com/sitiom/nvim-numbertoggle",
    "https://github.com/karb94/neoscroll.nvim",
    "https://github.com/m4xshen/smartcolumn.nvim",
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/christoomey/vim-tmux-navigator",
    "https://github.com/mikavilpas/yazi.nvim",
    "https://github.com/nvim-mini/mini.nvim",
}
require("neoscroll").setup()
require("smartcolumn").setup()
require("ibl").setup()
require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.trailspace").setup()

-- Autocompletion
vim.pack.add {
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/saghen/blink.cmp",
}
require("blink.cmp").setup()

-- LSP
vim.pack.add {
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/linrongbin16/lsp-progress.nvim",
    "https://github.com/rachartier/tiny-inline-diagnostic.nvim",
}
require("lsp-progress").setup()
require("tiny-inline-diagnostic").setup()
vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})
vim.lsp.enable({ "lua_ls" })

-- Colorscheme & Syntax Highlighting
vim.pack.add {
    "https://github.com/catgoose/nvim-colorizer.lua",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
}
require("colorizer").setup()
require("catppuccin").setup({
    transparent_background = true,
})
vim.cmd.colorscheme("catppuccin-nvim")
require("lualine").setup {
    options = {
        theme = "catppuccin-nvim",
        component_separators = '',
        section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { 'filename', 'branch' },
        lualine_c = {
            function()
                -- invoke `progress` here.
                return require('lsp-progress').progress()
            end,
        },
        lualine_x = {},
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}

-- listen lsp-progress event and refresh lualine
vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
    group = "lualine_augroup",
    pattern = "LspProgressStatusUpdated",
    callback = require("lualine").refresh,
})

-- Copilot
vim.pack.add({ "https://github.com/github/copilot.vim" })


-- [[ Autocmds ]] --
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, path, kind = ev.data.spec.name, ev.data.path, ev.data.kind
        if name == "blink.cmp" and kind == "update" then
            vim.notify('Building blink.cmp', vim.log.levels.INFO)
            local obj = vim.system({ 'cargo', 'build', '--release' }, { cwd = path }):wait()
            if obj.code == 0 then
                vim.notify('Building blink.cmp done', vim.log.levels.INFO)
            else
                vim.notify('Building blink.cmp failed', vim.log.levels.ERROR)
            end
        end
        if name == "nvim-treesitter" and kind == "update" then
            if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
            vim.cmd('TSUpdate')
        end
    end
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
        vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.cmd("lua MiniTrailspace.trim()")
        vim.cmd("lua MiniTrailspace.trim_last_lines()")
    end,
})


-- [[ Keymaps ]] --
vim.keymap.set("n", "n", "nzz", { noremap = true, silent = true, desc = "Search next and center" })
vim.keymap.set("n", "N", "Nzz", { noremap = true, silent = true, desc = "Search previous and center" })

vim.keymap.set({ "n", "i" }, "<F1>", "<Esc><cmd>Yazi toggle<CR>", { desc = "Resume last yazi session" })
vim.keymap.set({ "n", "i" }, "<F2>", "<Esc><cmd>w<CR>", { desc = "Save file" })
vim.keymap.set({ "n", "i" }, "<F3>", "<Esc><cmd>lua vim.lsp.buf.format()<CR>", { desc = "LSP format" })

vim.keymap.set({ "n", "i" }, "<F9>", "<Esc><cmd>BufferClose<CR>", { desc = "Delete buffer" })
vim.keymap.set({ "n", "i" }, "<A-,>", "<Esc><cmd>BufferPrevious<CR>", { desc = "Move to previous buffer" })
vim.keymap.set({ "n", "i" }, "<A-.>", "<Esc><cmd>BufferNext<CR>", { desc = "Move to next buffer" })
vim.keymap.set({ "n", "i" }, "<A-<>", "<Esc><cmd>BufferMovePrevious<CR>", { desc = "Re-order to previous buffer" })
vim.keymap.set({ "n", "i" }, "<A->>", "<Esc><cmd>BufferMoveNext<CR>", { desc = "Re-order to next buffer" })
