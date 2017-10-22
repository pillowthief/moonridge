require 'src/classes/glyph'

Tile = class('Tile', Glyph)

binser.registerClass(Tile)

function Tile:initialize(properties)
  properties = properties or {}

  Glyph.initialize(self, properties)

  tiny.addEntity (ECSWorld, self)

  self._isStairsUp = properties['isStairsUp'] or false
  self._isStairsDown = properties['isStairsDown'] or false
end


return Tile
