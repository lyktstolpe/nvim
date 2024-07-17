-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          repo = {
            list = {
              fd_opts = {
                '--no-ignore-vcs',
              },
              search_dirs = {
                '~/dev',
              },
            },
            previewer = false,
          },
        },

        defaults = {
          winblend = 10,
          prompt_prefix = '  ',
          selection_caret = ' ',
          path_display = { 'smart' },
          results_title = false,
          previewer = false,

          sorting_strategy = 'ascending',
          layout_strategy = 'horizontal',
          layout_config = {
            prompt_position = 'top',
            preview_width = 0.55,
          },
        },

        pickers = {
          find_files = {
            previewer = true,
          },
          diagnostics = {
            previewer = true,
          },
          live_grep = {
            previewer = true,
          },
          symbols = {
            previewer = true,
          },
          grep_string = {
            previewer = true,
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'project')
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
