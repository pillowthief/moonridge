MAP_WIDTH = 80
MAP_HEIGHT = 80

function STARTGAME(tiletable, blocktable, actorlist)
  TileTable = tiletable or makeForestFloor(MAP_WIDTH, MAP_HEIGHT)
  BlockTable = blocktable or makeForestBlocks(MAP_WIDTH, MAP_HEIGHT)
  ActorList = actorlist or {}

  makeBumpWorld(BlockTable, MAP_WIDTH, MAP_HEIGHT)

  addPlayer()
  setupCamera()
  redrawAllGlyphs()
  ScreenManager.switch('game')
end
