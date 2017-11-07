function generateSurfaceTiles(wet,temp,water)

  local tileMap = {}
  for y=1, 80 do
    tileMap[y] = {}
    for x=1, 80 do
      local damp = wet[math.ceil(y/10)][math.ceil(x/10)]
      if damp < 4 then
        tileMap[y][x] = Tile:new(SoilFloorSand)
      elseif damp < 8 then
        tileMap[y][x] = Tile:new(SoilFloorDirt)
      else
        tileMap[y][x] = Tile:new(SoilFloorLoam)
      end
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
