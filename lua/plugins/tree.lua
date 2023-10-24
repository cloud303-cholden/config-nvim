local M = {}

M.load = function()
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
      filtered_items = {
        never_show = {
          "__pycache__",
        },
      },
    },
    window = {
      width = 30,
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
      name = {use_git_status_colors = true},
      git_status = {
        symbols = {
          added = "",
          modified = "",
          deleted = "",
          renamed = "",
          untracked = " ",
          ignored = "",
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
  vim.cmd("hi NeoTreeCursorLine guibg=#81a1c1 guifg=#191d24 gui=bold")
end

return M
