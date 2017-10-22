local Screen = require('lib/ScreenManager/Screen')

require 'src/utils/start-game'
require 'src/utils/map-utils'
require 'src/utils/anim-sprite-utils'
require 'src/utils/actor-utils'
require 'src/utils/key-mgr'
require 'src/utils/cam-mgr'
require 'src/utils/shdr-mgr'
require 'src/utils/debug-gui'
require 'src/gen/cave-gen'
require 'src/gen/forest-gen'
require 'src/actor'
require 'src/player'
require 'src/tile'
require 'src/glyph'
require 'src/block'

require 'src/shaders/colorassign'

--this is the main gameplay screen

local GameScreen = {}

function GameScreen.new()
    local self = Screen.new()

    function self:draw()
        Cam:draw(function(l,t,w,h)
          local visible = getVisibleTiles()
          drawGlyphs(TileGlyphs, visible)
          drawGlyphs(BlockGlyphs, visible)
          drawActors()
          drawDebugTiles()
        end)
    end

    function self:update(dt)
      updateKeys(dt)
      updateCamera()
      playerSprite:update(dt)
    end

    return self
end

return GameScreen
