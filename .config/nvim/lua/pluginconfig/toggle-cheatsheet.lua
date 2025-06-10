local tcs = require('toggle-cheatsheet').setup(true)

-- make your own cheat sheet
local cs1 = tcs.createCheatSheetFromSubmodeKeymap(
  tcs.conf{
    {"Ctrl + o","カーソル位置 戻る"},
    {"Ctrl + i","カーソル位置 進む"},
    {"Ctrl + j","zellij Scroll"},
    {"e","zellij Scrollから編集モード"},
    {"gd","定義ジャンプ"},
    {"gh","型チェック"},
    {"go","linterのフロート"},
    {"ga","自動import"},
  }
)

-- define another cheat sheet
-- local cs2 = tcs.createCheatSheetFromSubmodeKeymap(
--   tcs.conf{
--     {"Ctrl + f", "Scroll forward one full screen."},
--     {"Ctrl + b", "Scroll backward one full screen."},
--     {"Ctrl + d", "Scroll down half a screen."},
--     {"Ctrl + u", "Scroll up half a screen."},
--     {"Ctrl + g", "Show the current file name and line number."}
--   }
-- )

-- assign your favorite keymap to toggle cheat sheet windows
vim.keymap.set("n","<Leader>m",function()
  tcs.toggle(cs1)
end)
-- vim.keymap.set("n","<Leader>M",function()
--   tcs.toggle(cs2)
-- end)
