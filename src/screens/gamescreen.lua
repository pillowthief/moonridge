local Screen = require('lib/ScreenManager/Screen')

local moonshine = require('lib/moonshine')

require 'src/utils/start-game'
require 'src/utils/map-utils'
require 'src/utils/anim-sprite-utils'
require 'src/utils/actor-utils'
require 'src/utils/key-mgr'
require 'src/utils/cam-mgr'
require 'src/utils/shdr-mgr'
require 'src/utils/debug-gui'
require 'src/utils/draw-gui'
require 'src/gen/cave-gen'
require 'src/gen/forest-gen'
require 'src/classes/actor'
require 'src/classes/player'
require 'src/classes/tile'
require 'src/classes/glyph'
require 'src/classes/block'
require 'src/systems/calendar'

require 'src/shaders/colorassign'

--this is the main gameplay screen

local GameScreen = {}


function GameScreen.new()
    local self = Screen.new()

    effect = moonshine(moonshine.effects.colorgradesimple) -- set up to use for seasons
    effect.colorgradesimple.factors = {1,1,1}

    function self:draw()
      effect.draw(function()
        Cam:draw(function(l,t,w,h)
          local visible = getVisibleTiles()
          drawGlyphs(TileGlyphs, visible)
          drawGlyphs(BlockGlyphs, visible)
          drawActors()
          drawDebugTiles()
        end)
      end)

        drawGUI()
    end

    local counter = 1

    function self:update(dt)
      if counter > 30 then -- makes the calendar update every 30 frames (so approx every 1 second)
        updateCalendar()
        counter = 1
      else
        counter = counter + 1
      end

      updateKeys(dt)
      updateCamera()
      playerSprite:update(dt)
    end

    return self
end

return GameScreen
