require('custom/keymaps')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end 
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  'tpope/vim-sleuth',

  require 'custom.plugins.comment',

  require 'custom.plugins.gitsigns',
   
  require 'custom.plugins.whichkey',

  require 'custom.plugins.telescope',

  require 'custom.plugins.lsp',

  require 'custom.plugins.typescript',

  require 'custom.plugins.conform',
  
  require 'custom.plugins.nvim-cmp',

  require 'custom.plugins.colorscheme',

  require 'custom.plugins.todo-comments',

  require 'custom.plugins.mini',

  require 'custom.plugins.vimtex',

  require 'custom.plugins.treesitter',
   
  -- require 'kickstart.plugins.debug',

  require 'kickstart.plugins.indent_line',

  
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
