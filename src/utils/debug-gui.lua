--shade tiles called by a debugging function to see where things are
local DEBUG_ON = false
local DebugTiles = {}

function addDebugTile(x,y,color,duration)
  local dur = duration or 60
  --local col = color or {39, 255, 35}
  local col = color or {255, 88, 22}
  DebugTiles[#DebugTiles + 1] = {x,y,dur,dur,col}
end

function addDebugTiles(tileTable,color,duration)
  local dur = duration or 60
  local col = color or {255, 88, 22}
  for i=1,#tileTable do
    addDebugTile(tileTable[i][1],tileTable[i][2],col,dur)
  end
end

function drawDebugTiles()
  if DEBUG_ON == true then
    love.graphics.setShader(ColorAssign)


    for i=1,#DebugTiles do
      local x,y = DebugTiles[i][1],DebugTiles[i][2]

      local brightness = 200 / (DebugTiles[i][4]/DebugTiles[i][3])
      table.insert(DebugTiles[i][5], brightness)

      ColorAssign:send("color1", DebugTiles[i][5], {})
      ColorAssign:send("color2", {0.0, 0.0, 0.0, 0.0}, {})
      ColorAssign:send("color3", {0.0, 0.0, 0.0, 0.0}, {})
      ColorAssign:send("color4", {0.0, 0.0, 0.0, 0.0}, {})

      love.graphics.draw(World_Tiles, World_Quads[2], x, y)
      table.remove(DebugTiles[i][5])

      DebugTiles[i][3] = DebugTiles[i][3] - 1
    end

    local i = #DebugTiles
    while i > 0 do
      if DebugTiles[i][3] <1 then
        table.remove(DebugTiles, i)
      end
      i = i -1
    end
  else
    for i=1, #DebugTiles do
      DebugTiles[i][3] = DebugTiles[i][3] - 1
    end
  end
end


function debugDrawToggle()
  if DEBUG_ON == true then
    DEBUG_ON = false
  else
    DEBUG_ON = true
  end
  preventQuckPress = true
end
