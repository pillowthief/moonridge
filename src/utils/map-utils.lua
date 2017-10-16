require 'src/shaders/colorassign'

local frozenCameraRef = {}

function newTileMap(tileW, tileH, tilesetPath)
  TileW = tileW
  TileH = tileH
  Tileset = love.graphics.newImage(tilesetPath)

  local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
  local tilesW, tilesH = (tilesetW / TileW), (tilesetH / TileH)

  local quadInfo = {}
  local counter = 1
  for y=1, tilesH do
    for x=1, tilesW do
       quadInfo[counter] = {(0 + TileW*(x-1)),(0 + TileH*(y-1))}
       counter = counter + 1;
    end
  end

  Quads = {}
  for i,info in ipairs(quadInfo) do
    -- info[1] = x, info[2] = y
    Quads[i] = love.graphics.newQuad(info[1], info[2], TileW, TileH, tilesetW, tilesetH)
  end
end


function drawMap()
  local visible = {}
  visible = {Cam:getVisible()}
  local x_offset = 0
  local y_offset = 0

  if visible[1] == 0 then x_offset = 0
  else x_offset = (visible[1] / TileW) end

  if visible[2] == 0 then y_offset = 0
  else y_offset = (visible[2] / TileH) end

  local max_x = (visible[3] / TileW)
  local max_y = (visible[4] / TileH)

  for rowIndex=1, max_y do
    for columnIndex=1, max_x do
      local number = TileTable[rowIndex + y_offset][columnIndex + x_offset]:getSymbol()
      local x,y = (columnIndex-1 + x_offset)*TileW, (rowIndex-1 + y_offset)*TileH
      love.graphics.setShader(ColorAssign)
      ColorAssign:send("bgcolor", {16, 15, 58, 255}, {})
      ColorAssign:send("fgcolor", {255, 251, 142, 255}, {})
      love.graphics.draw(Tileset, Quads[number], x, y)
      love.graphics.setShader()
    end
  end

  frozenCameraRef = {x_offset, y_offset, max_x, max_y}
end


function drawActors()
  for rowIndex=1, #ActorTable do
    local row = ActorTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      local x,y = (columnIndex-1)*TileW, (rowIndex-1)*TileH

      love.graphics.draw(Tileset, Quads[number], x, y)
    end
  end
end
