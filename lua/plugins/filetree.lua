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

  local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return {
        desc = "nvim-tree: " .. desc,
        buffer = bufnr,
        noremap = true,
        silent = true,
        nowait = true,
      }
    end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
  end

  require("nvim-tree").setup({
    on_attach = my_on_attach,
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
