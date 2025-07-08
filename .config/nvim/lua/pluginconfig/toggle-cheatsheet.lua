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
    {"Space + i","呼び出し元検索 Telescope"},
  }
)

-- define another cheat sheet
-- local cs2 = tcs.createCheatSheetFromSubmodeKeymap(
--   tcs.conf{
--     {"メモ"},
--     {"メモa"}
--   }
-- )

-- assign your favorite keymap to toggle cheat sheet windows
vim.keymap.set("n","<Leader>m",function()
  tcs.toggle(cs1)
end)
-- vim.keymap.set("n","<Leader>M",function()
--   tcs.toggle(cs2)
-- end)
