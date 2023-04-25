local M = {}

M.settings = {
  on_attach = require("plugins.lsp.handlers").on_attach,
  capabilities = require("plugins.lsp.handlers").capabilities,
  cmd = {
    "lua-language-server",
    "-E",
    os.getenv("HOME") .. "/.lua/lua_ls/main.lua",
  },
  settings = {
    Lua = {
      runtime = {
        version = "Lua 5.1",
      },
      diagnostics = {
        globals = { "vim", "awesome", "screen", "client", "tag" },
        disable = { "redefined-local" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

return M
