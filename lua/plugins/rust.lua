local status_ok, rt = pcall(require, "rust-tools")
if not status_ok then
  return
end

rt.setup({
  tools = {
    on_initialized = function()
      vim.cmd [[
        autocmd BufEnter,CursorHold,InsertLeave,BufWritePost *.rs silent! lua vim.lsp.codelens.refresh()
      ]]
    end,
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
