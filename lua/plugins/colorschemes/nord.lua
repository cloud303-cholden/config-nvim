local M = {}

M.load = function()

  local colorscheme = "nord"

  vim.g.nord_disable_background = true
  vim.g.nord_italic = false

  vim.cmd("colorscheme " .. colorscheme)

  vim.cmd("highlight NavicSeparator guifg=#000000 guibg=#000FDD")
  vim.cmd("highlight LineNr guifg=#3a4251")
  vim.cmd("highlight CursorLineNr guifg=#A3BE8C cterm=italic,bold gui=italic,bold")
end

return M
