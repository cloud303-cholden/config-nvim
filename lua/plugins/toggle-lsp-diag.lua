local M = {}

M.load = function()
  local ok, tld = pcall(require, "toggle_lsp_diagnostics")
  if not ok then
    return
  end

  tld.init({ virtual_text = false })

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
    l = {
      d = {
        ":lua require('toggle_lsp_diagnostics').toggle_virtual_text()<CR>",
        "Toggle Virtual Text",
      },
    },
  }
  wk.register(mappings, opts)
end

return M
