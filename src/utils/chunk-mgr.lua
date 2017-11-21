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

function getExtendedTileTable()
  local blocks = expandTableBlank(170,140)

  --NW
  local chunk = getLocalChunk('nw')
  local cblocks = chunk:getTileMap()
  for y=1,30 do
    for x=1,45 do
      blocks[y][x] = cblocks[50+y][35+x]
    end
  end
  --N
  local chunk = getLocalChunk('n')
  local cblocks = chunk:getTileMap()
  for y=1,30 do
    for x=46,125 do
      blocks[y][x] = cblocks[50+y][x-45]
    end
  end
  --NE
  local chunk = getLocalChunk('ne')
  local cblocks = chunk:getTileMap()
  for y=1,30 do
    for x=126,170 do
      blocks[y][x] = cblocks[50+y][x-125]
    end
  end

  --W
  local chunk = getLocalChunk('w')
  local cblocks = chunk:getTileMap()
  for y=31,110 do
    for x=1,45 do
      blocks[y][x] = cblocks[y-30][35+x]
    end
  end
  --C
  local chunk = getLocalChunk('cen')
  local cblocks = chunk:getTileMap()
  for y=31,110 do
    for x=46,125 do
      blocks[y][x] = cblocks[y-30][x-45]
    end
  end
  --E
  local chunk = getLocalChunk('e')
  local cblocks = chunk:getTileMap()
  for y=31,110 do
    for x=126,170 do
      blocks[y][x] = cblocks[y-30][x-125]
    end
  end


  --SW
  local chunk = getLocalChunk('sw')
  local cblocks = chunk:getTileMap()
  for y=111,140 do
    for x=1,45 do
      blocks[y][x] = cblocks[y-110][35+x]
    end
  end
  --S
  local chunk = getLocalChunk('s')
  local cblocks = chunk:getTileMap()
  for y=111,140 do
    for x=46,125 do
      blocks[y][x] = cblocks[y-110][x-45]
    end
  end
  --E
  local chunk = getLocalChunk('e')
  local cblocks = chunk:getTileMap()
  for y=111,140 do
    for x=126,170 do
      blocks[y][x] = cblocks[y-110][x-125]
    end
  end

  return blocks
end

function getExtendedBlockTable()
  local blocks = expandTableBlank(170,140)

  --NW
  local chunk = getLocalChunk('nw')
  local cblocks = chunk:getBlockMap()
  for y=1,30 do
    for x=1,45 do
      blocks[y][x] = cblocks[50+y][35+x]
    end
  end
  --N
  local chunk = getLocalChunk('n')
  local cblocks = chunk:getBlockMap()
  for y=1,30 do
    for x=46,125 do
      blocks[y][x] = cblocks[50+y][x-45]
    end
  end
  --NE
  local chunk = getLocalChunk('ne')
  local cblocks = chunk:getBlockMap()
  for y=1,30 do
    for x=126,170 do
      blocks[y][x] = cblocks[50+y][x-125]
    end
  end

  --W
  local chunk = getLocalChunk('w')
  local cblocks = chunk:getBlockMap()
  for y=31,110 do
    for x=1,45 do
      blocks[y][x] = cblocks[y-30][35+x]
    end
  end
  --C
  local chunk = getLocalChunk('cen')
  local cblocks = chunk:getBlockMap()
  for y=31,110 do
    for x=46,125 do
      blocks[y][x] = cblocks[y-30][x-45]
    end
  end
  --E
  local chunk = getLocalChunk('e')
  local cblocks = chunk:getBlockMap()
  for y=31,110 do
    for x=126,170 do
      blocks[y][x] = cblocks[y-30][x-125]
    end
  end


  --SW
  local chunk = getLocalChunk('sw')
  local cblocks = chunk:getBlockMap()
  for y=111,140 do
    for x=1,45 do
      blocks[y][x] = cblocks[y-110][35+x]
    end
  end
  --S
  local chunk = getLocalChunk('s')
  local cblocks = chunk:getBlockMap()
  for y=111,140 do
    for x=46,125 do
      blocks[y][x] = cblocks[y-110][x-45]
    end
  end
  --E
  local chunk = getLocalChunk('e')
  local cblocks = chunk:getBlockMap()
  for y=111,140 do
    for x=126,170 do
      blocks[y][x] = cblocks[y-110][x-125]
    end
  end

  return blocks
end
