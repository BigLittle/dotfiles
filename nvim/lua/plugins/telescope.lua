return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Telescope keymaps' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      local telescope = require("telescope")
      telescope.setup({
  --      defaults = {
  --        mappings = {
  --          i = {
  --            ["<C-j>"] = "move_selection_next",
  --            ["<C-k>"] = "move_selection_previous",
  --          },
  --        },
  --      },
  --      pickers = {
  --        find_files = {
  --          theme = "dropdown",
  --          previewer = false,
  --          hidden = true,
  --        },
  --        live_grep = {
  --          theme = "dropdown",
  --          previewer = false,
  --        },
  --        buffers = {
  --          theme = "dropdown",
  --          previewer = false,
  --        },
  --      },
      })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = { require("telescope.themes").get_dropdown() }
        },
      })
      require("telescope").load_extension("ui-select")
    end
  },
}
