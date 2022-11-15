local ok, ct = pcall(require, "chartoggle")
if not ok then
  return
end

ct.setup({
  leader = " ",
  keys = { ",", ";" },
})
