local Grid = require ("lib/jumper/grid") -- The grid class
local Pathfinder = require ("lib/jumper/pathfinder") -- The pathfinder class
require('src/render/worldgen-render')

local zoneSize = 384

local curColorMap = {}
for y=1,zoneSize do
  curColorMap[y] = {}
  for x=1,zoneSize do
    curColorMap[y][x] = {79, 202, 209, 255}
  end
end

function setCurColorMap(tiles, typetag)
  local ptiles = {}
  if typetag == 'climate' then
    for y=1,zoneSize do
      ptiles[y] = {}
      for x=1,zoneSize do
        ptiles[y][x] = getColorFromTemp(tiles[y][x])
      end
    end
  end
  if typetag == 'biome' then
    for y=1,zoneSize do
      ptiles[y] = {}
      for x=1,zoneSize do
        ptiles[y][x] = getColorFromBiome(tiles[y][x])
      end
    end
  end
  curColorMap = ptiles
end

local takeNextStep = true
local generatorStarted = false
function setNextStep(bool)
  if generatorStarted == true then
    takeNextStep = bool
  end
end

function updateGenerator()
  if generatorStarted == true then
    if returnWGStep() == 1 then
      stepWGScreenForward()
    end
    generateOverworld()
  end
end

local tiles,tempMap,wetMap,rivers,lakes = {},{},{},{},{}
function generateOverworld()
  generatorStarted = true
    if takeNextStep == true then
      if tempMap[1] == nil then
        tempMap = generateTemperatureMap()
        stepForwardActiveBar()
      elseif wetMap[1] == nil then
        wetMap = generateTemperatureMap()
        stepForwardActiveBar()
      elseif tiles[1] == nil then
        for y=1,zoneSize do
          tiles[y] = {}
          for x=1,zoneSize do
            tiles[y][x] = getBiomeFromTM(tempMap[y][x],wetMap[y][x])
          end
        end

        setCurColorMap(tiles, 'biome')
        pushToStoredMaps(curColorMap)
        stepForwardActiveBar()
      elseif rivers[1] == nil then
        rivers = generateRivers(wetMap)
        for y=1,zoneSize do
          for x=1,zoneSize do
            if rivers[y][x] == true then
              tiles[y][x] = {124, 255, 248, 255}
              curColorMap[y][x] = {124, 255, 248, 255}
            end
          end
        end
        stepForwardActiveBar()
      elseif lakes[1] == nil then
        lakes = generateLakes(wetMap,rivers)

        for y=1,zoneSize do
          for x=1,zoneSize do
            if rivers[y][x] or lakes[y][x] == true then
              tiles[y][x] = {124, 255, 248, 255}
              curColorMap[y][x] = {124, 255, 248, 255}
            end
          end
        end
        stepForwardActiveBar()
      else
        stepWGScreenForward()
        stepForwardActiveBar()
        THEATLAS = Atlas:new(wetMap,tempMap,rivers,lakes)
        generatorStarted = false
        tiles,tempMap,wetMap,rivers,lakes = {},{},{},{},{}
      end
      takeNextStep = false
    end
  return tiles
end

