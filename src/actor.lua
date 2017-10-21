require 'src/glyph'

Actor = class('Actor', Glyph)

function Actor:initialize(properties, x, y)
  properties = properties or {}

  tiny.addEntity (ECSWorld, self)

  Glyph.initialize(self, properties)

  self._x = x
  self._y = y
  self._speed = properties['speed'] or 1
  self._facing = 'down'
end

function Actor:setX(x)
  self._x = x
end

function Actor:getX()
  return self._x
end

function Actor:setY(y)
  self._y = y
end

function Actor:getY()
  return self._y
end

function Actor:setCoords(x, y)
  self._x = x
  self._y = y
end

function Actor:getApproxGridX()
  local gridX
  if math.floor((self._x/TileW) + 0.5) == math.floor((self._x/TileW)+1) then
    gridX = math.ceil(self._x / TileW)
  else
    gridX = math.floor(self._x / TileW)
  end
  return gridX
end

function Actor:getApproxGridY()
  local gridY
  if math.floor((self._y/TileH) + 0.9) == math.floor((self._y/TileH)+1) then
    gridY = math.ceil(self._y / TileH)
  else
    gridY = math.floor(self._y / TileH)
  end
  return gridY
end

function Actor:setSpeed(speed)
  self._speed = speed
end

function Actor:getSpeed()
  return self._speed
end

function Actor:setFacing(facing)
  self._facing = facing
end

function Actor:getFacing()
  return self._facing
end

return Actor
