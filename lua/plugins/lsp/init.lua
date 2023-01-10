local M = require("core.utils.loader"):new()

M.module = "plugins.lsp"

M.submodules = {
  "mason",
  "handlers",
}

return M
