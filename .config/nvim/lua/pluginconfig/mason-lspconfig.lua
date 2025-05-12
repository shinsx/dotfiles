require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")

-- mason-lspconfigの設定
-- mason_lspconfig.setup({})
mason_lspconfig.setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "eslint",
  },
})

-- 各LSPサーバーの設定
-- local lspconfig = require("lspconfig")
--
-- -- -- TypeScriptのLSPサーバー設定
-- lspconfig.tsserver.setup{}
--
-- lspconfig.eslint.setup{
--   settings = {
--     ['eslint'] = {
--       diagnostics = {
--         enable = false;
--       }
--     }
--   }
-- }
-- --
-- -- -- LuaのLSPサーバー設定
-- -- lspconfig.lua_ls.setup{}
-- --
-- lspconfig.rust_analyzer.setup{
--   settings = {
--     ['rust-analyzer'] = {
--       diagnostics = {
--         enable = false;
--       }
--     }
--   }
-- }
