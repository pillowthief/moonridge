MAP_WIDTH = 40
MAP_HEIGHT = 40

function STARTGAME(tiletable, blocktable, actorlist)
  TileTable = tiletable or makeCaveFloor(MAP_WIDTH, MAP_HEIGHT)
  BlockTable = blocktable or makeCaveBlocks(MAP_WIDTH, MAP_HEIGHT)
  ActorList = actorlist or {}

  makeBumpWorld(BlockTable, MAP_WIDTH, MAP_HEIGHT)

  addPlayer()
  setupCamera()
  redrawAllGlyphs()
  ScreenManager.switch('game')
end
