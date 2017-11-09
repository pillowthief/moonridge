Atlas = class('Atlas')

binser.registerClass(Atlas)

function Atlas:initialize(wm,tm,rivs,lks,chks)
  self._wetmap = wm
  self._tempmap = tm
  self._rivers = rivs
  self._lakes = lks
  self._chunks = chnks or expandTableFilled(48,48,false)
  self._playerChunk = {}
end

function Atlas:setPlayerChunk(x,y)
  self._playerChunk = {x,y}
end

function Atlas:getPlayerChunk()
  return self._playerChunk
end

function Atlas:setWetMap(wtiles)
  self._wetmap = wtiles
end

function Atlas:getWetMap()
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

function Atlas:getChunkAt(aX,aY)
  return self._chunks[aY][aX]
end


return Atlas
