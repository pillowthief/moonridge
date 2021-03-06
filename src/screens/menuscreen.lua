local Screen = require('lib/ScreenManager/Screen')
require('src/render/menu-render')
require 'src/utils/saveload'

local MenuScreen = {}

function MenuScreen.new()
    local self = Screen.new()

    menuTiles = generateMenuTileMap()

    function self:draw()
      Cam:draw(function(l,t,w,h)
        drawMenuFog()
        drawMenu(menuTiles)
        drawMenuText()
      end)
    end

    function self:update(dt)
      updateKeys(dt)
    end

    return self
end

return MenuScreen
