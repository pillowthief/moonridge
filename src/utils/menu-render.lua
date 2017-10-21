local font = love.graphics.newFont("assets/ArcadeAlternate.ttf", 32)

local menuSelector = 1
local menuItems = {
  "Return to Game",
  "Save Game",
  "Load Game",
  "Settings",
  "Quit"
}

function setMenuSelector(int)
  menuSelector = menuSelector + int
  if menuSelector < 1 then menuSelector = 1 end
  if menuSelector > #menuItems then menuSelector = #menuItems end
end

function getMenuSelector()
  return menuSelector
end


function drawMenu()
  local visible = getVisibleTiles()

  love.graphics.setShader(ColorAssign)

  local y_buffer = 3
  local x_buffer = 10

  local x_offset = visible[1] + x_buffer
  local y_offset = visible[2] + y_buffer
  local max_x = visible[3] - x_buffer
  local max_y = visible[4] - y_buffer

  for i=0,(max_y - y_buffer - 1) do
    local y = (y_offset + i) * TileH
    for q=0,(max_x - x_buffer - 1) do
      local x = (x_offset + q) * TileW

      ColorAssign:send("color1", {60, 111, 193, 225}, {})
      ColorAssign:send("color2", {60, 111, 193, 225}, {})
      ColorAssign:send("color3", {60, 111, 193, 225}, {})
      ColorAssign:send("color4", {60, 111, 193, 225}, {})

      love.graphics.draw(World_Tiles, World_Quads[2], x, y)
    end
  end

  love.graphics.setShader()

end

function drawMenuText()
  local visible = getVisibleTiles()
  local height = (visible[2] + 5) * TileH
  local width = (visible[1] + 13) * TileW

  love.graphics.setFont(font)

  for i=1, #menuItems do
    if menuSelector == i then
      love.graphics.setColor(244,244,66,255)
    else
      love.graphics.setColor(255,255,255,255)
    end
    love.graphics.print(menuItems[i], width, height)
    height = height + 64
  end

end

function menuActions()
  if menuSelector == 1 then
    ScreenManager.pop()
  elseif menuSelector == 2 then
    local level_data = {TileTable, BlockTable, ActorList}
    bitser.dumpLoveFile('save.dat', level_data)
  elseif menuSelector == 3 then
    if love.filesystem.exists('save.dat') then
      local level_data = bitser.loadLoveFile('save.dat')
      TileTable = level_data[1]
      BlockTable = level_data[2]
      ActorList = level_data[3]
      Player = ActorList[1]
    end
  elseif menuSelector == 4 then
  elseif menuSelector == 5 then
    love.event.quit()
  end

end
