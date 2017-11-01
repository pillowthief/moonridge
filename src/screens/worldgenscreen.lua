local Screen = require('lib/ScreenManager/Screen')
require('src/utils/worldgen-render')
require('src/utils/start-game')
require('src/gen/overworld-gen')

local WorldGenScreen = {}

function WorldGenScreen.new()
    local self = Screen.new()
    local curMap = {}
    local done = false
    local tiles = {}
    local firstStep = true
    local tiles = {}
    setEmptyMap()

    function setDoneToTrue()
      done = true
    end

    function setWorldGenScreenTiles(ptiles)
      tiles = ptiles
    end


    function self:draw()
      drawWorldGenText()
      drawWolrdGenCurMap(tiles)
      if done == true then

      else

      end
    end


    function self:update(dt)
      updateProgress()
      updateGenerator()
      if done == true then
        updateKeys(dt)
      else
        updateKeyStart()
      end
    end

    return self
end

return WorldGenScreen
