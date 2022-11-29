local M = {}

M.load = function()
  local ok, lualine = pcall(require, "lualine")
  if not ok then return end

  lualine.setup({
    options = {
      icons_enabled = true,
      component_separators = { right = "", left = "" },
      section_separators = { right = "", left = "" },
      disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str
          end,
        },
      },
      lualine_b = {
        {
          "branch",
          icons_enabled = true,
          icon = "",
        },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          sections = { "error", "warn" },
          symbols = { error = " ", warn = " " },
          colored = false,
          update_in_insert = false,
          always_visible = true,
        },
      },
      lualine_x = {
        {
          "filename",
          file_status = true,
          path = 1, -- Relative path
          shorting_target = 80,
          symbols = {
            modified = " [+]",
            readonly = " [-]",
            unnamed = "[No Name]",
          },
        },
      },
      lualine_y = {
        {
          "diff",
          colored = false,
          symbols = { added = " ", modified = " ", removed = " " },
          cond = function()
            return vim.fn.winwidth(0) > 80
          end,
        },
      },
      lualine_z = {
        {
          "location",
          padding = 0,
        },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  })
end

return M
