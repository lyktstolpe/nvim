--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Setting options
require 'options'

-- Install `lazy.nvim` plugin manager
require 'lazy-bootstrap'

-- Configure and install plugins
require 'lazy-plugins'

-- Basic Keymaps
require 'keymaps'
