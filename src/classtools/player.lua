require 'src/entities/actors'
require 'src/classes/actor'


GamePlayer = class('GamePlayer', Actor)

binser.registerClass(GamePlayer)

function GamePlayer:initialize(properties, x, y)
  properties = properties or {}

  Actor.initialize(self, properties,x,y)

  self._species = properties['species'] or 'human'
  self._playerImage = properties['playerImage'] or 'masc_char'
end

function GamePlayer:setPlayerImage(choice)
  self._playerImage = choice
end

function GamePlayer:getPlayerImage()
  return self._playerImage
end

function setPlayerSprite()
  if Player._playerImage == 'masc_char' then
    return mascCharSprite
  end
  if Player._playerImage == 'fem_char' then
    return femCharSprite
  end
end

function addPlayer()
  local success = false
  if #ActorList > 0 then
    Player = ActorList[1]
    BumpWorld:add(Player,Player:getX(),Player:getY(),TileW,TileH)
    playerSprite = setPlayerSprite()
    playerSprite:switch('standDown')
    success = true
  end
  while success == false do --attempt to add player at a random location on the map
    local x = love.math.random(10, MAP_WIDTH-10)
    local y = love.math.random(10, MAP_HEIGHT-10)
    if BlockTable[y][x]:getWalkable() == true then --if the location is walkable, use it
      local nX,nY = (x-1)*TileW,(y-1)*TileH
      Player = GamePlayer:new(ActorPlayer, nX, nY)
      ActorList[#ActorList + 1] = Player
      BumpWorld:add(Player,nX,nY,TileW,TileH)
      playerSprite = setPlayerSprite()
      playerSprite:switch('standDown')
      success = true
    end
  end
end

function movePlayer(newX, newY) --specialized wrapper for the tryMoveActor function
  tryMoveActor(Player, newX, newY)
  checkPlayerDistFromCamera()
end



return Player
