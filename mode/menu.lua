local version_num = "0.0.1"
local capitalize = {a = "A", b = "B", c = "C", d = "D", e = "E", f = "F", g = "G", h = "H", i = "I", j = "J", k = "K", l = "L", m = "M", n = "N", o = "O", p = "P", q = "Q", r = "R", s = "S", t = "T", u = "U", v = "V", w = "W", x = "X", y = "Y", z = "Z", ["1"] = "!", ["2"] = "@", ["3"] = "#", ["4"] = "$", ["5"] = "%", ["6"] = "^", ["7"] = "&", ["8"] = "*", ["9"] = "(", ["0"] = ")", ["-"] = "_", ["="] = "+", [","] = "<", ["."] = ">", ["/"] = "?"}
local function inside_button_3f(x, y, button_x, button_y, button_width, button_height)
  return ((button_x <= x) and (button_y <= y) and (x <= (button_x + button_width)) and (y <= (button_y + button_height)))
end
local function init()
  shift = false
  banner = love.graphics.newImage("assets/banner.png")
  font = love.graphics.newFont(16)
  __fnl_global__small_2dfont = love.graphics.newFont(10)
  __fnl_global__screen_2dname = ""
  cursor = "|"
  __fnl_global__cursor_2dcount = 0
  __fnl_global__text_2darea = love.graphics.newText(font, "")
  return nil
end
local function update(dt, set_mode)
  __fnl_global__cursor_2dcount = (__fnl_global__cursor_2dcount + dt)
  if (__fnl_global__cursor_2dcount > 0.5) then
    __fnl_global__cursor_2dcount = 0
    if (cursor == "|") then
      cursor = ""
    else
      cursor = "|"
    end
  else
  end
  return __fnl_global__text_2darea.set(__fnl_global__text_2darea, __fnl_global__screen_2dname)
end
local function draw()
  love.graphics.setColor(0.893, 0.444, 0.792)
  love.graphics.rectangle("fill", 0, 0, 800, 600)
  love.graphics.setColor(0.004, 0.4, 0.984)
  love.graphics.rectangle("fill", 200, 50, 400, 500, 10, 10)
  love.graphics.rectangle("fill", 200, 80, 400, 470)
  love.graphics.setColor(0.902, 0.271, 0.188)
  love.graphics.rectangle("fill", 570, 55, 25, 25, 5, 5)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setLineWidth(1)
  love.graphics.setFont(font)
  love.graphics.rectangle("line", 570, 55, 25, 25, 5, 5)
  love.graphics.printf("x", 570, 58, 25, "center")
  love.graphics.printf("L\195\150VE Instant Messenger", 205, 60, 350, "left")
  love.graphics.setColor(0.925, 0.914, 0.847)
  love.graphics.rectangle("fill", 205, 85, 390, 460)
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", 210, 350, 380, 40)
  love.graphics.setColor(0, 0, 0)
  love.graphics.setLineWidth(1)
  love.graphics.setFont(font)
  love.graphics.printf("ScreenName", 210, 330, 380, "left")
  love.graphics.draw(__fnl_global__text_2darea, 215, 360)
  love.graphics.print(cursor, (215 + __fnl_global__text_2darea:getWidth()), 360)
  love.graphics.rectangle("line", 210, 350, 380, 40)
  love.graphics.setFont(__fnl_global__small_2dfont)
  love.graphics.printf("only letters and some symbols supported", 210, 392, 380, "left")
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(banner, 210, 90)
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("line", 210, 90, 380, 230)
  do
    local x = 210
    local y = 420
    local width = 380
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
    love.graphics.printf("Sign In", x, (10 + y), width, "center")
  end
  do
    local x = 210
    local y = 470
    local width = 380
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
    love.graphics.printf("Exit", x, (10 + y), width, "center")
  end
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(font)
  return love.graphics.printf(("Version: " .. version_num), 210, 520, 380, "center")
end
local function mousereleased(x, y, button, set_mode)
  if inside_button_3f(x, y, 210, 420, 380, 40) then
    set_mode("mode.chat", __fnl_global__screen_2dname)
  else
  end
  if inside_button_3f(x, y, 210, 470, 380, 40) then
    love.event.quit()
  else
  end
  if inside_button_3f(x, y, 570, 55, 25, 25) then
    return love.event.quit()
  else
    return nil
  end
end
local function keypressed(key, set_mode)
  if ((key == "lshift") or (key == "rshift")) then
    shift = true
  else
  end
  if (key == "return") then
    set_mode("mode.chat", __fnl_global__screen_2dname)
  else
  end
  if ((key == "backspace") and (#__fnl_global__screen_2dname > 0)) then
    __fnl_global__screen_2dname = string.sub(__fnl_global__screen_2dname, 1, (#__fnl_global__screen_2dname - 1))
  else
  end
  if ((1 == #key) and (__fnl_global__text_2darea:getWidth() < 360)) then
    if shift then
      __fnl_global__screen_2dname = (__fnl_global__screen_2dname .. capitalize[key])
      return nil
    else
      __fnl_global__screen_2dname = (__fnl_global__screen_2dname .. key)
      return nil
    end
  else
    return nil
  end
end
local function keyreleased(key, set_mode)
  if ((key == "lshift") or (key == "rshift")) then
    shift = false
    return nil
  else
    return nil
  end
end
return {init = init, update = update, draw = draw, mousereleased = mousereleased, keypressed = keypressed, keyreleased = keyreleased}
