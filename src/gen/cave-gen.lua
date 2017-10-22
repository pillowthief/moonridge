require 'src/entities/tiles'
require 'src/entities/blocks'

function makeCaveFloor(width, height)
  local tileMap = {}
  for y=1, height do
    tileMap[y] = {}
    for x=1, width do
      tileMap[y][x] = Tile:new(CaveFloorDirt)
    end
  end
  return tileMap
end

function makeCaveBlocks(width, height)
  local tileMap = {}

  for y=1, height do
    tileMap[y] = {}
    for x=1, width do
      local ran = love.math.random(1,2)
      if ran > 1 then
        tileMap[y][x] = Block:new(CaveDirtWall)
      else
        tileMap[y][x] = Block:new(BlockNull)
      end
    end
  end

  for y=1, 2 do
    for x=1, width do
      tileMap[y][x] = Block:new(CaveDirtWall)
    end
  end



  for x=1, 2 do
    for y=1, height do
      tileMap[y][x] = Block:new(CaveDirtWall)
    end
  end

  for y=(height-1), height do
    for x=1, width do
      tileMap[y][x] = Block:new(CaveDirtWall)
    end
  end

  for x=(width-1), width do
    for y=1, height do
      tileMap[y][x] = Block:new(CaveDirtWall)
    end
  end


  for i=1,4 do
    for y=3, (height-2) do
      for x=3, (width-2) do

        if tileMap[y][x]:getName() == 'CaveDirtWall' then
          local totalWalls = tileMap[y][x]:getLikeNeighbors(tileMap,x,y)

          if totalWalls >= 5 then tileMap[y][x] = Block:new(CaveDirtWall) else tileMap[y][x] = Block:new(BlockNull) end
        else
          local totalOpen = tileMap[y][x]:getLikeNeighbors(tileMap,x,y)

          if totalOpen >= 5 then tileMap[y][x] = Block:new(BlockNull) else tileMap[y][x] = Block:new(CaveDirtWall) end
        end

      end
    end

  end

  return tileMap

end
