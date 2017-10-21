require 'src/entities/actors'

function addPlayer()
  if #ActorList > 0 then
    Player = ActorList[1]
    BumpWorld:add(Player,nX,nY,TileW,TileH)
    playerSprite:switch('standDown')
    success = true
  end
  local success = false
  while success == false do --attempt to add player at a random location on the map
    local x = love.math.random(1, MAP_WIDTH)
    local y = love.math.random(1, MAP_HEIGHT)
    if BlockTable[y][x]:getWalkable() == true then --if the location is walkable, use it
      local nX,nY = (x-1)*TileW,(y-1)*TileH
      Player = Actor:new(ActorPlayer, nX, nY)
      ActorList[#ActorList + 1] = Player
      BumpWorld:add(Player,nX,nY,TileW,TileH)
      playerSprite:switch('standDown')
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


playerSprite = sodapop.newAnimatedSprite(16, 16)
playerSprite:addAnimation('walkDown', {
  image        = love.graphics.newImage 'assets/masc_char_down.png',
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() playerSprite:switch 'standDown' end,
  frames       = {
    {1, 1, 3, 1, .1},
  },
})

playerSprite:addAnimation('standDown', {
  image        = love.graphics.newImage 'assets/masc_char_down.png',
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 1, 2, 1, 1},
  },
})

playerSprite:addAnimation('walkRight', {
  image        = love.graphics.newImage 'assets/masc_char_right.png',
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() playerSprite:switch 'standRight' end,
  frames       = {
    {1, 1, 3, 1, .1},
  },
})

playerSprite:addAnimation('standRight', {
  image        = love.graphics.newImage 'assets/masc_char_right.png',
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 1, 2, 1, 1},
  },
})

playerSprite:addAnimation('walkLeft', {
  image        = love.graphics.newImage 'assets/masc_char_left.png',
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() playerSprite:switch 'standLeft' end,
  frames       = {
    {1, 1, 3, 1, .1},
  },
})

playerSprite:addAnimation('standLeft', {
  image        = love.graphics.newImage 'assets/masc_char_left.png',
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 1, 2, 1, 1},
  },
})

playerSprite:addAnimation('walkUp', {
  image        = love.graphics.newImage 'assets/masc_char_up.png',
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() playerSprite:switch 'standUp' end,
  frames       = {
    {1, 1, 3, 1, .1},
  },
})

playerSprite:addAnimation('standUp', {
  image        = love.graphics.newImage 'assets/masc_char_up.png',
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 1, 2, 1, 1},
  },
})
