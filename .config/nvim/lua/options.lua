vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.expandtab = true
vim.opt.shiftwidth = 3
vim.opt.tabstop = 4
vim.opt.mouse = "a"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.autoread = true
vim.opt.termguicolors = true

-- 画面分割時に新しいウィンドウを右側と下側に作成
vim.opt.splitright = true
vim.opt.splitbelow = true

---indent-blankline
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

vim.opt.shortmess = "filnxtToOFWIcC"

-- バックアップファイルを作らない
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- vim.opt.lazyredraw = true -- マクロの再生時に画面の再描画を遅らせる
-- vim.opt.gccons = 1000 -- ガベージコレクションを頻繁に行う
vim.opt.updatetime = 200 -- CursorHold イベントが早く発生し、プラグインの応答性が向上
vim.opt.autoread = true -- ファイルが変更されたら自動で読み込む
vim.opt.autoindent = true -- インデントを自動で行う

-- Linterの表示
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
})
