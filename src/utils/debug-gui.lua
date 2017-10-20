--shade tiles called by a debugging function to see where things are

local DebugTiles = {}

function addDebugTile(x,y,duration,color)
  local dur = duration or 60
  local col = color or {39, 255, 35}
  DebugTiles[#DebugTiles + 1] = {x,y,dur,col}
end

function drawDebugTiles()
  love.graphics.setShader(ColorAssign)


  for i=1,#DebugTiles do
    local x,y = DebugTiles[i][1],DebugTiles[i][2]

    local brightness = DebugTiles[i][3] * 3
    table.insert(DebugTiles[i][4], brightness)

    ColorAssign:send("color1", DebugTiles[i][4], {})
    ColorAssign:send("color2", {0.0, 0.0, 0.0, 0.0}, {})
    ColorAssign:send("color3", {0.0, 0.0, 0.0, 0.0}, {})
    ColorAssign:send("color4", {0.0, 0.0, 0.0, 0.0}, {})

    love.graphics.draw(World_Tiles, World_Quads[2], x, y)
    table.remove(DebugTiles[i][4])

    DebugTiles[i][3] = DebugTiles[i][3] - 1
  end

  for i=1, #DebugTiles do
    if DebugTiles[i][3] <1 then
      table.remove(DebugTiles, i)
    end
  end
end
