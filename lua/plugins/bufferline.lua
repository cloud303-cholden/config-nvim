local M = {}

M.load = function()
  local get_hex = require("cokeline/utils").get_hex

  vim.cmd("highlight TabLine guifg=none guibg=none")

  require("cokeline").setup({
    default_hl = {
      fg = function(buffer)
        return buffer.is_focused and "#282C34" or "#8FBCBB"
      end,
      bg = function(buffer)
        return buffer.is_focused and "#81A1C1" or "#5C6370"
      end,
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
            status = " "
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
