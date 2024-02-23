local mode = nil
local function set_mode(mode_name, ...)
  mode = require(mode_name)
  if mode.init then
    return mode.init(...)
  else
    return nil
  end
end
love.load = function()
  return set_mode("mode.cw")
end
love.update = function(dt)
  return mode.update(dt, set_mode)
end
love.draw = function()
  return mode.draw()
end
love.mousereleased = function(x, y, button)
  return mode.mousereleased(x, y, button, set_mode)
end
love.keypressed = function(key)
  if (key == "escape") then
    love.event.quit()
  else
  end
  return mode.keypressed(key, set_mode)
end
love.keyreleased = function(key)
  return mode.keyreleased(key, set_mode)
end
return love.keyreleased
