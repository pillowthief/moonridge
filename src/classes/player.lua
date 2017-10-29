require 'src/entities/actors'
require 'src/classes/actor'

local masc_char = love.graphics.newImage 'assets/chars/masc_char.png'



Player = class('Player', Actor)

binser.registerClass(Player)

function Player:initialize(properties, x, y)
  properties = properties or {}

  Actor.initialize(self, properties,x,y)

  self._species = properties['species'] or 'human'
  self._playerImage = properties['playerImage'] or masc_char
end

function setPlayerImage(choice)
  self._playerImage = choice
end

function getPlayerImage()
  return masc_char
end

function addPlayer()
  local success = false
  if #ActorList > 0 then
    Player = ActorList[1]
    BumpWorld:add(Player,Player:getX(),Player:getY(),TileW,TileH)
    playerSprite:switch('standDown')
    success = true
  end
  while success == false do --attempt to add player at a random location on the map
    local x = love.math.random(10, MAP_WIDTH-10)
    local y = love.math.random(10, MAP_HEIGHT-10)
    if BlockTable[y][x]:getWalkable() == true then --if the location is walkable, use it
      local nX,nY = (x-1)*TileW,(y-1)*TileH
      Player = Player:new(ActorPlayer, nX, nY)
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
  image        = getPlayerImage(),
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() playerSprite:switch 'standDown' end,
  frames       = {
    {1, 1, 3, 1, .1},
  },
})

playerSprite:addAnimation('standDown', {
  image        = getPlayerImage(),
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 1, 2, 1, 1},
  },
})

playerSprite:addAnimation('walkRight', {
  image        = getPlayerImage(),
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() playerSprite:switch 'standRight' end,
  frames       = {
    {1, 3, 3, 3, .1},
  },
})

playerSprite:addAnimation('standRight', {
  image        = getPlayerImage(),
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 3, 2, 3, 1},
  },
})

playerSprite:addAnimation('walkLeft', {
  image        = getPlayerImage(),
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() playerSprite:switch 'standLeft' end,
  frames       = {
    {1, 2, 3, 2, .1},
  },
})

playerSprite:addAnimation('standLeft', {
  image        = getPlayerImage(),
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 2, 2, 2, 1},
  },
})

playerSprite:addAnimation('walkUp', {
  image        = getPlayerImage(),
  frameWidth   = 32,
  frameHeight  = 32,
  onReachedEnd = function() playerSprite:switch 'standUp' end,
  frames       = {
    {1, 4, 3, 4, .1},
  },
})

playerSprite:addAnimation('standUp', {
  image        = getPlayerImage(),
  frameWidth   = 32,
  frameHeight  = 32,
  frames       = {
    {2, 4, 2, 4, 1},
  },
})


return Player
