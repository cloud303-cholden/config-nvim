local M = {}

M.load = function()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    return
  end

  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {

      prompt_prefix = " ",
      selection_caret = " ",
      path_display = { "smart" },
      file_ignore_patterns = { ".git/", "node_modules", "docs" },

      mappings = {
        i = {
          ["<Down>"] = actions.cycle_history_next,
          ["<Up>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
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
    f = {
      name = "Telescope",
      f = { ":Telescope find_files<CR>", "Files" },
      p = { ":Telescope projects<CR>", "Projects" },
      b = { ":Telescope buffers<CR>", "Buffers" },
      t = { ":Telescope live_grep<CR>", "Live Grep" },
      s = {
        name = "Symbols",
        d = {
          ":Telescope lsp_document_symbols<CR>",
          "Document",
        },
        w = {
          ":Telescope lsp_dynamic_workspace_symbols<CR>",
          "Workspace",
        },
      },
    },
  }
  wk.register(mappings, opts)
end

return M
