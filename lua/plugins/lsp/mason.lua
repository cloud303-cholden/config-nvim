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
      lspconfig.sumneko_lua.setup({
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
      })
    end,
    ["rust_analyzer"] = function()
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
            auto = true,
            only_current_line = true,
            show_parameter_hints = false,
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
  })
end

return M
