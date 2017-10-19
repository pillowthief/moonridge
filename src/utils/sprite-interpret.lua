local flag

local tileNameToQuad = {
  [1] = 'floor',
  [2] = 'wall',
  [3] = 'null'
}

local actorNameToQuad = {
  [1] = 'null',
  [2] = 'player'
}

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
      flag = 'tile'
      return i end
  end
  for i=1,#actorNameToQuad do
    if actorNameToQuad[i] == glyph:getSprite() then
      flag = 'actor'
      return i end
  end
end

function getImageFromLastQuadLookup()
  if flag == 'tile' then
    return World_Tiles end
  if flag == 'actor' then
    return Actor_Sprites end

end

function getQuadsFromLastQuadLookup()
  if flag == 'tile' then
    return World_Quads end
  if flag == 'actor' then
    return Actor_Quads end

end
