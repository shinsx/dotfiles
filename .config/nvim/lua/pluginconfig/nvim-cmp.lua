local cmp = require('cmp')
local lspkind = require('lspkind')
local luasnip = require('luasnip')
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol",
      max_width = 50,
      symbol_map = { Copilot = "" }
    })
  },

  enabled = true,
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs( -4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-q>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm(),
  }),
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  formatting = {
    fields = { 'abbr', 'kind', 'menu' },
    format = lspkind.cmp_format({
      mode = 'text',
    }),
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "cmdline" },
    { name = "git" },
    { name = "cmp_tabnine" },
    { name = "spell" },
    { name = "nvim_lsp_signature_help" },
  }),
}
