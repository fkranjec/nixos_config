return {
  {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_compiler_latexmk = {
        options = {
          '-shell-escape',
          '-interaction=nonstopmode',
          '-synctex=1',
        },
        callback = 1,
        continuous = 1,
        executable= 'latexmk',
        hooks = {},
        latemk_use_lualatex = 1,
      }
      vim.g.vimtex_compiler_latexmk_engines = {
        _ = '-lualatex',
      }
      vim.g.tex_flavor = 'latex'
    end
  }
}
