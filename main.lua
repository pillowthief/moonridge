class = require('lib/middleclass')
tiny = require('lib/tiny')
talkback = require('lib/talkback')

require 'src/utils/map-utils'
require 'src/utils/actor-utils'
require 'src/utils/key-mgr'
require 'src/utils/cam-mgr'
require 'src/utils/shdr-mgr'
require 'src/gen/cave-gen'
require 'src/actor'
require 'src/player'
require 'src/tile'
require 'src/glyph'
require 'src/block'
require 'src/utils/sprite-interpret'

require 'src/shaders/colorassign'

local ScreenManager = require('lib/ScreenManager/ScreenManager')

love.frame = 0
function love.load()
  --love.profiler = require('lib/profile')
  --love.profiler.hookall("Lua")
  --love.profiler.start()


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
  drawAllGlyphsFirstTime()
  addShaderEffects()

  ScreenManager.init(screens, 'game')
end

local skip = 0

function love.update(dt)
  --love.frame = love.frame + 1
  --if love.frame%100 == 0 then
    --love.report = love.profiler.report('time', 20)
    --love.profiler.reset()
  --end

  updateKeys()
  updateCamera()
  ScreenManager.update(dt)
end

function love.draw()
  ScreenManager.draw()
  --love.graphics.print(love.report or "Please wait...")
end
