-- パーサーのインストール
require("nvim-treesitter").install({
  "vim",
  "lua",
  "javascript",
  "typescript",
  "tsx",
  "json",
  "yaml",
  "toml",
  "html",
  "css",
  "scss",
  "ruby",
  "python",
  "rust",
  "go",
  "gomod",
  "gosum",
  "gowork",
  "bash",
  "dockerfile",
  "gitignore",
  "query",
  "markdown",
  "markdown_inline",
  "terraform",
  "nix",
  "nginx",
})

-- FileType ごとにハイライトを有効化
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- go.mod / go.sum / go.work のパーサーを明示的にマップ
vim.treesitter.language.register("gomod", "gomod")
vim.treesitter.language.register("gosum", "gosum")
vim.treesitter.language.register("gowork", "gowork")

-- autotag
require("nvim-ts-autotag").setup()

-- textobjects
require("nvim-treesitter-textobjects").setup({
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
    },
    selection_modes = {
      ["@parameter.outer"] = "v",
      ["@function.outer"] = "V",
      ["@class.outer"] = "<c-v>",
    },
    include_surrounding_whitespace = true,
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
})
