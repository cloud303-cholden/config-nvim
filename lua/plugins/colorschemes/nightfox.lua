local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
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
