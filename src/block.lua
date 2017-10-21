require 'src/glyph'

Block = class('Block', Glyph)

binser.registerClass(Block)

function Block:initialize(properties)
  properties = properties or {}

  Glyph.initialize(self, properties)
  tiny.addEntity (ECSWorld, self)

  self._walkable = properties['walkable'] or false
  self._blockslight = properties['blockslight'] or true

end

function Block:getWalkable()
  return self._walkable
end

function Block:getBlocksLight()
  return self._blockslight
end

return Block
