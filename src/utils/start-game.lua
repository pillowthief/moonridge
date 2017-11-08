MAP_WIDTH = 80
MAP_HEIGHT = 80

function STARTGAME(atlas, time)
  local coords = THEATLAS:getPlayerChunk()
  local chunk = THEATLAS:getChunkAt((coords[1]),(coords[2]))

  TileTable = chunk:getTileMap()
  --BlockTable = chunk:getBlockMap() USE THIS VERSION ASAP
  BlockTable = makeForestBlocks(MAP_WIDTH, MAP_HEIGHT)
  ActorList = chunk:getActorList() or {}
  local Time = time or 0

  BumpWorld = bump.newWorld(32)
  makeBumpWorld(BlockTable, MAP_WIDTH, MAP_HEIGHT)

  addPlayer()
  setupCamera()
  redrawAllGlyphs()
  startTheClock(Time)
  ScreenManager.switch('game')
end

function CHANGEMAP(cX,cY)
  local chunk = THEATLAS:getChunkAt(cX,cY)
  if THEATLAS:getChunkAt(cX+1,cY) == false then
    generateMapChunk(THEATLAS,cX+1,cY)
  end
  if THEATLAS:getChunkAt(cX-1,cY) == false then
    generateMapChunk(THEATLAS,cX-1,cY)
  end
  if THEATLAS:getChunkAt(cX,cY+1) == false then
    generateMapChunk(THEATLAS,cX,cY+1)
  end
  if THEATLAS:getChunkAt(cX,cY-1) == false then
    generateMapChunk(THEATLAS,cX,cY-1)
  end

  local chunk = THEATLAS:getChunkAt(cX,cY)
  TileTable = chunk:getTileMap() or makeCaveFloor(MAP_WIDTH, MAP_HEIGHT)
  BlockTable = makeForestBlocks(MAP_WIDTH, MAP_HEIGHT)
  ActorList = chunk:getActorList() or {}

  BumpWorld = bump.newWorld(32)
  makeBumpWorld(BlockTable, MAP_WIDTH, MAP_HEIGHT)

  addPlayer()
  setupCamera()
  redrawAllGlyphs()

  THEATLAS:setPlayerChunk(cX,cY)
end
