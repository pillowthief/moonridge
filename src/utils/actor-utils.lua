require 'src/entities/actors'

function tryMoveActor(lastX, lastY, newX, newY)
  local actualX, actualY, cols, len = BumpWorld:move(Player, newX, newY)
  if len > 0 then
    return false end --we bumped into something on the collision map
  moveActor(newX, newY)
  return true
end


function moveActor(newX, newY)
  Player:setCoords(newX,newY)
end
