Atlas = class('Atlas')

binser.registerClass(Atlas)

function Atlas:initialize(properties)
  properties = properties or {}
  self._wetmap = properties['wetmap'] or {}
  self._tempmap = properties['tempmap'] or {}
  self._rivers = properties['rivers'] or {}
  self._lakes = properties['lakes'] or {}
  self._chunks = properties['chunks'] or {}
end

function Atlas:setWetMap(wtiles)
  self._wetmap = wtiles
end

function Atlas:returnWetMap(wtiles)
  return self._wetmap
end

function Atlas:setTempMap(ftiles)
  self._tempmap = floor_tiles
end

function Atlas:returnTempMap()
  return self._tempmap
end

function Atlas:addChunk()

end

function Atlas:returnChunk()

end




return Atlas
