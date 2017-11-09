MAP_WIDTH = 80
MAP_HEIGHT = 80

function STARTGAME(atlas, time)
  local coords = THEATLAS:getPlayerChunk()
  fetchLocalChunks({(coords[1]),(coords[2])})
  local chunk = getLocalChunk('cen')

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

function CHANGEMAP(oX,oY,cX,cY,pX,pY)
  local oldchunk = THEATLAS:getChunkAt(oX,oY)
  removeActorFromActorlist(Player, oldchunk:getActorList())
  THEATLAS:setPlayerChunk(cX,cY)
  fetchLocalChunks({cX,cY})

  local chunk = getLocalChunk('cen')
  TileTable = chunk:getTileMap()
  BlockTable = makeForestBlocks(MAP_WIDTH, MAP_HEIGHT)
  ActorList = chunk:getActorList() or {}

  BumpWorld = bump.newWorld(32)
  makeBumpWorld(BlockTable, MAP_WIDTH, MAP_HEIGHT)

  addPlayer(pX,pY)
  setupCamera()
  redrawAllGlyphs()
end
