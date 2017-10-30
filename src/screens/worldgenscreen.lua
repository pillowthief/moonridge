local Screen = require('lib/ScreenManager/Screen')
require('src/utils/worldgen-render')
require('src/utils/start-game')
require('src/gen/overworld-gen')


local WorldGenScreen = {}

function WorldGenScreen.new()
    local self = Screen.new()
    local curMap = {}
    local done = true
    local tiles = {}
    local tempMap = generateTemperatureMap()

    function setWorldGenScreenTiles(ptiles)
      tiles = ptiles
    end


    function self:draw()
      drawWorldGenProgressBars()
      drawWorldGenText()
      drawWolrdGenCurMap(tiles)
    end


    function self:update(dt)

      if done == true then
        updateProgress()
        updateKeys(dt)
      end
    end

    return self
end

return WorldGenScreen
