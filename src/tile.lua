require 'src/glyph'

Tile = class('Tile', Glyph)

function Tile:initialize(properties)
  properties = properties or {}

  Glyph.initialize(self, properties)

  tiny.addEntity (ECSWorld, self)

end


return Tile
