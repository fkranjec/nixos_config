return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
        auto_install = true,
        highlight = { 
          enable = true,
          disable = {"latex"},
          additional_vim_regex_highlighting = {"latex", "markdown"}
        },
        indent = { enable = true },
      }

    end,
  }
}
