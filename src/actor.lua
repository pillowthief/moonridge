require 'src/glyph'

Actor = class('Actor', Glyph)

function Actor:initialize(properties)
  properties = properties or {}

  Glyph.initialize(self, properties)
end

return Actor
