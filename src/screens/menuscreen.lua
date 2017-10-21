local Screen = require('lib/ScreenManager/Screen')
require('src/utils/menu-render')

local MenuScreen = {}

function MenuScreen.new()
    local self = Screen.new()

    function self:draw()
      Cam:draw(function(l,t,w,h)
        drawMenu()
        drawMenuText()
      end)
    end

    function self:update(dt)

    end

    return self
end

return MenuScreen
