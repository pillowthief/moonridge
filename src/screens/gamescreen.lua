local Screen = require('lib/ScreenManager/Screen')
require('src/screens/game-keys')
require('src/screens/game-comps')

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
