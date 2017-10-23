Clock_Tiles = loadTileImage('assets/clock.png')
Clock_Quads = newTileMap(32,32,Clock_Tiles)

Hand_Tiles = loadTileImage('assets/clock_hands.png')
Hand_Quads = newTileMap(64,64,Hand_Tiles)

local clockMap = {
  {1,2,3},
  {4,5,6},
  {7,8,9}
}

local minutePosition = 1
local hourPosition = 1

function drawClock()
  drawBase()
  updateClock()
  drawHands()
end

function updateClock()
  local hour = getCurrentHour()
  hour = hour/2
  hourPosition = 1 + math.floor(hour/1.5)
  if hourPosition > 8 then hourPosition = 1 end
  local minute = getCurrentMinute()
  minutePosition = 1 + math.floor(minute/3.75)
  if minutePosition > 8 then minutePosition = 1 end
end

function drawBase()
  love.graphics.setShader(ColorAssign)
  ColorAssign:send("color1", {219, 219, 206, 150}, {})
  ColorAssign:send("color2", {71, 38, 68, 200}, {})
  ColorAssign:send("color3", {8, 22, 8, 200}, {})
  ColorAssign:send("color4", {34, 183, 29, 200}, {})
  local int
  if getGUIFlip() == true then
    int = 20
  else
    int = 1
  end
  local offset_x, offset_y = 36,int

  for i=1,#clockMap do
    for q=1,#clockMap[i] do
      local x = (q+offset_x-1) * TileW
      local y = (i+offset_y-1) * TileH
      local number = clockMap[i][q]

      love.graphics.draw(Clock_Tiles, Clock_Quads[number], x, y)
    end
  end


  love.graphics.setShader()

end

function drawHands()
  love.graphics.setShader(ColorAssign)
  ColorAssign:send("color1", {219, 219, 206, 150}, {})
  ColorAssign:send("color2", {71, 38, 68, 200}, {})
  ColorAssign:send("color3", {27, 81, 26, 200}, {})
  ColorAssign:send("color4", {140, 2, 16, 255}, {})
  local int
  if getGUIFlip() == true then
    int = 21.5
  else
    int = 2.5
  end
  local offset_x, offset_y = 37.5,int
  local x = (offset_x-1) * TileW
  local y = (offset_y-1) * TileH
  love.graphics.draw(Hand_Tiles, Hand_Quads[hourPosition], x, y)
  love.graphics.draw(Hand_Tiles, Hand_Quads[minutePosition+8], x, y)

  love.graphics.setShader()

end
