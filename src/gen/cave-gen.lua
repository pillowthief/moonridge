function makeCave(width, height)
  local tileMap = {}

  for y=1, height do
    tileMap[y] = {}
    for x=1, width do
      tileMap[y][x] = love.math.random(1,2)
    end
  end

  for y=1, 2 do
    for x=1, width do
      tileMap[y][x] = 2
    end
  end

  for x=1, 2 do
    for y=1, height do
      tileMap[y][x] = 2
    end
  end

  for y=(height-1), height do
    for x=1, width do
      tileMap[y][x] = 2
    end
  end

  for x=(width-1), width do
    for y=1, height do
      tileMap[y][x] = 2
    end
  end

  for i=1,4 do
    for y=3, (height-2) do
      for x=3, (width-2) do
        local totalWalls = 0 -- check for how many walls

        -- is self wall?
        if tileMap[y][x] == 2 then totalWalls = totalWalls + 1 end

        -- cardinal directions
        if tileMap[y+1][x] == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y][x+1] == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y-1][x] == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y][x-1] == 2 then totalWalls = totalWalls + 1 end

        -- orthagonal directions
        if tileMap[y+1][x+1] == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y+1][x-1] == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y-1][x+1] == 2 then totalWalls = totalWalls + 1 end
        if tileMap[y-1][x-1] == 2 then totalWalls = totalWalls + 1 end

        if totalWalls >= 5 then tileMap[y][x] = 2 else tileMap[y][x] = 1 end

      end
    end

  end

  return tileMap

end
