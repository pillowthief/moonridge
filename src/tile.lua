require 'src/glyph'
require 'src/entities/tiles'

Tile = class('Tile', Glyph)

function Tile:initialize(properties)
  properties = properties or {}

  Glyph.initialize(self, properties)

  self._walkable = properties['walkable'] or false
  self._blockslight = properties['blockslight'] or false

end

function Tile:getWalkable()
  return self._walkable
end

function Tile:getBlocksLight()
  return self._blockslight
end

return Tile
