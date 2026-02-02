local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  hidden = true
})
function _lazygit_toggle()
  lazygit:toggle()
end

local tftui = Terminal:new({
  cmd = "tftui",
  direction = "float",
  hidden = true
})

function _tftui_toggle()
  tftui:toggle()
end

vim.api.nvim_set_keymap("n", "<space>lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>tui", "<cmd>lua _tftui_toggle()<CR>", { noremap = true })
