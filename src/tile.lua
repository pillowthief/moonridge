require 'src/glyph'

Tile = class('Tile', Glyph)

bitser.registerClass(Tile)

function Tile:initialize(properties)
  properties = properties or {}

  Glyph.initialize(self, properties)

  tiny.addEntity (ECSWorld, self)

end


return Tile
