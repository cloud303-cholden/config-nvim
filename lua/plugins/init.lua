local M = require("core.utils.loader"):new()

M.module = "plugins"

M.submodules = {
  "settings",
  "notifications",

  "colorschemes",
  "lsp",

  "appearance",
  "bufferline",
  "completions",
  "dashboard",
  "editing",
  "filetree",
  "git",
  "icons",
  "keymappings",
  "search",
  "statusline",
  "terminal",
  "treesitter",
}

return M
