local menuSelector = 1
local menuItems = {
  "Return",
  "Save Game",
  "Settings",
  "Quit"
}

function setMenuSelector(int)
  menuSelector = menuSelector + int
  if menuSelector < 1 then menuSelector = #menuItems end
  if menuSelector > #menuItems then menuSelector = 1 end
end

function getMenuSelector()
  return menuSelector
end

function drawMenuFog()
  local visible = getVisibleTiles()
  local x_offset = visible[1]
  local y_offset = visible[2]
  local max_x = visible[3]
  local max_y = visible[4]
  love.graphics.setShader(ColorAssign)


  for i=0,max_y do
    local y = (i+y_offset) * TileH
    for q=0,max_x do
      local x = (q+x_offset) * TileW

      ColorAssign:send("color1", {60, 111, 193, 255}, {})
      ColorAssign:send("color2", {60, 111, 193, 255}, {})
      ColorAssign:send("color3", {60, 111, 193, 255}, {})
      ColorAssign:send("color4", {36, 46, 58, 200}, {})

      love.graphics.draw(GUI_Tiles, GUI_Quads[9], x, y)
    end
  end

  love.graphics.setShader()
end


function drawMenu(tilemap)
  local visible = getVisibleTiles()

  love.graphics.setShader(ColorAssign)

  local y_buffer = 4
  local x_buffer = 14

  local x_offset = visible[1] + x_buffer
  local y_offset = visible[2] + y_buffer

  for i=1,#tilemap do
    local y = (y_offset + i -1) * TileH
    for q=1,#tilemap[i] do
      local x = (x_offset + q -1) * TileW
      local number = tilemap[i][q]

      ColorAssign:send("color1", {60, 111, 193, 235}, {})
      ColorAssign:send("color2", {193, 190, 174, 235}, {})
      ColorAssign:send("color3", {255, 216, 0, 235}, {})
      ColorAssign:send("color4", {160, 1, 1, 235}, {})

      love.graphics.draw(GUI_Tiles, GUI_Quads[number], x, y)
    end
  end

  love.graphics.setShader()

end

function drawMenuText()
  local visible = getVisibleTiles()
  local height = (visible[2] + 7) * TileH
  local width = (visible[1] + 14) * TileW

  love.graphics.setFont(FontFipps)

  for i=1, #menuItems do
    local item = {}
    if menuSelector == i then
      item = {{244,244,66,255},menuItems[i]}
    else
      item = {{255,255,255,255},menuItems[i]}
    end
    love.graphics.printf(item, width, height,400,"center")
    height = height + 72
  end

end

function menuActions()
  if menuSelector == 1 then
    ScreenManager.pop()
  elseif menuSelector == 2 then
    local time = getTotalMinutes()
    binser.writeFile('saves/save.dat', TileTable, BlockTable, ActorList,time)
  elseif menuSelector == 3 then
  elseif menuSelector == 4 then
    ScreenManager.switch('home')
  end

end


function generateMenuTileMap()
  local panel = {}
  local h = 16
  local w = 12
  for i=1,h do
    panel[i] = {}
  end

  panel[1][1] = 47
  for i=2,w-1 do
    panel[1][i] = 48
  end
  panel[1][w] = 49

  for i=2,(h-1) do
    panel[i][1] = 46
    for q=2,w-1 do
      panel[i][q] = 9
    end
    panel[i][w] = 53
  end

  panel[h][1] = 54
  for i=2,w-1 do
    panel[h][i] = 55
  end
  panel[h][w] = 56

  return panel
end
