require 'src/glyph'

Actor = class('Actor', Glyph)

function Actor:initialize(properties, x, y)
  properties = properties or {}

  tiny.addEntity (ECSWorld, self)

  Glyph.initialize(self, properties)

  self._x = x
  self._y = y
  self._speed = properties['speed'] or 1
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
  local gridX = math.floor(self._x / TileW)
  return gridX
end

function Actor:getApproxGridY()
  local gridY = math.floor(self._y / TileH)
  return gridY
end

function Actor:setSpeed(speed)
  self._speed = speed
end

function Actor:getSpeed()
  return self._speed
end

return Actor
