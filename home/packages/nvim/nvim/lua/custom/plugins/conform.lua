return {
  {
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        typescript = { 'prettierd' },
        html = { 'prettierd' },
        css = { 'prettierd' },
        nix = { 'nixpkgs-fmt' },
        erlang = { 'erlang-ls' }
      },
    },
  }
}
