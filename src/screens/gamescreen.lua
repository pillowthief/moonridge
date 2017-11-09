local Screen = require('lib/ScreenManager/Screen')
local moonshine = require('lib/moonshine')
sodapop = require('lib/sodapop')

require 'src/utils/start-game'
require 'src/utils/chunk-mgr'
require 'src/utils/map-render'
require 'src/utils/map-utils'
require 'src/utils/anim-sprite-utils'
require 'src/utils/anim-sprites'
require 'src/utils/key-mgr'
require 'src/utils/cam-mgr'
require 'src/utils/shdr-mgr'
require 'src/utils/debug-gui'
require 'src/utils/draw-gui'
require 'src/utils/saveload'
require 'src/gen/cave-gen'
require 'src/gen/forest-gen'
require 'src/gen/mapchunk-gen-util'
require 'src/classtools/player'
require 'src/classtools/actor-utils'
require 'src/classes/atlas'
require 'src/classes/actor'
require 'src/classes/mapchunk'
require 'src/classes/tile'
require 'src/classes/glyph'
require 'src/classes/block'
require 'src/systems/calendar'

require 'src/shaders/colorassign'

Floor_Tiles = loadTileImage('assets/floor_tiles.png')
Floor_Quads = newTileMap(32,32,Floor_Tiles)

Block_Tiles = loadTileImage('assets/world_tiles.png')
Block_Quads = newTileMap(32,32,Block_Tiles)

GUI_Tiles = loadTileImage('assets/gui_tiles.png')
GUI_Quads = newTileMap(32,32,GUI_Tiles)

--this is the main gameplay screen

local GameScreen = {}


function GameScreen.new()
    local self = Screen.new()

    local effect = moonshine(moonshine.effects.colorgradesimple) -- set up to use for seasons
    effect.colorgradesimple.factors = {1,1,1}
    love.graphics.setColor(255,255,255)

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
