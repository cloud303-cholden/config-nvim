local M = require("core.utils.loader"):new()

M.module = "plugins"

M.submodules = {
  -- "packer",
  "lazy",
  "notify",
  "telescope",
  "cmp",
  "comment",
  "nvim-tree",
  "treesitter",
  "project",
  "lualine",
  "navic",
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
