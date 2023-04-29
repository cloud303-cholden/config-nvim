local M = {}

M.load = function()
  -- local ok, nord = pcall(require, "nord")
  -- if not ok then
  --   return
  -- end

  local colorscheme = "nord"

  -- nord.setup({
  --   transparent = true,
  -- })
  vim.g.nord_disable_background = true
  vim.g.nord_italic = false

  vim.cmd("colorscheme " .. colorscheme)

  vim.cmd("highlight NavicSeparator guifg=#000000 guibg=#000FDD")
end

return M
