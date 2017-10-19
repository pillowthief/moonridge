require 'src/glyph'

Tile = class('Tile', Glyph)

function Tile:initialize(properties)
  properties = properties or {}

  Glyph.initialize(self, properties)

end


return Tile
