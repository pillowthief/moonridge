local Screen = require('lib/ScreenManager/Screen')
require('src/utils/worldgen-render')


local WGConfirm = {}

function WGConfirm.new()
    local self = Screen.new()

    function self:draw()
      love.graphics.setColor(33, 45, 104,200)
        love.graphics.rectangle("fill", 64, 192, 384, 128 )
      love.graphics.setColor(255,255,255)
        love.graphics.printf('Press ENTER to accept', 74, 204, 374, "center")
        love.graphics.printf('or ESC to choose again', 74, 228, 374, "center")
      love.graphics.setColor(255,255,255)
    end


    function self:update(dt)
      function love.keyreleased( key )
        if key == 'escape' then
          ScreenManager.pop()
        elseif key == 'return' then
          ScreenManager.pop()
          setWGCoordsFromCursor()
        end
      end
    end

    return self
end

return WGConfirm
