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
      local rusts = require("plugins.lsp.settings.rust")
      rusts.load()
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
      })
    end,
    ["ruff_lsp"] = function()
      lspconfig.ruff_lsp.setup({
        on_attach = function(client, bufnr)
          -- Enable completion triggered by <c-x><c-o>
          vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

          -- Mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local bufopts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
          vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
          vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
          vim.keymap.set("n", "<space>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, bufopts)
          vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
          vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
          vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
          vim.keymap.set("n", "<space>f", function()
            vim.lsp.buf.format({ async = true })
          end, bufopts)
        end,
      })
    end,
  })
end

return M
