-- Alpha: https://github.com/alpha2phi/neovim-for-beginner/blob/06-filetree/lua/config/alpha.lua
-- Header: https://github.com/MaximilianLloyd/ascii.nvim/blob/master/sources.md

local M = {}

M.load = function()
  local status_ok, alpha = pcall(require, "alpha")
  if not status_ok then
    return
  end

  local dashboard = require("alpha.themes.dashboard")

  local function header()
    return {
      [[                                                                  ]],
      [[     _/      _/                      _/      _/  _/               ]],
      [[    _/_/    _/    _/_/      _/_/    _/      _/      _/_/_/  _/_/  ]],
      [[   _/  _/  _/  _/_/_/_/  _/    _/  _/      _/  _/  _/    _/    _/ ]],
      [[  _/    _/_/  _/        _/    _/    _/  _/    _/  _/    _/    _/  ]],
      [[ _/      _/    _/_/_/    _/_/        _/      _/  _/    _/    _/   ]],
      [[                                                                  ]],
    }
  end

  dashboard.section.header.val = header()

  dashboard.section.buttons.val = {
    dashboard.button("r", "  Repositories", ":Telescope projects<CR>"),
    dashboard.button("p", "ஃ  Plugins", ":Lazy<CR>"),
    dashboard.button("l", "↯  LSP", ":Mason<CR>"),
    dashboard.button("c", "  Configuration", ":e $NVIM_CONFIG <CR>"),
    dashboard.button("h", "  Help", ":h<CR>"),
    dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
  }

  local function footer()
    local total_plugins = #vim.tbl_keys(require("lazy.core.config").plugins)
    local datetime = os.date("%m-%d-%Y %H:%M:%S")
    local plugins_text = "   "
      .. total_plugins
      .. " plugins"
      .. "   v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch
      .. "   "
      .. datetime

    return plugins_text
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Constant"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Function"
  dashboard.section.buttons.opts.hl_shortcut = "Type"
  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.config)
end

return M
