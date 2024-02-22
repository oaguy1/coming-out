local version_num = "0.0.1"
local function inside_button_3f(x, y, button_x, button_y, button_width, button_height)
  return ((button_x <= x) and (button_y <= y) and (x <= (button_x + button_width)) and (y <= (button_y + button_height)))
end
local function init()
  __fnl_global__content_2dwarning = "This game is a coming out story from the early 2000's between two boys over the internet. As such, some paths of the interactive story contain slurs against gay people.\n\nIf you don't want to experience that, please click the 'Exit' button below. Otherwise, click the 'Play' button to continue. FUCK YOU"
  font = love.graphics.newFont(16)
  return nil
end
local function update(dt, set_mode)
end
local function draw()
  love.graphics.setColor(0.893, 0.444, 0.792)
  love.graphics.rectangle("fill", 0, 0, 800, 600)
  love.graphics.setColor(0.004, 0.4, 0.984)
  love.graphics.rectangle("fill", 150, 175, 500, 250, 10, 10)
  love.graphics.rectangle("fill", 150, 215, 500, 210)
  love.graphics.setColor(0.902, 0.271, 0.188)
  love.graphics.rectangle("fill", 620, 180, 25, 25, 5, 5)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setLineWidth(1)
  love.graphics.setFont(font)
  love.graphics.rectangle("line", 620, 180, 25, 25, 5, 5)
  love.graphics.printf("x", 620, 183, 25, "center")
  love.graphics.printf("Content Warning!", 155, 185, 350, "left")
  love.graphics.setColor(0.925, 0.914, 0.847)
  love.graphics.rectangle("fill", 155, 215, 490, 205)
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(font)
  love.graphics.printf(__fnl_global__content_2dwarning, 165, 225, 470, "left")
  do
    local x = 228
    local y = 370
    local width = 100
    local height = 40
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", x, y, width, height, 5, 5)
    love.graphics.setColor((159 / 255), (189 / 255), (232 / 255))
    love.graphics.setLineWidth(5)
    love.graphics.rectangle("line", x, y, width, height, 5, 5)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(1)
    love.graphics.rectangle("line", x, y, width, height, 5, 5)
    love.graphics.setFont(font)
    love.graphics.printf("Play", x, (10 + y), width, "center")
  end
  local x = 473
  local y = 370
  local width = 100
  local height = 40
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", x, y, width, height, 5, 5)
  love.graphics.setColor((159 / 255), (189 / 255), (232 / 255))
  love.graphics.setLineWidth(5)
  love.graphics.rectangle("line", x, y, width, height, 5, 5)
  love.graphics.setColor(0, 0, 0)
  love.graphics.setLineWidth(1)
  love.graphics.rectangle("line", x, y, width, height, 5, 5)
  love.graphics.setFont(font)
  return love.graphics.printf("Exit", x, (10 + y), width, "center")
end
local function mousereleased(x, y, button, set_mode)
  if inside_button_3f(x, y, 228, 370, 100, 40) then
    set_mode("mode.menu")
  else
  end
  if inside_button_3f(x, y, 473, 370, 100, 40) then
    love.event.quit()
  else
  end
  if inside_button_3f(x, y, 620, 180, 25, 25) then
    return love.event.quit()
  else
    return nil
  end
end
local function keypressed(key, set_mode)
end
return {init = init, update = update, draw = draw, mousereleased = mousereleased, keypressed = keypressed}
