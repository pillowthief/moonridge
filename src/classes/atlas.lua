Atlas = class('Atlas')

binser.registerClass(Atlas)

function Atlas:initialize(wm,tm,rivs,lks,chks)
  print('Beware, I live!')
  self._wetmap = wm
  self._tempmap = tm
  self._rivers = rivs
  self._lakes = lks
  self._chunks = chnks or {}
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
