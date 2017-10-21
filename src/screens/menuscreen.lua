local Screen = require('lib/ScreenManager/Screen')
require('src/screens/menu-keys')
require('src/utils/menu-render')

local MenuScreen = {}

function MenuScreen.new()
    local self = Screen.new()

    menuKeyMgr()

    function self:draw()
        drawMenu()
    end

    function self:update(dt)

    end

    return self
end

return MenuScreen
