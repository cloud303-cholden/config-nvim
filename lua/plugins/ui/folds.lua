local M = {}

M.load = function()

  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  vim.cmd("highlight MoreMsg guifg=#d08770 guibg=none")
  vim.cmd("highlight FoldColumn guifg=#d08770 guibg=none")

  local builtin = require("statuscol.builtin")
  require("statuscol").setup({
    relculright = true,
    segments = {
      {
        sign = { name = { "Diagnostic" } },
        click = "v:lua.ScSa",
      },
      {
        text = { builtin.lnumfunc },
        click = "v:lua.ScLa",
      },
      {
        text = { " ", builtin.foldfunc, " " },
        click = "v:lua.ScFa",
      },
    }
  })

  -- local handler = function(virtText, lnum, endLnum, width, truncate)
  --   local newVirtText = {}
  --   local suffix = ('  %d '):format(endLnum - lnum)
  --   local sufWidth = vim.fn.strdisplaywidth(suffix)
  --   local targetWidth = width - sufWidth
  --   local curWidth = 0
  --   for _, chunk in ipairs(virtText) do
  --     local chunkText = chunk[1]
  --     local chunkWidth = vim.fn.strdisplaywidth(chunkText)
  --     if targetWidth > curWidth + chunkWidth then
  --       table.insert(newVirtText, chunk)
  --     else
  --       chunkText = truncate(chunkText, targetWidth - curWidth)
  --       local hlGroup = chunk[2]
  --       table.insert(newVirtText, {chunkText, hlGroup})
  --       chunkWidth = vim.fn.strdisplaywidth(chunkText)
  --       -- str width returned from truncate() may less than 2nd argument, need padding
  --       if curWidth + chunkWidth < targetWidth then
  --         suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
  --       end
  --       break
  --     end
  --     curWidth = curWidth + chunkWidth
  --   end
  --   table.insert(newVirtText, {suffix, 'MoreMsg'})
  --   return newVirtText
  -- end
  --
  -- require("ufo").setup({
  --   fold_virt_text_handler = handler,
  --   provider_selector = function(bufnr, filetype, buftype)
  --       return {'indent'}
  --   end
  -- })
  --
  -- vim.api.nvim_del_augroup_by_name("Ufo")
  -- vim.api.nvim_create_autocmd(
  --   {"BufEnter"},
  --   {
  --     pattern = {"*"},
  --     callback = function()
  --       require('ufo.lib.event'):emit('BufEnter', vim.api.nvim_get_current_buf())
  --     end,
  --   }
  -- )

end

return M
