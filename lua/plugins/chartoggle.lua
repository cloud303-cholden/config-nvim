local M = {}

M.load = function()
  local ok, chartoggle = pcall(require, "chartoggle")
  if not ok then
    return
  end

  chartoggle.setup({
    leader = " ",
    keys = { ",", ";" },
  })

  local wk = require("which-key")
  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = true,
  }
  local mappings = {
    [","] = {
      ":lua require('chartoggle').toggle(',')<CR>",
      "Toggle Comma",
    },
    [";"] = {
      ":lua require('chartoggle').toggle(';')<CR>",
      "Toggle Semicolon",
    },
  }
  wk.register(mappings, opts)
end

return M
