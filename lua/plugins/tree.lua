local M = {}

M.load = function()
  vim.api.nvim_set_var("chadtree_settings", {
    ["theme"] = {
      ["text_colour_set"] = "env",
    },
    ["keymap"] = {
      ["primary"] = { "l" },
      ["collapse"] = { "h" },
    },
    ["ignore"] = {
      ["name_exact"] = { ".git", "__pycache__" },
    },
    ["options"] = {
      ["session"] = false,
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
    e = { ":CHADopen<CR>", "Tree" },
  }
  wk.register(mappings, opts)
end

return M
