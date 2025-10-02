-- NOTE: https://github.com/jay-babu/mason-null-ls.nvim/blob/main/lua/mason-null-ls/mappings/filetype.lua
require('mason-null-ls').setup({
  ensure_installed = { 'golangci_lint', 'gofmt', 'gopls', 'tsp-server' },
})

local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

null_ls.setup({
  sources = {
    -- Ruby rubocop
    -- NOTE: https://github.com/nvimtools/none-ls.nvim/blob/main/lua/null-ls/builtins/diagnostics/rubocop.lua
    null_ls.builtins.diagnostics.rubocop.with({
      command = "bundle",
      args = { "exec", "rubocop", "-f", "json", "--force-exclusion", "--stdin", "$FILENAME" },
    }),
    -- null_ls.builtins.formatting.rubocop,
    -- Go golangci_lint
    null_ls.builtins.diagnostics.golangci_lint,
    null_ls.builtins.formatting.gofmt,
    -- Dockerfile
    null_ls.builtins.diagnostics.hadolint
  },
  debug = false,
})

vim.keymap.set('n', '<leader>p', function() vim.lsp.buf.format { async = true } end)
