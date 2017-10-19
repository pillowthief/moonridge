require 'src/entities/actors'

function tryMoveActor(actor, newX, newY)
  local actualX, actualY, cols, len = BumpWorld:move(actor, newX, newY)
  return actualX, actualY
end
