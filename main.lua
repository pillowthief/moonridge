class = require('lib/middleclass')
tiny = require('lib/tiny')
talkback = require('lib/talkback')
bump = require('lib/bump')
sodapop = require('lib/sodapop')
bitser = require('lib/bitser')

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
  love.graphics.setDefaultFilter( 'nearest', 'nearest' )

  local screens = {
        ['home'] = require('src/screens/homescreen'),
        ['game'] = require('src/screens/gamescreen'),
        ['menu'] = require('src/screens/menuscreen')
    }

  BumpWorld = bump.newWorld(32)

  World_Tiles = loadTileImage('assets/world_tiles.png')
  World_Quads = newTileMap(32,32,World_Tiles)

  Menu_Tiles = loadTileImage('assets/world_tiles.png')
  Menu_Quads = newTileMap(32,32,Menu_Tiles)

  ScreenManager.init(screens, 'home')
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

  updateKeys(dt)
  ScreenManager.update(dt)
end

function love.draw()
  ScreenManager.draw()
  --love.graphics.print(love.report or "Please wait...")
end
