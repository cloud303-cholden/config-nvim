local M = {}

M.load = function()
  local ok, mason = pcall(require, "mason")
  if not ok then
    return
  end

  mason.setup({
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  })

  local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
  if not ok then
    return
  end

  mason_lspconfig.setup({
    ensure_installed = {
      "sumneko_lua",
      "gopls",
    },
  })

  local ok, lspconfig = pcall(require, "lspconfig")
  if not ok then
    return
  end

  mason_lspconfig.setup_handlers({
    function(server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup({
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = require("plugins.lsp.handlers").capabilities,
      })
    end,
    ["sumneko_lua"] = function()
      local lua_settings = require("plugins.lsp.settings.lua").settings
      lspconfig.sumneko_lua.setup(lua_settings)
    end,
    ["rust_analyzer"] = function()
      local rust = require("plugins.lsp.settings.rust")
      rust.load()
      rust.register_mappings()
    end,
  })
end

return M
