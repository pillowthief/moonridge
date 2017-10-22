class = require('lib/middleclass')
tiny = require('lib/tiny')
bump = require('lib/bump')
sodapop = require('lib/sodapop')
binser = require('lib/binser')

ECSWorld = tiny.world()



ScreenManager = require('lib/ScreenManager/ScreenManager') -- manages which state the game is in


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
  ScreenManager.update(dt)
end

function love.draw()
  ScreenManager.draw()
  --love.graphics.print(love.report or "Please wait...")
end
