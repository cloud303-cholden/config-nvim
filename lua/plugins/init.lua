local M = require("core.utils.loader"):new()

M.module = "plugins"

M.submodules = {
  "settings",
  "notifications",

  "colorschemes",
  "lsp",

  "appearance",
  "completions",
  "dashboard",
  "editing",
  "filetree",
  "icons",
  "keymappings",
  "project",
  "search",
  "statusline",
  "terminal",
  "treesitter",
}

return M
