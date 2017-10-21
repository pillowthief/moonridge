local Screen = require('lib/ScreenManager/Screen')
require('src/utils/home-render')

local HomeScreen = {}

function HomeScreen.new()
    local self = Screen.new()

    function self:draw()

    end

    function self:update(dt)

    end

    return self
end

return HomeScreen
