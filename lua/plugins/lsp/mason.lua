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

local lspconfig_status_ok, lspconfig = pcall(require, "mason-lspconfig")
if not lspconfig_status_ok then
	return
end

lspconfig.setup({
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
		"gopls",
		"yamlls",
		"jsonls",
		"graphql",
		"dockerls",
		"terraformls",
		"taplo",
		"sqls",
		"jedi_language_server",
	},
})

lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    ["rust_analyzer"] = function ()
      require("rust-tools").setup {
        tools = {
          on_initialized = function()
            vim.cmd [[
              autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
            ]]
          end,
          hover_actions = {
            auto_focus = true,
          },
          inlay_hints = { show_parameter_hints = false },
        },
        server = {
          standalone = false,
          on_attach = require("plugins.lsp.handlers").on_attach,
          capabilities = require("plugins.lsp.handlers").capabilities,
          settings = {
            ["rust-analyzer"] = {
              lens = {
                enable = true,
              },
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      }
    end,
    -- ["sumneko_lua"] = function ()
    --   lspconfig.sumneko_lua.setup {
    --     settings = {
    --       Lua = {
    --         diagnostics = {
    --           globals = { "vim" }
    --         }
    --       }
    --     }
    --   }
    -- end,
}

-- local null_ls_status_ok, null_ls = pcall(require, "mason-null-ls")
-- if not null_ls_status_ok then
-- 	return
-- end
--
-- -- https://github.com/jayp0521/mason-null-ls.nvim#configuration
-- null_ls.setup({
-- 	automatic_installation = true,
-- })
--
-- null_ls.check_install(true)
