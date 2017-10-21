class = require('lib/middleclass')
tiny = require('lib/tiny')
talkback = require('lib/talkback')
bump = require('lib/bump')
sodapop = require('lib/sodapop')

ECSWorld = tiny.world()

require 'src/utils/map-utils'
require 'src/utils/anim-sprite-utils'
require 'src/utils/actor-utils'
require 'src/utils/key-mgr'
require 'src/utils/cam-mgr'
require 'src/utils/shdr-mgr'
require 'src/utils/debug-gui'
require 'src/gen/cave-gen'
require 'src/actor'
require 'src/player'
require 'src/tile'
require 'src/glyph'
require 'src/block'
require 'src/utils/sprite-interpret'

require 'src/shaders/colorassign'

ScreenManager = require('lib/ScreenManager/ScreenManager') -- manages which state the game is in

conversation = talkback.new()

--love.frame = 0
function love.load()
  --love.profiler = require('lib/profile')
  --love.profiler.hookall("Lua")
  --love.profiler.start()


  World_Tiles = loadTileImage('assets/world_tiles.png')
  World_Quads = newTileMap(32,32,World_Tiles)
  love.graphics.setDefaultFilter( 'nearest', 'nearest' )

  local screens = {
        ['game'] = require('src/screens/gamescreen'),
        ['menu'] = require('src/screens/menuscreen')
    }

  MAP_WIDTH = 120
  MAP_HEIGHT = 120
  BumpWorld = bump.newWorld(32)

  TileTable = makeCaveFloor(MAP_WIDTH, MAP_HEIGHT)
  BlockTable = makeCaveBlocks(MAP_WIDTH, MAP_HEIGHT)
  ActorList = {}

  makeBumpWorld(BlockTable, MAP_WIDTH, MAP_HEIGHT)

  addPlayer()
  setupCamera()
  redrawAllGlyphs()

  ScreenManager.init(screens, 'game')
end

--local skip = 0

function love.update(dt)
  if dt < 1/30 then --lock to 30 fps
      love.timer.sleep(1/30 - dt)
   end
  --love.frame = love.frame + 1
  --if love.frame%100 == 0 then
    --love.report = love.profiler.report('time', 20)
    --love.profiler.reset()
  --end

   --generically update keys, to be interpreted by the ScreenManager
  ScreenManager.update(dt)
end

function love.draw()
  ScreenManager.draw()
  --love.graphics.print(love.report or "Please wait...")
end
