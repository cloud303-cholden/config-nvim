local M = {}

M.settings = {
  python = {
    analysis = {
      autoSearchPaths = false,
      useLibraryCodeForTypes = false,
      diagnosticMode = "openFilesOnly",
      typeCheckingMode = "off",
    },
  },
}

return M
