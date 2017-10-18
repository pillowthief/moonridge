require 'src/entities/actors'

function makeActorTable(width, height)
  local tileMap = {}

  for y=1, height do
    tileMap[y] = {}
    for x=1, width do
      tileMap[y][x] = Actor:new(ActorNull,x,y)
    end
  end

  return tileMap
end

function tryMoveActor(lastX, lastY, newX, newY)
  if newX < 1 or newX > MAP_WIDTH or newY < 1 or newY > MAP_HEIGHT then
    return false end
  if TileTable[newY][newX] == nil then
    return false end --attempted an invalid move off the map, reject
  if BlockTable[newY][newX]:getWalkable() == false then
    return false end --attempted to move into an unwalkable place
  moveActor(lastX, lastY, newX, newY)
  return true
end


function moveActor(lastX, lastY, newX, newY)
  local mover = ActorTable[lastY][lastX]
  ActorTable[lastY][lastX] = Actor:new(ActorNull,lastX,lastY)
  ActorTable[newY][newX] = mover
end
