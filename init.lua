local M = require("core.utils.loader"):new()

M.module = ""

M.submodules = {
  "core",
  "plugins",
}

return M:load()
