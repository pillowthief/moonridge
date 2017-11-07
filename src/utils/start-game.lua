MAP_WIDTH = 80
MAP_HEIGHT = 80

function STARTGAME(tiletable, blocktable, actorlist, time)
  TileTable = tiletable or makeForestFloor(MAP_WIDTH, MAP_HEIGHT)
  BlockTable = makeForestBlocks(MAP_WIDTH, MAP_HEIGHT)
  ActorList = actorlist or {}
  local Time = time or 0

  BumpWorld = bump.newWorld(32)
  makeBumpWorld(BlockTable, MAP_WIDTH, MAP_HEIGHT)

  addPlayer()
  setupCamera()
  redrawAllGlyphs()
  startTheClock(Time)
  ScreenManager.switch('game')
end

function CHANGEMAP(tiletable, blocktable, actorlist)
  TileTable = tiletable or makeCaveFloor(MAP_WIDTH, MAP_HEIGHT)
  BlockTable = blocktable or makeCaveBlocks(MAP_WIDTH, MAP_HEIGHT)
  ActorList = actorlist or {}

  BumpWorld = bump.newWorld(32)
  makeBumpWorld(BlockTable, MAP_WIDTH, MAP_HEIGHT)

  addPlayer()
  setupCamera()
  redrawAllGlyphs()
end
