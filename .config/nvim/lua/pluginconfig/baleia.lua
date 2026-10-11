-- zellijのEditScrollback(ansi true)でダンプしたバッファ等、
-- ANSIエスケープシーケンスを含むテキストに実際の色を付けて表示する
vim.g.baleia = require("baleia").setup({})

vim.api.nvim_create_user_command("BaleiaColorize", function()
   vim.g.baleia.once(vim.api.nvim_get_current_buf())
end, { bang = true })

-- zellijのscrollback dumpファイル(<uuid>.dump)を開いたら自動で色付け
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
   pattern = "*.dump",
   callback = function(args)
      vim.g.baleia.once(args.buf)
   end,
})
