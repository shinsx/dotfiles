local M = {}

function M.get_relative_file_path()
  local absolute_file_path = vim.api.nvim_buf_get_name(0)
  local git_path = vim.fn.system("git rev-parse --show-toplevel")

  local relative_file_path = string.sub(absolute_file_path, git_path:len() + 1)
  vim.fn.setreg('+', relative_file_path)
  -- vimのレジスタのみにコピーする時に使用
  -- local copy_command = "echo " .. "\"" .. relative_file_path .. "\"" .. " | pbcopy"
  -- vim.fn.system(copy_command)
  return true
end

function M.get_file_name()
  local file_name = vim.fn.expand('%:t')
  vim.fn.setreg('+', file_name)
  -- vimのレジスタのみにコピーする時に使用
  -- local copy_command = 'echo "' .. file_name .. '" | pbcopy'
  -- vim.fn.system(copy_command)
  return true
end

-- LSPの再起動とファイルの再読み込みを同時に実行
function M.restart_lsp_and_reload()
  vim.cmd('LspRestart')
  vim.cmd('e!')
  print("LSP restarted and buffer reloaded")
  return true
end

return M
