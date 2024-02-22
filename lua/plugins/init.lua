local M = require("core.utils.loader"):new()

M.module = "plugins"

M.submodules = {
  "settings",
  "notifications",

  "colorschemes",
  "lsp",

  "appearance",
  "ui",
  "bufferline",
  "completions",
  "dashboard",
  "editing",
  "tree",
  "git",
  -- "icons",
  "keymappings",
  "search",
  "statusline",
  "terminal",
  "treesitter",
}

return M
