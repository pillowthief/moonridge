require 'src/entities/actors'

function addPlayer()
  local success = false
  while success == false do --attempt to add player at a random location on the map
    local x = love.math.random(1, MAP_WIDTH)
    local y = love.math.random(1, MAP_HEIGHT)
    if BlockTable[y][x]:getWalkable() == true then --if the location is walkable, use it
      Player = Actor:new(ActorPlayer, x, y)
      ActorTable[y][x] = Player
      BumpWorld:add(Player,x,y,1,1)
      PlayerPosition = {y, x}
      success = true
    end
  end
end

function movePlayer(lastX, lastY, newX, newY) --specialized wrapper for the tryMoveActor function
  if tryMoveActor(lastX, lastY, newX, newY) == true then
    PlayerPosition = {newY, newX}
    BumpWorld:update(Player, newX, newY)
    checkPlayerDistFromCamera()
  end
end
