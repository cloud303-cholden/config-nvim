local M = {}

M.load = function()
  local ok, nightfox = pcall(require, "nightfox")
  if not ok then
    return
  end

  local colorscheme = "nordfox"

  nightfox.setup({
    options = {
      transparent = true,
    },
    palettes = {
      nordfox = {
        bg1 = "#363B49",
        bg0 = "#282D38",
      },
    },
  })

  vim.cmd("colorscheme " .. colorscheme)
  vim.cmd("highlight NormalFloat guifg=none guibg=none")
end

return M
