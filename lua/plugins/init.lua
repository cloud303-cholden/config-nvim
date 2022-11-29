local M = require("core.utils.loader"):new()

M.module = "plugins"

M.submodules = {
  "packer",
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
  "toggleterm",
  "colorschemes",
  "lsp",
  "which-key",
}

return M
