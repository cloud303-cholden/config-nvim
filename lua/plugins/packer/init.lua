local M = require("core.utils.loader"):new()

M.module = "plugins.packer"

M.submodules = {
  "bootstrap",
  "plugins",
}

return M
