local lChunks = {}

function fetchLocalChunks(c)
  local center = c or THEATLAS:getPlayerChunk()

  if THEATLAS:getChunkAt(center[1],center[2]) == false then
    generateMapChunk(THEATLAS,center[1],center[2])
  end
  lChunks['cen'] = THEATLAS:getChunkAt(center[1],center[2])

  if THEATLAS:getChunkAt(center[1],center[2]-1) == false then
    generateMapChunk(THEATLAS,center[1],center[2]-1)
  end
  lChunks['n'] = THEATLAS:getChunkAt(center[1],center[2]-1)

  if THEATLAS:getChunkAt(center[1]+1,center[2]) == false then
    generateMapChunk(THEATLAS,center[1]+1,center[2])
  end
  lChunks['e'] = THEATLAS:getChunkAt(center[1]+1,center[2])

  if THEATLAS:getChunkAt(center[1],center[2]+1) == false then
    generateMapChunk(THEATLAS,center[1],center[2]+1)
  end
  lChunks['s'] = THEATLAS:getChunkAt(center[1],center[2]+1)

  if THEATLAS:getChunkAt(center[1]-1,center[2]) == false then
    generateMapChunk(THEATLAS,center[1]-1,center[2])
  end
  lChunks['w'] = THEATLAS:getChunkAt(center[1]-1,center[2])

  if THEATLAS:getChunkAt(center[1]-1,center[2]-1) == false then
    generateMapChunk(THEATLAS,center[1]-1,center[2]-1)
  end
  lChunks['nw'] = THEATLAS:getChunkAt(center[1]-1,center[2]-1)

  if THEATLAS:getChunkAt(center[1]+1,center[2]-1) == false then
    generateMapChunk(THEATLAS,center[1]+1,center[2]-1)
  end
  lChunks['ne'] = THEATLAS:getChunkAt(center[1]+1,center[2]-1)

  if THEATLAS:getChunkAt(center[1]+1,center[2]+1) == false then
    generateMapChunk(THEATLAS,center[1]+1,center[2]+1)
  end
  lChunks['se'] = THEATLAS:getChunkAt(center[1]+1,center[2]+1)

  if THEATLAS:getChunkAt(center[1]-1,center[2]+1) == false then
    generateMapChunk(THEATLAS,center[1]-1,center[2]+1)
  end
  lChunks['sw'] = THEATLAS:getChunkAt(center[1]-1,center[2]+1)

--try to grab local chunks, if they dont exist create them!
end

function getLocalChunk(pos)
  if lChunks[pos] ~= nil then
    return lChunks[pos]
  else
    return false
  end
end

function actorChangeChunk()
  --make it genericly possible for all actors to change chunks
end
