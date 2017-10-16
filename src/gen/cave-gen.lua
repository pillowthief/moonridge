require 'src/entities/tiles'

function makeCave(width, height)
  local tileMap = {}

  for y=1, height do
    tileMap[y] = {}
    for x=1, width do
      local ran = love.math.random(1,2)
      if ran == 2 then
        tileMap[y][x] = Tile:new(TileWallTile)
      else
        tileMap[y][x] = Tile:new(TileFloorTile)
      end
    end
  end

  for y=1, 2 do
    for x=1, width do
      tileMap[y][x] = Tile:new(TileWallTile)
    end
  end



  for x=1, 2 do
    for y=1, height do
      tileMap[y][x] = Tile:new(TileWallTile)
    end
  end

  for y=(height-1), height do
    for x=1, width do
      tileMap[y][x] = Tile:new(TileWallTile)
    end
  end

  for x=(width-1), width do
    for y=1, height do
      tileMap[y][x] = Tile:new(TileWallTile)
    end
  end


  for i=1,4 do
    for y=3, (height-2) do
      for x=3, (width-2) do
        local totalWalls = 0 -- check for how many walls

        -- is self wall?
        if tileMap[y][x]:getSymbol() == 2 then totalWalls = totalWalls + 1 end

        -- cardinal directions
        if tileMap[y+1][x]:getSymbol() == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y][x+1]:getSymbol() == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y-1][x]:getSymbol() == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y][x-1]:getSymbol() == 2 then totalWalls = totalWalls + 1 end

        -- orthagonal directions
        if tileMap[y+1][x+1]:getSymbol() == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y+1][x-1]:getSymbol() == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y-1][x+1]:getSymbol() == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y-1][x-1]:getSymbol() == 2 then totalWalls = totalWalls + 1 end

        if totalWalls >= 5 then tileMap[y][x] = Tile:new(TileWallTile) else tileMap[y][x] = Tile:new(TileFloorTile) end

      end
    end

  end

  print(tileMap[28][28])

  return tileMap

end
