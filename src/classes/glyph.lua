Glyph = class('Glyph')

binser.registerClass(Glyph)

function Glyph:initialize(properties)
  properties = properties or {}
  self.name = properties['name'] or ' '
  self._quad = properties['quad'] or 1
  self._color1 = properties['color1'] or {255, 255, 255, 255}
  self._color2 = properties['color2'] or {0.0, 0.0, 0.0, 0.0}
  self._color3 = properties['color3'] or {0.0, 0.0, 0.0, 0.0}
  self._color4 = properties['color4'] or {0.0, 0.0, 0.0, 0.0}
end

function Glyph:getName()
  return self.name
end

function Glyph:getQuad()
  return self._quad
end

function Glyph:getColFilter()
  return self._colFilter
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

function Glyph:getLikeNeighbors(tiletable, x, y)
  local totalSame = 1 -- same as itself
  -- cardinal directions
  if tiletable[y][x]:isNeighborSame(tiletable,x,y+1) == true then totalSame = totalSame + 1 end
  if tiletable[y][x]:isNeighborSame(tiletable,x+1,y) == true then totalSame = totalSame + 1 end
  if tiletable[y][x]:isNeighborSame(tiletable,x,y-1) == true then totalSame = totalSame + 1 end
  if tiletable[y][x]:isNeighborSame(tiletable,x-1,y) == true then totalSame = totalSame + 1 end

  -- orthagonal directions
  if tiletable[y][x]:isNeighborSame(tiletable,x+1,y+1) == true then totalSame = totalSame + 1 end
  if tiletable[y][x]:isNeighborSame(tiletable,x-1,y+1) == true then totalSame = totalSame + 1 end
  if tiletable[y][x]:isNeighborSame(tiletable,x+1,y-1) == true then totalSame = totalSame + 1 end
  if tiletable[y][x]:isNeighborSame(tiletable,x-1,y-1) == true then totalSame = totalSame + 1 end

  return totalSame
end

function Glyph:isNeighborSame(tiletable, x, y)
  if tiletable[y] == nil then
    return false
  elseif tiletable[y][x] == nil then
    return false
  elseif tiletable[y][x]:getName() == self.name then
    return true
  else
    return false
  end
end

return Glyph
