local M = {}

function M:new()
  local o = setmetatable({}, self)
  self.__index = self
  return o
end

function M:load()
  for _, submodule in ipairs(self.submodules) do
    submodule = require(self.module .. "." .. submodule)
    if submodule.submodules ~= nil then
      submodule:load()
    else
      submodule.load()
    end
  end
end

return M
