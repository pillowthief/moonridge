local tileNameToQuad = {
  [1] = 'floor',
  [2] = 'wall',
  [3] = 'null'
}

local actorNameToQuad = {}

function getQuadFromSName(glyph)
  local result
  if glyph:getSpriteType() == 'merge' then
    result = getMergedSprite(glyph)
  else
    result = getSingleSprite(glyph)
  end

  return result
end

function getMergedSprite(glyph)

end

function getSingleSprite(glyph)
  for i=1,#tileNameToQuad do
    if tileNameToQuad[i] == glyph:getSprite() then
      return i end
  end
end
