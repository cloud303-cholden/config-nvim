local M = {}

M.load = function()
  local get_hex = require("cokeline/utils").get_hex
  local history = require("cokeline.history")

  vim.cmd("highlight TabLine guifg=none guibg=none")

  require("cokeline").setup({
    show_if_buffers_are_at_least = 0,

    buffers = {
      filter_valid = function(buffer)
        return history:contains(buffer.number) or buffer.is_focused
      end
    },

    history = {
      enabled = true,
      size = 3,
    },
    
    default_hl = {
      fg = function(buffer)
        return buffer.is_focused and "#282C34" or "#8FBCBB"
      end,
      bg = function(buffer)
        return buffer.is_focused and "#81A1C1" or "#5C6370"
      end,
    },

    sidebar = {
      filetype = {'neo-tree'},
      components = {
        {
          text = "",
          fg = "none",
          bg = "none",
          bold = false,
        },
      }
    },

    components = {
      {
        text = " ",
        bg = "none",
      },
      {
        text = "",
        fg = function(buffer)
          return buffer.is_focused and "#81A1C1" or "#5C6370"
        end,
        bg = "none",
      },
      {
        text = function(buffer)
          return buffer.devicon.icon
        end,
        fg = function(buffer)
          return buffer.is_focused and "#282C34" or buffer.devicon.color
        end,
        style = "bold",
      },
      {
        text = " ",
      },
      {
        text = function(buffer)
          return buffer.filename .. "  "
        end,
        style = function(buffer)
          return buffer.is_focused and "bold,italic" or nil
        end,
      },
      {
        text = function(buffer)
          local status = ""
          if buffer.is_modified then
            status = ""
          end
          return status
        end,
      },
      {
        text = "",
        fg = function(buffer)
          return buffer.is_focused and "#81A1C1" or "#5C6370"
        end,
        bg = "none",
      },
    },
  })
end

return M
