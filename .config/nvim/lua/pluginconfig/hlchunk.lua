local default_conf = {
  priority = 10,
  style = { vim.api.nvim_get_hl(0, { name = "Whitespace" }) },
  use_treesitter = true,
  chars = { "│" },
  ahead_lines = 5,
  delay = 100,
}

require("hlchunk").setup{
  chunk = {
    enable = false,
  },
  indent = {
    enable = true,
  },
  line_num = {
    enable = false
  },
  blank = {
    enable = true,
    chars = { " " },
    style = {
      { bg = "#434437" },
      { bg = "#2f4440" },
      { bg = "#433054" },
      { bg = "#284251" },
    },
  },
}
