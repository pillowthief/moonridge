require 'src/shaders/colorassign'

--This file is for drawing static (non-moving) glyphs

TileGlyphs = {}
BlockGlyphs = {}
ObjectGlyphs = {}
ItemGlyphs = {}

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

function updateAllGlyphs()
  TileGlyphs = updateGlyphs(TileTable, Floor_Tiles, Floor_Quads)
  BlockGlyphs = updateGlyphs(BlockTable, Block_Tiles, Block_Quads)
  drawActors()
end

function redrawAllGlyphs()
  TileGlyphs = redrawGlyphs(TileTable, Floor_Tiles, Floor_Quads)
  BlockGlyphs = redrawGlyphs(BlockTable, Block_Tiles, Block_Quads)
  drawActors()
end

function redrawGlyphs(tiles, spriteset, quads)
  local visible = getVisibleTiles()
  local storage = {}
  local tiletable = tiles
  local x_offset = visible[1]
  local y_offset = visible[2]
  local max_x = visible[3]
  local max_y = visible[4]

  love.graphics.setShader(ColorAssign)

  for rowIndex=1, max_y do
    storage[rowIndex] = {}
    for columnIndex=1, max_x do
      local number = tiletable[rowIndex + y_offset][columnIndex + x_offset]:getQuad()
      local quads = quads
      local x,y = (columnIndex-1 + x_offset)*TileW, (rowIndex-1 + y_offset)*TileH

      ColorAssign:send("color1", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor1(), {})
      ColorAssign:send("color2", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor2(), {})
      ColorAssign:send("color3", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor3(), {})
      ColorAssign:send("color4", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor4(), {})
      love.graphics.draw(spriteset, quads[number], x, y)

      storage[rowIndex][columnIndex] = {
        number, spriteset, quads, x, y,
        tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor1(),
        tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor2(),
        tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor3(),
        tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor4()
      }
    end
  end

  love.graphics.setShader()
  return storage
end

function updateGlyphs(tiles, spriteset, quads)
  local visible = getVisibleTiles()
  local storage = {}
  local tiletable = tiles
  local x_offset = visible[1]
  local y_offset = visible[2]
  local max_x = visible[3]
  local max_y = visible[4]

  love.graphics.setShader(ColorAssign)

  for rowIndex=1, max_y do
    storage[rowIndex] = {}
    for columnIndex=1, max_x do
      local number = tiletable[rowIndex + y_offset][columnIndex + x_offset]:getQuad()
      local x,y = (columnIndex-1 + x_offset)*TileW, (rowIndex-1 + y_offset)*TileH

      ColorAssign:send("color1", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor1(), {})
      ColorAssign:send("color2", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor2(), {})
      ColorAssign:send("color3", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor3(), {})
      ColorAssign:send("color4", tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor4(), {})
      love.graphics.draw(spriteset, quads[number], x, y)

      storage[rowIndex][columnIndex] = {
        number, spriteset, quads, x, y,
        tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor1(),
        tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor2(),
        tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor3(),
        tiletable[rowIndex + y_offset][columnIndex + x_offset]:getColor4()
      }
    end
  end

  love.graphics.setShader()
  return storage
end

function drawGlyphs(storedglyphs, visible)
  local visible = visible
  local x_offset = visible[1]
  local y_offset = visible[2]
  local max_x = visible[3]
  local max_y = visible[4]

  love.graphics.setShader(ColorAssign)

  for rowIndex=1, max_y do
    for columnIndex=1, max_x do
      local number = storedglyphs[rowIndex][columnIndex][1]
      local tileset = storedglyphs[rowIndex][columnIndex][2]
      local quads = storedglyphs[rowIndex][columnIndex][3]
      local x,y = storedglyphs[rowIndex][columnIndex][4],storedglyphs[rowIndex][columnIndex][5]

      ColorAssign:send("color1", storedglyphs[rowIndex][columnIndex][6], {})
      ColorAssign:send("color2", storedglyphs[rowIndex][columnIndex][7], {})
      ColorAssign:send("color3", storedglyphs[rowIndex][columnIndex][8], {})
      ColorAssign:send("color4", storedglyphs[rowIndex][columnIndex][9], {})
      love.graphics.draw(tileset, quads[number], x, y)

    end
  end

  love.graphics.setShader()
end

function makeBumpWorld(tileMap, width, height)
  for y=1, height do
    for x=1, width do
      if tileMap[y][x]:getWalkable() == false then
        BumpWorld:add(tileMap[y][x],((x-1)*TileW)-1,((y-1)*TileH),TileW,TileH)
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
