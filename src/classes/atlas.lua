Atlas = class('Atlas')

binser.registerClass(Atlas)

function Atlas:initialize(wm,tm,rivs,lks,chks)
  self._wetmap = wm
  self._tempmap = tm
  self._rivers = rivs
  self._lakes = lks
  self._chunks = chnks or expandTable(48,48)
end

function Atlas:setWetMap(wtiles)
  self._wetmap = wtiles
end

function Atlas:returnWetMap()
  return self._wetmap
end

function Atlas:setTempMap(ftiles)
  self._tempmap = floor_tiles
end

function Atlas:returnTempMap()
  return self._tempmap
end

function Atlas:returnRivers()
  return self._rivers
end

function Atlas:returnLakes()
  return self._lakes
end

function Atlas:addChunk(chunk)
  local coords = chunk:getAtlasCoords()
  self._chunks[coords[2]][coords[1]] = chunk
end

function Atlas:getChunk(aX,aY)
  return self._chunks[aY][aX]
end




return Atlas
