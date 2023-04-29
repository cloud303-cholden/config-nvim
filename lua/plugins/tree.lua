local M = {}

M.load = function()
  local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")
  require("nvim-tree").setup({
    renderer = {
      icons = {
        glyphs = nonicons_extention.glyphs,
      },
    },
  })
  local wk = require("which-key")
  local opts = {
    mode = "n",
    prefix = "<LEADER>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = true,
  }
  local mappings = {
    e = { ":NvimTreeToggle<CR>", "Tree" },
  }
  wk.register(mappings, opts)
end

return M
