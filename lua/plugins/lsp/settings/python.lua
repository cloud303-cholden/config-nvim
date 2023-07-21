local M = {}

M.settings = {
  python = {
    analysis = {
      autoSearchPaths = false,
      useLibraryCodeForTypes = true,
      diagnosticMode = "openFilesOnly",
      typeCheckingMode = "off",
    },
  },
}

return M
