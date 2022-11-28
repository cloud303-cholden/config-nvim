local M = {}

function M.load(plugins)
  local loaded = {}
  loaded.ok = true
  for _, plugin in ipairs(plugins) do
    local ok, p = pcall(require, plugin)
    if not ok then
      require("plugins.notify")(p .. " not found!", "error")
      loaded.ok = false
      return loaded
    end
    table.insert(loaded, p)
  end
  return loaded
end

function M.l(plugin_name)
  require("plugins.notify")("cmp" .. " not found!", "error")
  local ok, plugin = pcall(require, plugin_name)
  if not ok then
    --require("plugins.notify")(plugin_name .. " not found!", "error")
    return ok, false
  end
  return ok, plugin
end

return M
