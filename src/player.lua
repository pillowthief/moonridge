require 'src/entities/actors'

function addPlayer()
  local success = false
  while success == false do
    local x = love.math.random(1, MAP_WIDTH)
    local y = love.math.random(1, MAP_HEIGHT)
    if BlockTable[y][x]:getWalkable() == true then
      ActorTable[y][x] = Actor:new(ActorPlayer, x, y)
      PlayerPosition = {y, x}
      success = true
    end
  end
end

function movePlayer(lastX, lastY, newX, newY)
  if tryMoveActor(lastX, lastY, newX, newY) == true then
    PlayerPosition = {newY, newX}
    checkPlayerDistFromCamera()
  end
end
