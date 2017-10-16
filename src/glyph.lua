Glyph = class('Glyph')

function Glyph:initialize(properties)
  properties = properties or {}
  --self._tileset = properties['tileset']
  self._symbol = properties['symbol']
  self._foreground = properties['foreground'] or {255, 251, 142, 255}
  self._background = properties['background'] or {16, 15, 58, 255}
end

--[[function Glyph:getTileset()
    return self._tileset
end--]]

function Glyph:getSymbol()
  return self._symbol
end

function Glyph:getForeground()
  return self._foreground
end

function Glyph:getBackground()
  return self._background
end

return Glyph