function generateTemperatureMap()
  local map = {}
  for y=1,zoneSize do
    map[y] = {}
    for x=1,zoneSize do
      map[y][x] = love.math.random(1, 10)
    end
  end

  --setCurColorMap(map, 'climate')
  --pushToStoredMaps(curColorMap)

  for i=1,4000000 do
    local y = love.math.random(2,(zoneSize-1))
    local x = love.math.random(2,(zoneSize-1))
    map[y+1][x] = map[y][x]
    map[y-1][x] = map[y][x]
    map[y][x+1] = map[y][x]
    map[y][x-1] = map[y][x]
    if i%500000 == 0 then
      --setCurColorMap(map, 'climate')
      --pushToStoredMaps(curColorMap)
    end
  end

  for i=1,600000 do
    local y = love.math.random(2,zoneSize-1)
    local x = love.math.random(2,zoneSize-1)
    if map[y][x] > map[y+1][x] then
      map[y+1][x] = map[y+1][x] + 1
    elseif map[y][x] < map[y+1][x] then
      map[y+1][x] = map[y+1][x] - 1
    end
    if map[y][x] > map[y-1][x] then
      map[y-1][x] = map[y-1][x] + 1
    elseif map[y][x] < map[y-1][x] then
      map[y-1][x] = map[y-1][x] - 1
    end
    if map[y][x] > map[y][x+1] then
      map[y][x+1] = map[y][x+1] + 1
    elseif map[y][x] < map[y][x+1] then
      map[y][x+1] = map[y][x+1] - 1
    end
    if map[y][x] > map[y][x-1] then
      map[y][x-1] = map[y][x-1] + 1
    elseif map[y][x] < map[y][x-1] then
      map[y][x-1] = map[y][x-1] - 1
    end

    if i%100000 == 0 then
      --setCurColorMap(map, 'climate')
      --pushToStoredMaps(curColorMap)
    end
  end

  for y=2,#map-1 do
    for x=2,#map[y]-1 do
      local me = map[y][x]
      if map[y+1][x] == me or map[y-1][x] == me or
      map[y][x+1] == me or map[y][x-1] == me then
        me = me
      else
        local dice = love.math.random(1,4)
        if dice == 1 then me = map[y+1][x]
        elseif dice == 2 then me = map[y-1][x]
        elseif dice == 3 then me = map[y][x+1]
        else me = map[y][x-1] end
      end
    end
  end

  setCurColorMap(map, 'climate')
  pushToStoredMaps(curColorMap)

  return map
end

function generateMoistureMap()
end

function adjustMoistureforLakes()

end

function getColorFromTemp(number)
  if number == 1 then return {50, 65, 140, 255} end
  if number == 2 then return {77, 107, 181, 255} end
  if number == 3 then return {79, 202, 209, 255} end
  if number == 4 then return {89, 247, 157, 255} end
  if number == 5 then return {87, 237, 92, 255} end
  if number == 6 then return {75, 219, 59, 255} end
  if number == 7 then return {132, 242, 53, 255} end
  if number == 8 then return {187, 242, 58, 255} end
  if number == 9 then return {217, 226, 45, 255} end
  if number == 10 then return {211, 76, 31, 255} end
end

local biomeTable = {
  'coldRocky', 'coldPlains', 'coldForest','coldRainforest','coldSwamp',
  'modRocky', 'modPlains', 'modForest', 'modRainforest', 'modSwamp',
  'warmRocky', 'warmPlains', 'warmForest', 'warmRainforest', 'warmSwamp'
}

function getBiomeFromTM(temp,moist)
  local biome
  if temp < 4 and moist < 3 then biome = biomeTable[1]
  elseif temp < 4 and moist < 5 then biome = biomeTable[2]
  elseif temp < 4 and moist < 8 then biome = biomeTable[3]
  elseif temp < 4 and moist < 10 then biome = biomeTable[4]
  elseif temp < 4 and moist == 10 then biome = biomeTable[5]
  elseif temp < 8 and moist < 3 then biome = biomeTable[6]
  elseif temp < 8 and moist < 5 then biome = biomeTable[7]
  elseif temp < 8 and moist < 8 then biome = biomeTable[8]
  elseif temp < 8 and moist < 10 then biome = biomeTable[9]
  elseif temp < 8 and moist == 10 then biome = biomeTable[10]
  elseif temp >=8 and moist < 3 then biome = biomeTable[11]
  elseif temp >=8 and moist < 5 then biome = biomeTable[12]
  elseif temp >=8 and moist < 8 then biome = biomeTable[13]
  elseif temp >=8 and moist < 10 then biome = biomeTable[14]
  elseif temp >=8 and moist == 10 then biome = biomeTable[15]
  end
  return biome
end

