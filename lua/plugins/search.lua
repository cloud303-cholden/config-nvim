local M = {}

M.load = function()
  local ok, telescope = pcall(require, "telescope")
  if not ok then
    return
  end

  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      prompt_prefix = "  ",
      selection_caret = "  ",
      path_display = { "absolute" },
      layout_strategy = "vertical",
      scroll_strategy = "limit",
      preview = { hide_on_startup = false },
      initial_mode = "normal",
      vimgrep_arguments = {
        "rg",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
      file_ignore_patterns = {
        "vendor/*",
        "%.lock",
        "__pycache__/*",
        "%.sqlite3",
        "%.ipynb",
        "node_modules/*",
        "%.jpg",
        "%.jpeg",
        "%.png",
        "%.svg",
        "%.otf",
        "%.ttf",
        ".git/",
        "%.webp",
        ".dart_tool/",
        ".github/",
        ".gradle/",
        ".idea/",
        ".settings/",
        ".vscode/",
        "__pycache__/",
        "build/",
        "env/",
        "gradle/",
        "node_modules/",
        "target/",
        "%.pdb",
        "%.dll",
        "%.class",
        "%.exe",
        "%.cache",
        "%.ico",
        "%.pdf",
        "%.dylib",
        "%.jar",
        "%.docx",
        "%.met",
        "%.po",
        "smalljre_*/*",
        ".vale/",
        "%.burp",
        "%.mp4",
        "%.mkv",
        "%.rar",
        "%.zip",
        "%.7z",
        "%.tar",
        "%.bz2",
        "%.epub",
        "%.flac",
        "%.tar.gz",
      },

      mappings = {
        i = {
          ["<Down>"] = actions.cycle_history_next,
          ["<Up>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["q"] = actions.close,
          ["l"] = actions.select_default,
        },
      },
    },
  })

  telescope.load_extension("live_grep_args")
  telescope.load_extension("projects")

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
    f = {
      name = "Telescope",
      f = { ":Telescope find_files<CR>", "Files" },
      p = { ":Telescope projects<CR>", "Projects" },
      b = { ":Telescope buffers<CR>", "Buffers" },
      t = { ":Telescope live_grep<CR>", "Live Grep" },
      r = { ":Telescope resume<CR>", "Resume" },
      g = {
        ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        "Live Grep Args",
      },
      s = {
        name = "Symbols",
        d = {
          ":Telescope lsp_document_symbols<CR>",
          "Document",
        },
        w = {
          ":Telescope lsp_dynamic_workspace_symbols<CR>",
          "Workspace",
        },
      },
    },
  }
  wk.register(mappings, opts)
end

return M
