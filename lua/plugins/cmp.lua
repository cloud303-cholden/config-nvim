-- local status_ok, cmp = require("core.loader")("cmp")
local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local l_status_ok, luasnip = pcall(require, "luasnip")
-- local _ = require("core.loader").l()
-- local l_status_ok, luasnip = pcall(require, "luasnipa")
if not l_status_ok then
  return
end


cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
  sources = {
    {name = "buffer"},
    {name = "luasnip"},
  },
})