function getColorFromBiome(biome)
  if biome == 'coldRocky' then
    return {56, 66, 81, 255}
  end
  if biome == 'coldPlains' then
    return {142, 206, 186, 255}
  end
  if biome == 'coldForest' then
    return {33, 188, 95, 255}
  end
  if biome == 'coldRainforest' then
    return {16, 160, 90, 255}
  end
  if biome == 'coldSwamp' then
    return {67, 18, 91, 255}
  end


  if biome == 'modRocky' then
    return {53, 79, 55, 255}
  end
  if biome == 'modPlains' then
    return {205, 239, 119, 255}
  end
  if biome == 'modForest' then
    return {81, 204, 75, 255}
  end
  if biome == 'modRainforest' then
    return {5, 140, 14, 255}
  end
  if biome == 'modSwamp' then
    return {89, 16, 86, 255}
  end


  if biome == 'warmRocky' then
    return {81, 74, 55, 255}
  end
  if biome == 'warmPlains' then
    return {219, 190, 103, 255}
  end
  if biome == 'warmForest' then
    return {124, 209, 33, 255}
  end
  if biome == 'warmRainforest' then
    return {65, 147, 7, 255}
  end
  if biome == 'warmSwamp' then
    return {114, 13, 55, 255}
  end
end

function generateRivers(wetmap)
  local riverMap = {}
  local success = false

  while success == false do
    for y=1,#wetmap do
      riverMap[y] = {}
        for x=1, #wetmap[y] do
          riverMap[y][x] = false
        end
    end

    local totalRivers = love.math.random(6,10)
    local riverStarts = {}
    local riverEnds = {}

    while #riverStarts < totalRivers do
      local dice = love.math.random(1,3)
      if dice == 1 then
        local x = 1
        local y = love.math.random(1,(zoneSize/2))
        if wetmap[y][x] > 3 then
          riverStarts[#riverStarts+1] = {x,y}
        end
      end
      if dice == 2 then
        local x = love.math.random(1,zoneSize)
        local y = 1
        if wetmap[y][x] > 3 then
          riverStarts[#riverStarts+1] = {x,y}
        end
      end
      if dice == 3 then
        local x = zoneSize
        local y = love.math.random(1,(zoneSize/2))
        if wetmap[y][x] > 3 then
          riverStarts[#riverStarts+1] = {x,y}
        end
      end
    end

    while #riverEnds < 2 do
      local dice = love.math.random(1,3)
      if dice == 1 then
        local x = 1
        local y = love.math.random((zoneSize-10),zoneSize)
        if wetmap[y][x] > 3 then
          riverEnds[#riverEnds+1] = {x,y}
        end
      end
      if dice == 2 then
        local x = love.math.random(1,zoneSize)
        local y = zoneSize
        if wetmap[y][x] > 3 then
          riverEnds[#riverEnds+1] = {x,y}
        end
      end
      if dice == 3 then
        local x = zoneSize
        local y = love.math.random((zoneSize-10),zoneSize)
        if wetmap[y][x] > 3 then
          riverEnds[#riverEnds+1] = {x,y}
        end
      end
    end

    local riverGrid = {}

    for y=1,#wetmap do
      riverGrid[y] = {}
      for x=1,#wetmap[y] do
        if wetmap[y][x] > 4 then
          riverGrid[y][x] = 0
        else
          riverGrid[y][x] = 1
        end
      end
    end

    local grid = Grid(riverGrid)
    local myFinder = Pathfinder(grid, 'JPS', 0)

    for i=1,totalRivers do
      local riverWalker = {}
      local dice = love.math.random(1,2)
        local path = myFinder:getPath(riverStarts[i][1], riverStarts[i][2], riverEnds[dice][1], riverEnds[dice][2])
        if path then
          for node, count in path:nodes() do
            if count == 1 then
              riverWalker = {node:getX(),node:getY()}
              riverMap[node:getY()][node:getX()] = true
            end
            local goalX, goalY = node:getX(),node:getY()
            local stillWalking = true
            local sanityCounter = 0
            local flip = false
            while stillWalking == true do
              if riverWalker[1] == goalX and riverWalker[2] == goalY then
                stillWalking = false
                sanityCounter = 0
              else
                if flip == false then
                  if (riverWalker[1] - goalX) < 0 then --we're going right
                    riverWalker[1] = riverWalker[1] + 1
                  else -- we're going left
                    riverWalker[1] = riverWalker[1] - 1
                  end
                  flip = true
                else
                  if (riverWalker[2] - goalY) < 0 then --we're going right
                    riverWalker[2] = riverWalker[2] + 1
                  else -- we're going left
                    riverWalker[2] = riverWalker[2] - 1
                  end
                  flip = false
                end

                if riverWalker[1] < 1 then riverWalker[1] = 1 end
                if riverWalker[1] > zoneSize then riverWalker[1] = zoneSize end
                if riverWalker[2] < 1 then riverWalker[2] = 1 end
                if riverWalker[2] > zoneSize then riverWalker[2] = zoneSize end

                riverMap[riverWalker[2]][riverWalker[1]] = true
                sanityCounter = sanityCounter + 1
              end
              if sanityCounter > 300 then
                stillWalking = false
              end
            end
    	    end
      end
    end

    local quickCount = 0
    for y=1,#riverMap do
      for x=1,#riverMap[y] do
        if riverMap[y][x] == true then
          quickCount = quickCount + 1
        end
      end
    end
    if quickCount < 2000 then
      success = false
    else
      success = true
    end
  end

  return riverMap
end

function generateLakes(wetmap,rivers)
  local lakeMap = {}
  local lakeSeeds = {}
  local lakeGrid = {}
  for y=1,#wetmap do
    lakeMap[y] = {}
    lakeGrid[y] = {}
      for x=1, #wetmap do
        lakeMap[y][x] = false
        lakeGrid[y][x] = 1
      end
  end

  local seedPlaceSuccess = false
  while seedPlaceSuccess == false do
    for i=1,20 do
      local ranY = love.math.random(41,(#rivers-41))
      local ranX = love.math.random(41,(#rivers[ranY]-41))
      if rivers[ranY][ranX] == true then
        lakeSeeds[#lakeSeeds+1] = {ranX,ranY}
        lakeMap[ranY][ranX] = true
      end
    end
    if #lakeSeeds < 7 and #lakeSeeds > 3 then
      seedPlaceSuccess = true
    end
  end

  for i=1,#lakeSeeds do
    local ranW = love.math.random(20,40)
    local ranH = love.math.random(20,40)
    local y,x = (lakeSeeds[i][2] - ranH),(lakeSeeds[i][1] - ranW)
    for h=y,(y+(ranH*2)) do
      for w=x,(x+(ranW*2)) do
        local value = love.math.noise( w, h )
        if value > 0.3 then
          if wetmap[h][w] > 6 then
            lakeMap[h][w] = true
          end
        end
      end
    end
      for r=1,4 do
        for h=y,(y+(ranH*2)) do
          for w=x,(x+(ranW*2)) do
            local count = 0
            if lakeMap[h][w] == true then count = count+1 end

            if lakeMap[h+1][w] == true then count = count+1 end
            if lakeMap[h-1][w] == true then count = count+1 end
            if lakeMap[h][w+1] == true then count = count+1 end
            if lakeMap[h][w-1] == true then count = count+1 end

            if lakeMap[h+1][w+1] == true then count = count+1 end
            if lakeMap[h+1][w-1] == true then count = count+1 end
            if lakeMap[h-1][w+1] == true then count = count+1 end
            if lakeMap[h-1][w+1] == true then count = count+1 end

            if count > 4 then
              lakeMap[h][w] = true
            else
              lakeMap[h][w] = false
            end
          end
        end
    end
  end

  for h=1,#lakeGrid do
    for w=1,#lakeGrid[h] do
      if lakeMap[h][w] == true or rivers[h][w] == true then
        lakeGrid[h][w] = 0
      else
        lakeGrid[h][w] = 1
      end
    end
  end


  local grid = Grid(lakeGrid)
  local myFinder = Pathfinder(grid, 'JPS', 0)
  --prune lake bits that don't touch rivers

  for h=1,zoneSize do
    for w=1, zoneSize do
      if lakeMap[h][w] == true then
        local touchesRiver = false
        for s=1,#lakeSeeds do
          local path = myFinder:getPath(w, h, lakeSeeds[s][1], lakeSeeds[s][2])
          if path then
            touchesRiver = true
          end
        end
        if touchesRiver == false then
          lakeMap[h][w] = false
        end
      end
    end
  end
  return lakeMap
end
