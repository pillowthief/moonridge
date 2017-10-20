Glyph = class('Glyph')

function Glyph:initialize(properties)
  properties = properties or {}
  --self._tileset = properties['tileset']
  self._sprite = properties['sprite'] or nil
  self._spriteType = properties['spriteType'] or 'single'
  self._color1 = properties['color1'] or {255, 255, 255, 255}
  self._color2 = properties['color2'] or {0.0, 0.0, 0.0, 0.0}
  self._color3 = properties['color3'] or {0.0, 0.0, 0.0, 0.0}
  self._color4 = properties['color4'] or {0.0, 0.0, 0.0, 0.0}
end

--[[function Glyph:getTileset()
    return self._tileset
end--]]

function Glyph:getSprite()
  return self._sprite
end

function Glyph:getSpriteType()
  return self._spriteType
end

function Glyph:getColor1()
  return self._color1
end

function Glyph:getColor2()
  return self._color2
end

function Glyph:getColor3()
  return self._color3
end

function Glyph:getColor4()
  return self._color4
end

function Glyph:getNeighbors()

end

return Glyph
