local homeSelector = 1
local homeItems = {
  "New Game",
  "Load Game",
  "Settings",
  "Quit"
}

function setHomeSelector(int)
  homeSelector = homeSelector + int
  if homeSelector < 1 then homeSelector = 1 end
  if homeSelector > #homeItems then homeSelector = #homeItems end
end

function getHomeSelector()
  return homeSelector
end

function drawHome()
  love.graphics.setShader(ColorAssign)


  for i=0,23 do
    local y = i * TileH
    for q=0,39 do
      local x = q * TileW

      ColorAssign:send("color1", {60, 111, 193, 255}, {})
      ColorAssign:send("color2", {60, 111, 193, 255}, {})
      ColorAssign:send("color3", {60, 111, 193, 255}, {})
      ColorAssign:send("color4", {60, 111, 193, 255}, {})

      love.graphics.draw(Menu_Tiles, Menu_Quads[2], x, y)
    end
  end

  love.graphics.setShader()

end

function drawHomeText()
  local height = 8 * TileH
  local width = 16 * TileW

  love.graphics.setFont(FontArcade)

  for i=1, #homeItems do
    if homeSelector == i then
      love.graphics.setColor(244,244,66,255)
    else
      love.graphics.setColor(255,255,255,255)
    end
    love.graphics.print(homeItems[i], width, height)
    height = height + 64
  end

end

function homeActions()
  if homeSelector == 1 then
    ScreenManager.switch('worldgen')
  elseif homeSelector == 2 then
    LOADAGAME()
  elseif homeSelector == 3 then
  elseif homeSelector == 4 then
    love.event.quit()
  end

end
