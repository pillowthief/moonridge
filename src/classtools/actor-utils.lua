require 'src/entities/actors'

function checkSpecialTile(x,y)
  local chunk = getLocalChunk('cen')
  local tiles = chunk:getTileMap()
  if tiles[y+1][x+1]:getIsStairs() == 'up' then

  elseif tiles[y+1][x+1]:getIsStairs() == 'down' then
    CHANGEMAP()
  end
end

function tryMoveActor(actor, newX, newY)
  local coords = THEATLAS:getPlayerChunk()
  if actor:getApproxGridX() <= 1 then --chunk to the west
    CHANGEMAP(coords[1],coords[2],coords[1]-1,coords[2],78,actor:getApproxGridY())
  elseif actor:getApproxGridX() >= MAP_WIDTH then --chunk to the east
    CHANGEMAP(coords[1],coords[2],coords[1]+1,coords[2],3,actor:getApproxGridY())
  elseif actor:getApproxGridY() <= 1 then --chunk to the north
    CHANGEMAP(coords[1],coords[2],coords[1],coords[2]-1,actor:getApproxGridX(),78)
  elseif actor:getApproxGridY() >= MAP_HEIGHT then --chunk to the south
    CHANGEMAP(coords[1],coords[2],coords[1],coords[2]+1,actor:getApproxGridX(),3)
  else
    local actualX, actualY, cols, len = BumpWorld:move(actor, newX, newY)

    --checkSpecialTile(actor:getApproxGridX(),actor:getApproxGridY())
    BumpWorld:update(actor, actualX, actualY)
    actor:setCoords(actualX, actualY)
    return actualX, actualY
  end
end

function removeActorFromActorlist(actor,actorlist)
  for i=1,#actorlist do
    if actorlist[i] == actor then
      table.remove(actorlist,i)
      return
    end
  end
end
