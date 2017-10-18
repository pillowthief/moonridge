local Screen = require('lib/ScreenManager/Screen')

--this is the main gameplay screen

local GameScreen = {}

function GameScreen.new()
    local self = Screen.new()

    --local temptable = {Cam:getVisible()}
    --l,t,w,h = temptable[1],temptable[2],temptable[3],temptable[4]
    function self:draw()
      post_effect:draw(function()
        Cam:draw(function(l,t,w,h)
            local visible = getVisibleTiles()
            drawGlyphs(TileGlyphs, visible)
            drawGlyphs(BlockGlyphs, visible)
            drawGlyphs(ActorGlyphs, visible)
          end)
        end)
    end

    function self:update(dt)
    end

    return self
end

return GameScreen
