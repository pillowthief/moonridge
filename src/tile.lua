require 'src/glyph'

Tile = class('Tile', Glyph)

function Tile:initialize(properties)
  properties = properties or {}

  Glyph.initialize(self, properties)

  self._walkable = properties['walkable'] or true

end

function Tile:getWalkable()
  return self._walkable
end

return Tile
