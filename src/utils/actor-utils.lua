function makeActorTable(width, height)
  local tileMap = {}

  for y=1, height do
    tileMap[y] = {}
    for x=1, width do
      tileMap[y][x] = 3
    end
  end

  return tileMap
end
