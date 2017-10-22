local Screen = require('lib/ScreenManager/Screen')
require('src/utils/home-render')
require('src/utils/start-game')

local HomeScreen = {}

function HomeScreen.new()
    local self = Screen.new()

    function self:draw()
      drawHome()
      drawHomeText()
    end


    function self:update(dt)
      updateKeys(dt)
    end

    return self
end

return HomeScreen
