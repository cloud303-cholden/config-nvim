local M = require("core.utils.loader"):new()

M.module = "plugins"

M.submodules = {
  "lazy",
  "notify",
  "alpha",
  "project",
  "telescope",
  "cmp",
  "comment",
  "treesitter",
  "lualine",
  "navic",
  "tree",
  "go",
  "chartoggle",
  "indent_blankline",
  "autopairs",
  "surround",
  "toggleterm",
  "toggle-lsp-diag",
  "colorschemes",
  "lsp",
  "which-key",
}

return M
