require 'src/entities/actors'

function addPlayer()
  local success = false
  while success == false do --attempt to add player at a random location on the map
    local x = love.math.random(1, MAP_WIDTH)
    local y = love.math.random(1, MAP_HEIGHT)
    if BlockTable[y][x]:getWalkable() == true then --if the location is walkable, use it
      local nX,nY = (x-1)*TileW,(y-1)*TileH
      Player = Actor:new(ActorPlayer, nX, nY)
      ActorList[#ActorList + 1] = Player
      BumpWorld:add(Player,nX,nY,TileW,TileH)
      success = true
    end
  end
end

function movePlayer(newX, newY) --specialized wrapper for the tryMoveActor function
  coords = {tryMoveActor(Player, newX, newY)}
    Player:setCoords(coords[1], coords[2])
    BumpWorld:update(Player, coords[1], coords[2])
    checkPlayerDistFromCamera()
end
