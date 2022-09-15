local colorscheme = "nord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
vim.cmd[[highlight FocusedSymbol gui=bold guifg=#333b49 guibg=#616e88]]
