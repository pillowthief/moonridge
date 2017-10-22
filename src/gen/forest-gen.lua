require 'src/entities/tiles'
require 'src/entities/blocks'

function makeForestFloor(width, height)
  local tileMap = {}
  for y=1, height do
    tileMap[y] = {}
    for x=1, width do
      local ran = love.math.random(1,10)
      if ran > 4 then
        tileMap[y][x] = Tile:new(ForestFloorGrass)
      else
        tileMap[y][x] = Tile:new(ForestFloorDirt)
      end

    end
  end

  for i=1,4 do
    for y=1, height do
      for x=1, width do
        if tileMap[y][x]:getName() == 'ForestFloorGrass' then
          local totalWalls = tileMap[y][x]:getLikeNeighbors(tileMap,x,y)

          if totalWalls >= 5 then tileMap[y][x] = Tile:new(ForestFloorGrass) else tileMap[y][x] = Tile:new(ForestFloorDirt) end
        else
          local totalOpen = tileMap[y][x]:getLikeNeighbors(tileMap,x,y)

          if totalOpen >= 5 then tileMap[y][x] = Tile:new(ForestFloorDirt) else tileMap[y][x] = Tile:new(ForestFloorGrass) end
        end
      end
    end
  end

  for y=1, height do
    for x=1, width do
      if tileMap[y][x]:getName() == 'ForestFloorGrass' then
        local ran = love.math.random(1,2)
        if ran > 1 then
          tileMap[y][x] = Tile:new(ForestFloorMoss)
        end
      end
    end
  end

  for i=1,4 do
    for y=1, height do
      for x=1, width do
        if tileMap[y][x]:getName() == 'ForestFloorGrass' then
          local totalWalls = tileMap[y][x]:getLikeNeighbors(tileMap,x,y)

          if totalWalls >= 5 then tileMap[y][x] = Tile:new(ForestFloorGrass) else tileMap[y][x] = Tile:new(ForestFloorMoss) end
        elseif tileMap[y][x]:getName() == 'ForestFloorMoss' then
          local totalOpen = tileMap[y][x]:getLikeNeighbors(tileMap,x,y)

          if totalOpen >= 5 then tileMap[y][x] = Tile:new(ForestFloorMoss) else tileMap[y][x] = Tile:new(ForestFloorGrass) end
        end
      end
    end
  end

  for i=1,10 do
    local success = false --place stairs down
    while success == false do
      local ranX = love.math.random(8,(width-8))
      local ranY = love.math.random(8, (height-8))
      if tileMap[ranY][ranX]:getName() == 'ForestFloorGrass' then
        tileMap[ranY][ranX] = Tile:new(ForestStairsDown)
        success = true
      end
    end
  end
  return tileMap
end

function makeForestBlocks(width, height)
  local tileMap = {}
  for y=1, height do
    tileMap[y] = {}
    for x=1, width do
      tileMap[y][x] = Block:new(BlockNull)
    end
  end
  return tileMap
end
