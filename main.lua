class = require('lib/middleclass')
tiny = require('lib/tiny')
bump = require('lib/bump')
binser = require('lib/binser')

require 'src/utils/map-utils'

ECSWorld = tiny.world()

ScreenManager = require('lib/ScreenManager/ScreenManager') -- manages which state the game is in

FontArcade = love.graphics.newFont("assets/ArcadeAlternate.ttf", 32)
FontCommo = love.graphics.newFont("assets/Commo-Regular.otf", 24)

--love.frame = 0
function love.load()
  --love.profiler = require('lib/profile')
  --love.profiler.hookall("Lua")
  --love.profiler.start()
  love.graphics.setDefaultFilter( 'nearest', 'nearest' )

  local screens = {
        ['home'] = require('src/screens/homescreen'),
        ['game'] = require('src/screens/gamescreen'),
        ['menu'] = require('src/screens/menuscreen'),
        ['worldgen'] = require('src/screens/worldgenscreen'),

        ['wgc'] = require('src/screens/alerts/wgconfirmation')
    }


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
  ScreenManager.update(dt)
end

function love.draw()
  ScreenManager.draw()
  --love.graphics.print(love.report or "Please wait...")
end
