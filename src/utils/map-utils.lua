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


function expandTableBlank(ySize,xSize)
  local table = {}
  for i=1,ySize do
    table[i] = {}
    for q=1,xSize do
      table[i][q] = {}
    end
  end
  return table
end


function expandTableFilled(ySize,xSize,fill)
  f = fill
  local table = {}
  for i=1,ySize do
    table[i] = {}
    for q=1,xSize do
      table[i][q] = f
    end
  end
  return table
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


function floodFill()


end
