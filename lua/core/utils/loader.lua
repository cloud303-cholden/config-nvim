local M = {}

function M:new()
  local o = setmetatable({}, self)
  self.__index = self
  return o
end

function M:load()
  for _, submodule in ipairs(self.submodules) do
    local r_submodule = require(self.module .. "." .. submodule)
    if r_submodule.submodules ~= nil then
      r_submodule:load()
    elseif submodule ~= "packer_plugins" then
      r_submodule.load()
    end
  end
end

return M
