local M = {}

M.load = function()
  vim.o.foldcolumn = '1'
  vim.o.foldlevel = 5
  vim.o.foldlevelstart = 0
  vim.o.foldenable = true
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

  vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
  vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)

  vim.cmd("highlight MoreMsg guifg=#d08770 guibg=none")
  vim.cmd("highlight FoldColumn guifg=#d08770 guibg=none")

  local builtin = require("statuscol.builtin")
  require("statuscol").setup({
    relculright = true,
    segments = {
      {
        sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
        click = "v:lua.ScSa"
      },
      { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
      { text = { builtin.foldfunc }, click = "v:lua.ScFa", sign = { name = { ".*" }, maxwidth = 1, colwidth = 3 }},
      {
        sign = { name = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
        click = "v:lua.ScSa"
      },
    }
  })

  local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = ('  %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
      local chunkText = chunk[1]
      local chunkWidth = vim.fn.strdisplaywidth(chunkText)
      if targetWidth > curWidth + chunkWidth then
        table.insert(newVirtText, chunk)
      else
        chunkText = truncate(chunkText, targetWidth - curWidth)
        local hlGroup = chunk[2]
        table.insert(newVirtText, {chunkText, hlGroup})
        chunkWidth = vim.fn.strdisplaywidth(chunkText)
        -- str width returned from truncate() may less than 2nd argument, need padding
        if curWidth + chunkWidth < targetWidth then
          suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
        end
        break
      end
      curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
  end

  require("ufo").setup({
    fold_virt_text_handler = handler,
    -- provider_selector = function(bufnr, filetype, buftype)
    --     return {'treesitter', 'indent'}
    -- end
  })
end

return M
