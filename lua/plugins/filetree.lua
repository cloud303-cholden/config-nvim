local M = {}

M.load = function()
  local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")

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
    renderer = {
      icons = {
        glyphs = nonicons_extention.glyphs,
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
      remove_file = {
        close_window = false,
      },
    },
    view = {
      float = {
        enable = true,
        open_win_config = {
          border = "rounded",
          width = 50,
          height = 150,
          row = 10,
          col = 150,
        },
      },
    },
    filters = {
      custom = {
        "__pycache__",
      },
    },
    git = {
      ignore = false,
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
