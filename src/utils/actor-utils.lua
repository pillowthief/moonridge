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
  local actualX, actualY, cols, len = BumpWorld:move(Player, newX, newY)
  if len > 0 then
    return false end --we bumped into something on the collision map
  moveActor(lastX, lastY, newX, newY)
  return true
end


function moveActor(lastX, lastY, newX, newY)
  local mover = ActorTable[lastY][lastX]
  ActorTable[lastY][lastX] = Actor:new(ActorNull,lastX,lastY)
  ActorTable[newY][newX] = mover
  ActorGlyphs = redrawGlyphs(ActorTable)
end
