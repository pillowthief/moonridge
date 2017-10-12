function addPlayer()
  ActorTable[24][40] = 4
  PlayerPosition = {24, 40}
end

function movePlayer(lastX, lastY, newX, newY)
    if newX < 1 or newX > MAP_WIDTH or newY < 1 or newY > MAP_HEIGHT then
      return end
    if TileTable[newY][newX] == nil then
      return end --attempted an invalid move off the map, reject
    ActorTable[lastY][lastX] = 3
    ActorTable[newY][newX] = 4
    PlayerPosition = {newY, newX}

    checkPlayerDistFromCamera()
end
