require 'src/entities/tiles'
require 'src/entities/blocks'

function makeCaveFloor(width, height)
  local tileMap = {}
  for y=1, height do
    tileMap[y] = {}
    for x=1, width do
      tileMap[y][x] = Tile:new(TileFloorTile)
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
      if ran == 2 then
        tileMap[y][x] = Block:new(BlockWallBlock)
      else
        tileMap[y][x] = Block:new(BlockNull)
      end
    end
  end

  for y=1, 2 do
    for x=1, width do
      tileMap[y][x] = Block:new(BlockWallBlock)
    end
  end



  for x=1, 2 do
    for y=1, height do
      tileMap[y][x] = Block:new(BlockWallBlock)
    end
  end

  for y=(height-1), height do
    for x=1, width do
      tileMap[y][x] = Block:new(BlockWallBlock)
    end
  end

  for x=(width-1), width do
    for y=1, height do
      tileMap[y][x] = Block:new(BlockWallBlock)
    end
  end


  for i=1,4 do
    for y=3, (height-2) do
      for x=3, (width-2) do
        local totalWalls = 0 -- check for how many walls

        -- is self wall?
        if tileMap[y][x]:getSprite() == 'wall' then totalWalls = totalWalls + 1 end

        -- cardinal directions
        if tileMap[y+1][x]:getSprite() == 'wall' then totalWalls = totalWalls + 1 end
        if tileMap[y][x+1]:getSprite() == 'wall' then totalWalls = totalWalls + 1 end
        if tileMap[y-1][x]:getSprite() == 'wall' then totalWalls = totalWalls + 1 end
        if tileMap[y][x-1]:getSprite() == 'wall' then totalWalls = totalWalls + 1 end

        -- orthagonal directions
        if tileMap[y+1][x+1]:getSprite() == 'wall' then totalWalls = totalWalls + 1 end
        if tileMap[y+1][x-1]:getSprite() == 'wall' then totalWalls = totalWalls + 1 end
        if tileMap[y-1][x+1]:getSprite() == 'wall' then totalWalls = totalWalls + 1 end
        if tileMap[y-1][x-1]:getSprite() == 'wall' then totalWalls = totalWalls + 1 end

        if totalWalls >= 5 then tileMap[y][x] = Block:new(BlockWallBlock) else tileMap[y][x] = Block:new(BlockNull) end

      end
    end

  end

  for y=1, height do
    for x=1, width do
      if tileMap[y][x]:getSprite() == 'wall' then
        BumpWorld:add(tileMap[y][x],x,y,1,1)
      end
    end
  end

  return tileMap

end
