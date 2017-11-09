require 'src/gen/surface'

CHUNKSIZE = 80

function generateNewGameChunks(a,aX,aY)
  generateMapChunk(a,aX,aY)
  generateMapChunk(a,aX+1,aY)
  generateMapChunk(a,aX-1,aY)
  generateMapChunk(a,aX,aY+1)
  generateMapChunk(a,aX,aY-1)
  stepWGScreenForward()
end

function generateMapChunk(atlas,atlasX,atlasY)
  local wet = atlas:getWetMap()
  local lwet = {}
  for i=1,8 do
    lwet[i] = {}
    for q=1,8 do
      lwet[i][q] = wet[((atlasY-1)*8)+i][((atlasX-1)*8)+q]
    end
  end

  local tmp = atlas:returnTempMap()
  local ltmp = {}
  for i=1,8 do
    ltmp[i] = {}
    for q=1,8 do
      ltmp[i][q] = tmp[((atlasY-1)*8)+i][((atlasX-1)*8)+q]
    end
  end

  local lakes = atlas:returnTempMap()
  local rivers = atlas:returnRivers()
  local lwater = {}
  for i=1,8 do
    lwater[i] = {}
    for q=1,8 do
      if rivers[((atlasY-1)*8)+i][((atlasX-1)*8)+q] == true then
        lwater[i][q] = 'river'
      end
      if lakes[((atlasY-1)*8)+i][((atlasX-1)*8)+q] == true then
        lwater[i][q] = 'lake'
      end
      if lwater[i][q] == nil then
        lwater[i][q] = 'dry'
      end
    end
  end


  local tiles = generateSurfaceTiles(atlas,atlasX,atlasY,lwet,ltmp,lwater)

  local chunk = MapChunk:new((atlasX),(atlasY), tiles)

  atlas:addChunk(chunk)
end
