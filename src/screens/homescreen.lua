local Screen = require('lib/ScreenManager/Screen')
require('src/render/home-render')
require('src/utils/start-game')
require 'src/utils/saveload'

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
