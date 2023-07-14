local M = {}

M.load = function()
  vim.cmd("highlight NeoTreeIndentMarker guifg=#bf616a")
  vim.cmd("highlight NeoTreeFileIcon guifg=#8FBCBB")
  vim.cmd("highlight NeoTreeModified guifg=#bf616a")
  vim.cmd("highlight GitGutterChange guifg=#b48ead")

  local nt = require("neo-tree")
  nt.setup({
    use_libuv_file_watcher = true,
    enable_git_status = true,
    enable_diagnostics = true,
    sources = {
      "filesystem",
      "buffers",
      "git_status",
      "document_symbols",
    },
    filesystem = {
      follow_current_file = true,
    },
    window = {
      position = "right",
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
      },
    },
    default_component_configs = {
      indent = {
        highlight = "NeoTreeIndentMarker",
      },
      icon = {
        folder_closed = " ",
        folder_open = " ",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = " ",
        highlight = "NeoTreeModified",
      },
      git_status = {
        symbols = {
          added = " ",
          modified = " ",
          deleted = " ",
          renamed = " ",
          untracked = " ",
          ignored = " ",
          unstaged = " ",
          staged = " ",
          conflict = " ",
        },
      },
    },
  })

  local wk = require("which-key")
  local opts = {
    mode = "n",
    prefix = "<LEADER>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = true,
  }
  local mappings = {
    e = { ":Neotree action=focus position=right reveal<CR>", "Tree" },
  }
  wk.register(mappings, opts)
end

return M
