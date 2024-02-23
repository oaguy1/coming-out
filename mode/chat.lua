local function inside_button_3f(x, y, button_x, button_y, button_width, button_height)
  return ((button_x <= x) and (button_y <= y) and (x <= (button_x + button_width)) and (y <= (button_y + button_height)))
end
local function init(...)
  local user_screen_name = ...
  story = narrator.init_story(book)
  story:begin()
  font = love.graphics.newFont(16)
  __fnl_global__text_2darea = love.graphics.newText(font, "")
  __fnl_global__text_2darea_2dy = 38
  __fnl_global__chat_2dlog = {}
  __fnl_global__choice_2dbuttons = {}
  paragraphs = {}
  __fnl_global__game_2dover = false
  if (#user_screen_name > 0) then
    __fnl_global__screen_2dname = user_screen_name
  else
    __fnl_global__screen_2dname = "player"
  end
  __fnl_global__peace_2dprofile = love.graphics.newImage("assets/peace-profile.png")
  __fnl_global__yinyang_2dprofile = love.graphics.newImage("assets/yinyang-profile.png")
  return nil
end
local function update(dt, set_mode)
  if (#paragraphs > 0) then
    local paragraph = table.remove(paragraphs, 1)
    if (string.sub(paragraph.text, 1, 3) == "...") then
      love.timer.sleep(love.math.random(3))
    else
    end
    if (string.sub(paragraph.text, 1, 7) == "oaguy1:") then
      love.timer.sleep(love.math.random((dt * 0.01 * #paragraph.text)))
      table.insert(__fnl_global__chat_2dlog, {1, 0, 0})
      table.insert(__fnl_global__chat_2dlog, "oaguy1:")
      table.insert(__fnl_global__chat_2dlog, {0, 0, 0})
      table.insert(__fnl_global__chat_2dlog, (string.sub(paragraph.text, 8) .. "\n"))
    else
    end
    if not ((string.sub(paragraph.text, 1, 7) == "oaguy1:") or (string.sub(paragraph.text, 1, 3) == "...")) then
      table.insert(__fnl_global__chat_2dlog, {0, 0, 0})
      table.insert(__fnl_global__chat_2dlog, (paragraph.text .. "\n"))
    else
    end
  else
  end
  if story:can_continue() then
    paragraphs = story:continue()
  else
  end
  if (story:can_choose() and (0 == #paragraphs)) then
    local choices = story:get_choices()
    local button_x = 185
    local button_y = 430
    local button_width = 607
    local button_height = 40
    local button_gap = 10
    for i, choice in ipairs(choices) do
      table.insert(__fnl_global__choice_2dbuttons, {x = button_x, y = (button_y + (button_gap * (i - 1)) + (button_height * (i - 1))), width = button_width, height = button_height, text = choice.text, ["choice-index"] = i})
    end
  else
  end
  if (not story:can_continue() and not story:can_choose() and (0 == #paragraphs)) then
    __fnl_global__game_2dover = true
  else
  end
  __fnl_global__text_2darea.setf(__fnl_global__text_2darea, __fnl_global__chat_2dlog, 597, "left")
  if (__fnl_global__text_2darea:getHeight() > 350) then
    __fnl_global__text_2darea_2dy = (38 - (__fnl_global__text_2darea:getHeight() - 350))
    return nil
  else
    return nil
  end
end
local function draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", 178, 30, 617, 350)
  love.graphics.setColor(0, 0, 0)
  love.graphics.setLineWidth(1)
  love.graphics.rectangle("line", 178, 30, 617, 350)
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(__fnl_global__text_2darea, 185, __fnl_global__text_2darea_2dy)
  love.graphics.setColor(0.925, 0.914, 0.847)
  love.graphics.rectangle("fill", 5, 30, 173, 565)
  love.graphics.rectangle("fill", 178, 380, 617, 215)
  love.graphics.setColor(0.737, 0.725, 0.678)
  love.graphics.rectangle("line", 178, 420, 617, 160)
  for _, button in ipairs(__fnl_global__choice_2dbuttons) do
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", button.x, button.y, button.width, button.height, 5, 5)
    love.graphics.setColor((159 / 255), (189 / 255), (232 / 255))
    love.graphics.setLineWidth(5)
    love.graphics.rectangle("line", button.x, button.y, button.width, button.height, 5, 5)
    love.graphics.setColor(0, 0, 0)
    love.graphics.setLineWidth(1)
    love.graphics.rectangle("line", button.x, button.y, button.width, button.height, 5, 5)
    love.graphics.setFont(font)
    love.graphics.printf(button.text, button.x, (10 + button.y), button.width, "center")
  end
  if __fnl_global__game_2dover then
    love.graphics.setFont(font)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf("Game Over", 178, 490, 617, "center")
  else
  end
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(__fnl_global__peace_2dprofile, 18, 45)
  love.graphics.setColor(0.737, 0.725, 0.678)
  love.graphics.rectangle("line", 18, 45, 145, 145)
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(__fnl_global__yinyang_2dprofile, 18, 420)
  love.graphics.setColor(0.737, 0.725, 0.678)
  love.graphics.rectangle("line", 18, 420, 145, 145)
  love.graphics.setColor(0.004, 0.4, 0.984)
  love.graphics.rectangle("fill", 0, 0, 800, 30)
  love.graphics.setLineWidth(10)
  love.graphics.rectangle("line", 0, 0, 800, 600)
  love.graphics.setColor(0.902, 0.271, 0.188)
  love.graphics.rectangle("fill", 767, 3, 25, 25, 5, 5)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setLineWidth(1)
  love.graphics.setFont(font)
  love.graphics.rectangle("line", 767, 3, 25, 25, 5, 5)
  love.graphics.printf("oaguy1 - Instant Message", 5, 5, 400, "left")
  return love.graphics.printf("x", 775, 5, 25, "left")
end
local function mousereleased(x, y, button, set_mode)
  for _, button0 in ipairs(__fnl_global__choice_2dbuttons) do
    if inside_button_3f(x, y, button0.x, button0.y, button0.width, button0.height) then
      if not (__fnl_global__chat_2dlog[#__fnl_global__chat_2dlog] == (__fnl_global__screen_2dname .. ": ")) then
        story:choose(button0["choice-index"])
        table.insert(__fnl_global__chat_2dlog, {0, 0, 1})
        table.insert(__fnl_global__chat_2dlog, (__fnl_global__screen_2dname .. ": "))
        __fnl_global__choice_2dbuttons = {}
      else
      end
    else
    end
  end
  if inside_button_3f(x, y, 767, 3, 25, 25) then
    return set_mode("mode.menu")
  else
    return nil
  end
end
local function keypressed(key, set_mode)
end
local function keyreleased(key, set_mode)
end
return {init = init, update = update, draw = draw, mousereleased = mousereleased, keypressed = keypressed, keyreleased = keyreleased}
