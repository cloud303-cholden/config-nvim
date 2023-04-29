local M = require("core.utils.loader"):new()

M.module = "plugins"

M.submodules = {
  "settings",
  "notify",
  "dashboard",
  "project",
  "telescope",
  "cmp",
  "comment",
  "treesitter",
  "statusline",
  "tree",
  "icons",
  "chartoggle",
  "indent_blankline",
  "autopairs",
  "surround",
  "terminal",
  "headlines",
  "colorschemes",
  "lsp",
  "which-key",
}

return M
