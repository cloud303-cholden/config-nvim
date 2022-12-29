local M = require("core.utils.loader"):new()

M.module = "plugins"

M.submodules = {
  "packer",
  "notify",
  "telescope",
  "cmp",
  "nvim-tree",
  "treesitter",
  "project",
  "lualine",
  "navic",
  "go",
  "chartoggle",
  "indent_blankline",
  "autopairs",
  "toggleterm",
  "colorschemes",
  "lsp",
  "which-key",
}

return M
