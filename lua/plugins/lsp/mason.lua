local status_ok, mason = pcall(require, "mason")
if not status_ok then
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

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
	return
end

mason_lspconfig.setup({
	ensure_installed = {
		"sumneko_lua",
		"gopls",
	},
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

mason_lspconfig.setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = require("plugins.lsp.handlers").on_attach,
      capabilities = require("plugins.lsp.handlers").capabilities,
    }
  end,
  ["sumneko_lua"] = function ()
    lspconfig.sumneko_lua.setup {
      on_attach = require("plugins.lsp.handlers").on_attach,
      capabilities = require("plugins.lsp.handlers").capabilities,
      cmd = {
        "lua-language-server",
        "-E",
        os.getenv("HOME") .. "/.lua/lsp/main.lua",
      },
      settings = {
        Lua = {
          runtime = {
            version = "Lua 5.1",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.stdpath "config" .. "/lua"] = true,
            },
          },
          telemetry = {
            enable = false,
          },
        },
      },
    }
  end,
  -- ["gopls"] = function ()
  --   lspconfig.gopls.setup {
  --     settings = {
  --       gopls = {
  --         hints = {
  --           assignVariableTypes = true,
  --           compositeLiteralFields = true,
  --           compositeLiteralTypes = true,
  --           constantValues = true,
  --           functionTypeParameters = true,
  --           parameterNames = true,
  --           rangeVariableTypes = true,
  --         },
  --       },
  --     },
  --   }
  -- end,
}
