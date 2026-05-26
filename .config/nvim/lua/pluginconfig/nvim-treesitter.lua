-- パーサーのインストール（新 API: main ブランチ対応）
require('nvim-treesitter').setup {
   auto_install = true, -- trueにすると未インストールの言語を開いた時に自動インストールされます
   ensure_installed = {
      "vim", "lua", "javascript", "typescript", "tsx", "json", "yaml", "toml",
      "html", "css", "scss", "ruby", "python", "rust", "go", "gomod", "gosum",
      "gowork", "bash", "dockerfile", "gitignore", "query", "markdown",
      "markdown_inline", "terraform", "nix", "nginx", "apache",
      "proto", "sql", "regex", "helm",
   },
}

-- FileType ごとにハイライトを有効化
vim.api.nvim_create_autocmd("FileType", {
   callback = function()
      pcall(vim.treesitter.start)
   end,
})
vim.filetype.add({
  filename = {
    ["fluent-bit.conf"] = "dosini",
  },
  extension = {
    conf = "apache",
  },
})

-- go.mod / go.sum / go.work のパーサーを明示的にマップ
vim.treesitter.language.register("gomod", "gomod")
vim.treesitter.language.register("gosum", "gosum")
vim.treesitter.language.register("gowork", "gowork")

-- autotag
require("nvim-ts-autotag").setup()
