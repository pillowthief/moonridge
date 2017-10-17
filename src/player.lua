function addPlayer()
  local success = false
  while success == false do
    local x = love.math.random(1, MAP_WIDTH)
    local y = love.math.random(1, MAP_HEIGHT)
    if BlockTable[y][x]:getWalkable() == true then
      ActorTable[y][x] = 4
      PlayerPosition = {y, x}
      success = true
    end
  end
end

function movePlayer(lastX, lastY, newX, newY)
    if newX < 1 or newX > MAP_WIDTH or newY < 1 or newY > MAP_HEIGHT then
      return end
    if TileTable[newY][newX] == nil then
      return end --attempted an invalid move off the map, reject
    if BlockTable[newY][newX]:getWalkable() == false then
      return end --attempted to move into an unwalkable place
    ActorTable[lastY][lastX] = 3
    ActorTable[newY][newX] = 4
    PlayerPosition = {newY, newX}local x = love.math.random(1, MAP_WIDTH)
    local y = love.math.random(1, MAP_HEIGHT)

    checkPlayerDistFromCamera()
end
