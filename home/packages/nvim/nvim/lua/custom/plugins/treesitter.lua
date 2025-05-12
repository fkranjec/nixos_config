return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
        auto_install = false,
        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false;
        },
        indent = { enable = true },
      }

    end,
  }
}
