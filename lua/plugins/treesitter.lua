local M = {}

M.load = function()
  local ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
  if not ok then
    return
  end

  treesitter_configs.setup({
    ensure_installed = {
      "python",
      "go",
      "rust",
      "lua",
      "bash",
      "markdown",
      "query",
      "regex",
      "sql",
      "vim",
      "vimdoc",
      "c",
      "typescript",
      "javascript",
    },
    ignore_install = { "" },
    highlight = {
      enable = true,
      disable = { "json" },
    },
    autopairs = {
      enable = true,
    },
    indent = {
      disable = { "python" },
      enable = true,
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,
      persist_queries = false,
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    },
  })
end

return M
