require 'src/shaders/colorassign'
require 'src/utils/sprite-interpret'

function newTileMap(tileW, tileH, tilesetPath)
  TileW = tileW
  TileH = tileH
  local tileset = tilesetPath

  local tilesetW, tilesetH = tileset:getWidth(), tileset:getHeight()
  local tilesW, tilesH = (tilesetW / TileW), (tilesetH / TileH)

  local quadInfo = {}
  local counter = 1
  for y=1, tilesH do
    for x=1, tilesW do
       quadInfo[counter] = {(0 + TileW*(x-1)),(0 + TileH*(y-1))}
       counter = counter + 1;
    end
  end

  local quads = {}
  for i,info in ipairs(quadInfo) do
    -- info[1] = x, info[2] = y
    quads[i] = love.graphics.newQuad(info[1], info[2], TileW, TileH, tilesetW, tilesetH)
  end

  return quads
end

function loadTileImage(tilesetPath)
  local tileset = love.graphics.newImage(tilesetPath)
  return tileset
end

function drawGlyphs(imageset, tiles, tquads)
  local quads = tquads
  local tileset = imageset
  local tiletable = tiles
  local visible = getVisibleTiles()
  local x_offset = visible[1]
  local y_offset = visible[2]
  local max_x = visible[3]
  local max_y = visible[4]

  for rowIndex=1, max_y do
    for columnIndex=1, max_x do
      local number = getQuadFromSName(tiletable[rowIndex + y_offset][columnIndex + x_offset])
      local x,y = (columnIndex-1 + x_offset)*TileW, (rowIndex-1 + y_offset)*TileH
      love.graphics.setShader(FullColorAssign)
      FullColorAssign:send("color1", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor1(), {})
      FullColorAssign:send("color2", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor2(), {})
      FullColorAssign:send("color3", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor3(), {})
      FullColorAssign:send("color4", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor4(), {})

      love.graphics.draw(tileset, quads[number], x, y)
      love.graphics.setShader()
    end
  end
end


function drawActors()
  for rowIndex=1, #ActorTable do
    local row = ActorTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      local x,y = (columnIndex-1)*TileW, (rowIndex-1)*TileH
      if number == 3 then
        love.graphics.draw(World_Tiles, World_Quads[number], x, y)
      else
        love.graphics.setShader(FullColorAssign)
        FullColorAssign:send("color1", {242, 190, 101, 255})
        FullColorAssign:send("color2", {56, 35, 0, 255})
        FullColorAssign:send("color3", {94, 175, 178, 255})
        FullColorAssign:send("color4", {47, 40, 89, 255})
        love.graphics.draw(Actor_Sprites, Actor_Quads[2], x, y)
        love.graphics.setShader()
      end
    end
  end
end

function getVisibleTiles()
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

  visible[1] = x_offset
  visible[2] = y_offset
  visible[3] = max_x
  visible[4] = max_y

  return visible

end
