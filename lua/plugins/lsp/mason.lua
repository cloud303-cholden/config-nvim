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

  mason_lspconfig.setup({})

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
    ["lua_ls"] = function()
      local lua = require("plugins.lsp.settings.lua")
      lspconfig.lua_ls.setup(lua.settings)
    end,
    ["rust_analyzer"] = function()
      local rust = require("plugins.lsp.settings.rust")
      rust.load()
    end,
    ["terraformls"] = function()
      local tf = require("plugins.lsp.settings.tf")
      lspconfig.terraformls.setup(tf.settings)
      tf.load()
    end,
    ["gopls"] = function()
      local go = require("plugins.lsp.settings.go")
      lspconfig.gopls.setup(go.settings)
      go.load()
    end,
    ["pyright"] = function()
      lspconfig.pyright.setup({
        handlers = {
          ["textDocument/publishDiagnostics"] = function(...) end,
        },
        on_attach = require("plugins.lsp.handlers").on_attach,
        settings = require("plugins.lsp.settings.python"),
      })
    end,
    ["ruff_lsp"] = function()
      lspconfig.ruff_lsp.setup({
        on_attach = function(_, _)
          client.server_capabilities.hoverProvider = false
        end,
      })
    end,
    ["yamlls"] = function()
      local yamlls = require("plugins.lsp.settings.yaml")
      lspconfig.yamlls.setup(yamlls)
    end,
    ["lemminx"] = function()
      lspconfig.lemminx.setup({
        settings = require("plugins.lsp.settings.xml"),
        filetypes = { "xml", "xsd", "xsl", "xslt", "svg", "rng" },
      })
    end,
  })
end

return M
