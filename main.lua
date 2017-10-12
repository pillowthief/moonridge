require 'src/utils/map-utils'
require 'src/utils/actor-utils'
require 'src/utils/key-mgr'
require 'src/utils/cam-mgr'
require 'src/utils/shdr-mgr'
require 'src/gen/cave-gen'
require 'src/player'

require 'src/shaders/colorassign'

local ScreenManager = require('lib/ScreenManager/ScreenManager')

function love.load()
  newTileMap(32,32,('assets/world_tiles.png'))

  local screens = {
        game = require('src/screens/gamescreen')
    }

  MAP_WIDTH = 120
  MAP_HEIGHT = 120

  TileTable = makeCave(MAP_WIDTH, MAP_HEIGHT)
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
