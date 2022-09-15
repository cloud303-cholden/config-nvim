local om_status_ok, orgmode = pcall(require, "orgmode")
if not om_status_ok then
	return
end

orgmode.setup_ts_grammar()

local win_split_mode = function(name)
  local bufnr = vim.api.nvim_create_buf(false, true)
  --- Setting buffer name is required
  vim.api.nvim_buf_set_name(bufnr, name)

  local fill = 0.8
  local width = math.floor((vim.o.columns * fill))
  local height = math.floor((vim.o.lines * fill))
  local row = math.floor((((vim.o.lines - height) / 2) - 1))
  local col = math.floor(((vim.o.columns - width) / 2))

  vim.api.nvim_open_win(bufnr, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded"
  })
end

orgmode.setup({
  win_split_mode = win_split_mode,
})

local ts_status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ts_status_ok then
	return
end

treesitter.setup {
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}
