-- https://hisham.hm/2016/01/04/string-interpolation-in-lua/
function f(str)
   local outer_env = _ENV
   return (str:gsub("%b{}", function(block)
      local code = block:match("{(.*)}")
      local exp_env = {}
      setmetatable(exp_env, { __index = function(_, k)
         local stack_level = 5
         while debug.getinfo(stack_level, "") ~= nil do
            local i = 1
            repeat
               local name, value = debug.getlocal(stack_level, i)
               if name == k then
                  return value
               end
               i = i + 1
            until name == nil
            stack_level = stack_level + 1
         end
         return rawget(outer_env, k)
      end })
      local fn, err = load("return "..code, "expression `"..code.."`", "t", exp_env)
      if fn then
         return tostring(fn())
      else
         error(err, 0)
      end
   end))
end

return f
