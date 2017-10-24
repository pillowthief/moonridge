require 'src/classes/glyph'

Tile = class('Tile', Glyph)

binser.registerClass(Tile)

function Tile:initialize(properties)
  properties = properties or {}

  Glyph.initialize(self, properties)

  tiny.addEntity (ECSWorld, self)

  self._isStairs = properties['isStairs'] or 'no'

end

function Tile:getIsStairs()
  return self._isStairs
end


return Tile
