local Screen = require('lib/ScreenManager/Screen')

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

      updateCamera()
      playerSprite:update(dt)
    end

    return self
end

return GameScreen
