require 'src/entities/actors'

function checkSpecialTile(x,y)
  if TileTable[y+1][x+1]:getIsStairs() == 'up' then

  elseif TileTable[y+1][x+1]:getIsStairs() == 'down' then
    CHANGEMAP()
  end
end

function tryMoveActor(actor, newX, newY)
  local actualX, actualY, cols, len = BumpWorld:move(actor, newX, newY)

  checkSpecialTile(actor:getApproxGridX(),actor:getApproxGridY())

  return actualX, actualY
end
