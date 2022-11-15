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
  ["rust_analyzer"] = function ()
    local opts = {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = false,
      noremap = true,
      nowait = true,
    }

    local wk = require "which-key"
    local mappings = {
      ["r"] = {
        name = "Run",
        r = { ":update<CR>:RustRun<CR>", "Rust run" },
        d = { ":update<CR>:RustDebuggables<CR>", "Rust debuggables" },
        w = {
          ":update<CR>:sp term://cargo watch -s 'clear && cargo run -q'<CR>",
          "Cargo watch",
        },
        c = { ":update<CR>:Cargo run<CR>", "Cargo run" },
        l = { ":RustRunnables<CR>", "Rust runnables" },
      },
    }
    wk.register(mappings, opts)
    require("rust-tools").setup({
      tools = {
        on_initialized = function()
          vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
            pattern = { "*.rs" },
            callback = function()
              vim.lsp.codelens.refresh()
            end,
          })
        end,
        hover_actions = {
          auto_focus = true,
        },
        inlay_hints = {
          auto = false,
        },
      },
      server = {
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
    })
  end,
}
