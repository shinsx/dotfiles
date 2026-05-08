-- パーサーのインストール
require('nvim-treesitter.configs').setup {
   modules = {},
   sync_install = false,
   auto_install = true, -- trueにすると未インストールの言語を開いた時に自動インストールされます
   ignore_install = {},
   -- パーサーのインストール設定
   ensure_installed = {
      "vim", "lua", "javascript", "typescript", "tsx", "json", "yaml", "toml",
      "html", "css", "scss", "ruby", "python", "rust", "go", "gomod", "gosum",
      "gowork", "bash", "dockerfile", "gitignore", "query", "markdown",
      "markdown_inline", "terraform", "nix", "nginx", "apache",
      "proto", "sql", "regex", "helm",
   },

   -- 同時にハイライトもここで有効化するのが一般的です
   highlight = {
      enable = true,
   },

   -- textobjects の設定も setup 関数の中に含めるのが推奨される構成です
   textobjects = {
      select = {
         enable = true,
         lookahead = true,
         keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
         },
         -- ...（以下、元の textobjects 設定をここに統合できます）
      },
      swap = {
         enable = true,
         swap_next = {
            ["<leader>a"] = "@parameter.inner",
         },
         swap_previous = {
            ["<leader>A"] = "@parameter.inner",
         },
      },
      move = {
         enable = true,
         set_jumps = true,
         goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
         },
         goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
         },
         goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
         },
         goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
         },
      },
      lsp_interop = {
         enable = true,
         border = "none",
         floating_preview_opts = {},
         peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
         },
      },
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
