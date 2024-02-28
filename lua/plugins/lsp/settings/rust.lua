local M = {}

M.load = function()
  local ok, rust_tools = pcall(require, "rust-tools")
  if not ok then
    return
  end
  rust_tools.setup({
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
            enable = false,
          },
          checkOnSave = {
            command = "clippy",
          },
          diagnostics = {
            disabled = { "unresolved-proc-macro" },
          },
          procMacro = {
            attributes = { enable = true },
            enable = true,
          },
        },
      },
    },
  })

  local ok, wk = pcall(require, "which-key")
  if not ok then
    return
  end

  local opts = {
    mode = "n",
    prefix = "<LEADER>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = true,
  }
  local mappings = {
    r = {
      name = "Rust",
      h = { ":lua require('rust-tools').hover_actions.hover_actions()<CR>", "Hover Actions" },
    },
  }
  wk.register(mappings, opts)
end

return M
