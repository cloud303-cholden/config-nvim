local ok, _ = pcall(require, "plugins.notify")
if not ok then
  return
end

require("plugins.cmp")
require("plugins.comment")
require("plugins.nvim-tree")
require("plugins.which-key")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.project")
require("plugins.lualine")
require("plugins.navic")
require("plugins.go")
require("plugins.chartoggle")
require("plugins.toggleterm")

require("plugins.lsp.mason")

require("plugins.colorschemes.nightfox")
