function generateSurfaceTiles(atlas,cX,cY,wet,temp,water)
  local tileMap = {}
  for y=1, 80 do
    tileMap[y] = {}
    for x=1, 80 do
      local damp = wet[math.ceil(y/10)][math.ceil(x/10)]
      local heat = temp[math.ceil(y/10)][math.ceil(x/10)]
      local ran = love.math.random(1,5)
      if damp+ran < 6 then
        tileMap[y][x] = Tile:new(SoilFloorSand)
      elseif damp+ran < 12 then
        tileMap[y][x] = Tile:new(SoilFloorDirt)
      else
        tileMap[y][x] = Tile:new(SoilFloorLoam)
      end
    end
  end

  --are there neighbor chunks? they influence us!
  if atlas:getChunkAt(cX,cY-1) ~= false then --north
    local otherChunk = atlas:getChunkAt(cX,cY-1)
    local otherTiles = otherChunk:getTileMap()
    for x=1,80 do
      if otherTiles[80][x]:getName() == 'SoilFloorSand' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[1][x] = Tile:new(SoilFloorSand)
          tileMap[2][x] = Tile:new(SoilFloorSand)
        else
          tileMap[1][x] = Tile:new(SoilFloorSand)
          tileMap[2][x] = Tile:new(SoilFloorSand)
          tileMap[3][x] = Tile:new(SoilFloorSand)
          tileMap[4][x] = Tile:new(SoilFloorSand)
        end
      elseif otherTiles[80][x]:getName() == 'SoilFloorDirt' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[1][x] = Tile:new(SoilFloorDirt)
          tileMap[2][x] = Tile:new(SoilFloorDirt)
        else
          tileMap[1][x] = Tile:new(SoilFloorDirt)
          tileMap[2][x] = Tile:new(SoilFloorDirt)
          tileMap[3][x] = Tile:new(SoilFloorDirt)
          tileMap[4][x] = Tile:new(SoilFloorDirt)
        end
      elseif otherTiles[80][x]:getName() == 'SoilFloorLoam' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[1][x] = Tile:new(SoilFloorLoam)
          tileMap[2][x] = Tile:new(SoilFloorLoam)
        else
          tileMap[1][x] = Tile:new(SoilFloorLoam)
          tileMap[2][x] = Tile:new(SoilFloorLoam)
          tileMap[3][x] = Tile:new(SoilFloorLoam)
          tileMap[4][x] = Tile:new(SoilFloorLoam)
        end
      end
    end
  end

  if atlas:getChunkAt(cX+1,cY) ~= false then --east
    local otherChunk = atlas:getChunkAt(cX+1,cY)
    local otherTiles = otherChunk:getTileMap()
    for y=1,80 do
      if otherTiles[y][1]:getName() == 'SoilFloorSand' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[y][80] = Tile:new(SoilFloorSand)
          tileMap[y][79] = Tile:new(SoilFloorSand)
        else
          tileMap[y][80] = Tile:new(SoilFloorSand)
          tileMap[y][79] = Tile:new(SoilFloorSand)
          tileMap[y][78] = Tile:new(SoilFloorSand)
          tileMap[y][77] = Tile:new(SoilFloorSand)
        end
      elseif otherTiles[y][1]:getName() == 'SoilFloorDirt' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[y][80] = Tile:new(SoilFloorDirt)
          tileMap[y][79] = Tile:new(SoilFloorDirt)
        else
          tileMap[y][80] = Tile:new(SoilFloorDirt)
          tileMap[y][79] = Tile:new(SoilFloorDirt)
          tileMap[y][78] = Tile:new(SoilFloorDirt)
          tileMap[y][77] = Tile:new(SoilFloorDirt)
        end
      elseif otherTiles[y][1]:getName() == 'SoilFloorLoam' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[y][80] = Tile:new(SoilFloorLoam)
          tileMap[y][79] = Tile:new(SoilFloorLoam)
        else
          tileMap[y][80] = Tile:new(SoilFloorLoam)
          tileMap[y][79] = Tile:new(SoilFloorLoam)
          tileMap[y][78] = Tile:new(SoilFloorLoam)
          tileMap[y][77] = Tile:new(SoilFloorLoam)
        end
      end
    end
  end

  if atlas:getChunkAt(cX,cY+1) ~= false then --south
    local otherChunk = atlas:getChunkAt(cX,cY+1)
    local otherTiles = otherChunk:getTileMap()
    for x=1,80 do
      if otherTiles[1][x]:getName() == 'SoilFloorSand' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[80][x] = Tile:new(SoilFloorSand)
          tileMap[79][x] = Tile:new(SoilFloorSand)
        else
          tileMap[80][x] = Tile:new(SoilFloorSand)
          tileMap[79][x] = Tile:new(SoilFloorSand)
          tileMap[78][x] = Tile:new(SoilFloorSand)
          tileMap[77][x] = Tile:new(SoilFloorSand)
        end
      elseif otherTiles[1][x]:getName() == 'SoilFloorDirt' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[80][x] = Tile:new(SoilFloorDirt)
          tileMap[79][x] = Tile:new(SoilFloorDirt)
        else
          tileMap[80][x] = Tile:new(SoilFloorDirt)
          tileMap[79][x] = Tile:new(SoilFloorDirt)
          tileMap[78][x] = Tile:new(SoilFloorDirt)
          tileMap[77][x] = Tile:new(SoilFloorDirt)
        end
      elseif otherTiles[1][x]:getName() == 'SoilFloorLoam' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[80][x] = Tile:new(SoilFloorLoam)
          tileMap[79][x] = Tile:new(SoilFloorLoam)
        else
          tileMap[80][x] = Tile:new(SoilFloorLoam)
          tileMap[79][x] = Tile:new(SoilFloorLoam)
          tileMap[78][x] = Tile:new(SoilFloorLoam)
          tileMap[77][x] = Tile:new(SoilFloorLoam)
        end
      end
    end
  end

  if atlas:getChunkAt(cX-1,cY) ~= false then --west
    local otherChunk = atlas:getChunkAt(cX-1,cY)
    local otherTiles = otherChunk:getTileMap()
    for y=1,80 do
      if otherTiles[y][80]:getName() == 'SoilFloorSand' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[y][1] = Tile:new(SoilFloorSand)
          tileMap[y][2] = Tile:new(SoilFloorSand)
        else
          tileMap[y][1] = Tile:new(SoilFloorSand)
          tileMap[y][2] = Tile:new(SoilFloorSand)
          tileMap[y][3] = Tile:new(SoilFloorSand)
          tileMap[y][4] = Tile:new(SoilFloorSand)
        end
      elseif otherTiles[y][80]:getName() == 'SoilFloorDirt' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[y][1] = Tile:new(SoilFloorDirt)
          tileMap[y][2] = Tile:new(SoilFloorDirt)
        else
          tileMap[y][1] = Tile:new(SoilFloorDirt)
          tileMap[y][2] = Tile:new(SoilFloorDirt)
          tileMap[y][3] = Tile:new(SoilFloorDirt)
          tileMap[y][4] = Tile:new(SoilFloorDirt)
        end
      elseif otherTiles[y][80]:getName() == 'SoilFloorLoam' then
        local chance = love.math.random(1,2)
        if chance < 2 then
          tileMap[y][1] = Tile:new(SoilFloorLoam)
          tileMap[y][2] = Tile:new(SoilFloorLoam)
        else
          tileMap[y][1] = Tile:new(SoilFloorLoam)
          tileMap[y][2] = Tile:new(SoilFloorLoam)
          tileMap[y][3] = Tile:new(SoilFloorLoam)
          tileMap[y][4] = Tile:new(SoilFloorLoam)
        end
      end
    end
  end


  for i=1,5 do
    for y=2, 79 do
      for x=2, 79 do
        local totalSame = tileMap[y][x]:getLikeNeighbors(tileMap,x,y)
        if totalSame < 5 then
          local chance = love.math.random(1,3)
          if chance == 1 then
            local ranX = ranPosNeg()
            local ranY = 0
          elseif chance == 2 then
            local ranX = 0
            local ranY = ranPosNeg()
          elseif chance == 3 then
            local ranX = ranPosNeg()
            local ranY = ranPosNeg()
          end
          local ranX = ranPosNeg()
          local ranY = ranPosNeg()
          if tileMap[y+ranY][x+ranX]:getName() == 'SoilFloorDirt' then
            tileMap[y][x] = Tile:new(SoilFloorDirt)
          elseif tileMap[y+ranY][x+ranX]:getName() == 'SoilFloorSand' then
            tileMap[y][x] = Tile:new(SoilFloorSand)
          elseif tileMap[y+ranY][x+ranX]:getName() == 'SoilFloorLoam' then
            tileMap[y][x] = Tile:new(SoilFloorLoam)
          end
        end
      end
    end
  end

  for y=1,80 do
    if tileMap[y][2]:getName() == 'SoilFloorDirt' then
      tileMap[y][1] = Tile:new(SoilFloorDirt)
    elseif tileMap[y][2]:getName() == 'SoilFloorSand' then
      tileMap[y][1] = Tile:new(SoilFloorSand)
    elseif tileMap[y][2]:getName() == 'SoilFloorLoam' then
      tileMap[y][1] = Tile:new(SoilFloorLoam)
    end
    if tileMap[y][79]:getName() == 'SoilFloorDirt' then
      tileMap[y][80] = Tile:new(SoilFloorDirt)
    elseif tileMap[y][79]:getName() == 'SoilFloorSand' then
      tileMap[y][80] = Tile:new(SoilFloorSand)
    elseif tileMap[y][79]:getName() == 'SoilFloorLoam' then
      tileMap[y][80] = Tile:new(SoilFloorLoam)
    end
  end

  for x=1,80 do
    if tileMap[2][x]:getName() == 'SoilFloorDirt' then
      tileMap[1][x] = Tile:new(SoilFloorDirt)
    elseif tileMap[2][x]:getName() == 'SoilFloorSand' then
      tileMap[1][x] = Tile:new(SoilFloorSand)
    elseif tileMap[2][x]:getName() == 'SoilFloorLoam' then
      tileMap[1][x] = Tile:new(SoilFloorLoam)
    end
    if tileMap[79][x]:getName() == 'SoilFloorDirt' then
      tileMap[80][x] = Tile:new(SoilFloorDirt)
    elseif tileMap[79][x]:getName() == 'SoilFloorSand' then
      tileMap[80][x] = Tile:new(SoilFloorSand)
    elseif tileMap[79][x]:getName() == 'SoilFloorLoam' then
      tileMap[80][x] = Tile:new(SoilFloorLoam)
    end
  end
--GROUND COVER
--hot and "dry"
--cool and "dry"
--hot and wet
--cool and wet

--WATER!!!

--FEATURES

--ECOSYSTEM
  return tileMap
end

function ranPosNeg()
  local num
  local chance = love.math.random(1,2)
  if chance == 1 then
    num = 1
  else
    num = -1
  end
  return num
end
