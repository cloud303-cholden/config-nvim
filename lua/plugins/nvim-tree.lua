local M = {}

M.load = function()
  local ok, nvim_tree = pcall(require, "nvim-tree")
  if not ok then
    return
  end

  local ok, nvim_tree_config = pcall(require, "nvim-tree.config")
  if not ok then
    return
  end

  local ok, icons = pcall(require, "nvim-web-devicons")
  if not ok then
    return
  end

  icons.setup()

  local tree_cb = nvim_tree_config.nvim_tree_callback

  nvim_tree.setup({
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
    filters = {
      dotfiles = false,
    },
    git = {
      ignore = false,
    },
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    renderer = {
      root_folder_modifier = ":t",
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
          },
          git = {
            unstaged = "",
            staged = "S",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    view = {
      width = 30,
      side = "right",
      mappings = {
        list = {
          { key = "l", cb = tree_cb("edit") },
          { key = "h", cb = tree_cb("close_node") },
          { key = "v", cb = tree_cb("vsplit") },
        },
      },
      float = {
        enable = false,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 30,
          height = 30,
          row = 1,
          col = 1,
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
    e = { ":NvimTreeToggle<CR>", "Toggle Tree" },
  }
  wk.register(mappings, opts)
end

return M
