class = require('lib/middleclass')
tiny = require('lib/tiny')
talkback = require('lib/talkback')

require 'src/utils/map-utils'
require 'src/utils/actor-utils'
require 'src/utils/key-mgr'
require 'src/utils/cam-mgr'
require 'src/utils/shdr-mgr'
require 'src/gen/cave-gen'
require 'src/player'
require 'src/tile'
require 'src/glyph'
require 'src/block'
require 'src/utils/sprite-interpret'

require 'src/shaders/colorassign'

local ScreenManager = require('lib/ScreenManager/ScreenManager')

function love.load()
  World_Tiles = loadTileImage('assets/world_tiles.png')
  World_Quads = newTileMap(32,32,World_Tiles)
  Actor_Sprites = loadTileImage('assets/masc_char.png')
  Actor_Quads = newTileMap(32,32,Actor_Sprites)
  love.graphics.setDefaultFilter( 'nearest', 'nearest' )

  local screens = {
        game = require('src/screens/gamescreen')
    }

  MAP_WIDTH = 120
  MAP_HEIGHT = 120

  TileTable = makeCaveFloor(MAP_WIDTH, MAP_HEIGHT)
  BlockTable = makeCaveBlocks(MAP_WIDTH, MAP_HEIGHT)
  ActorTable = makeActorTable(MAP_WIDTH, MAP_HEIGHT)

  addPlayer()
  setupCamera()
  addShaderEffects()

  ScreenManager.init(screens, 'game')
end

local skip = 0

function love.update(dt)
  updateKeys()
  updateCamera()
  ScreenManager.update(dt)
  --print(ScreenManager.returnCurrent())
end

function love.draw()
  ScreenManager.draw()
end
