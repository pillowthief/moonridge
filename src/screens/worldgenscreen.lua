local Screen = require('lib/ScreenManager/Screen')
require('src/utils/worldgen-render')
require('src/utils/start-game')
require('src/gen/overworld-gen')

local WorldGenScreen = {}

function WorldGenScreen.new()
    local self = Screen.new()
    local curMap = {}
    local step = 1
    local tiles = {}
    local staringCoords = {0,0}
    setEmptyMap()

    function stepWGScreenForward()
      step = step + 1
    end

    function stepWGScreenBack()
      step = step - 1
    end

    function resetWGStep()
      step = 1
    end

    function returnWGStep()
      return step
    end

    function setWorldGenScreenTiles(ptiles)
      tiles = ptiles
    end

    function setWGStartingCoords(x,y)
      startingCoords = {x,y}
      stepWGScreenForward()
    end

    function self:draw()
      drawWolrdGenCurMap(tiles)
      if step == 5 then
        drawWGCursor()
        drawUnstartedText('Press ESC to go back to the home screen, press any other key to move forward.')
      elseif step == 4 then
        --generate chunks
      elseif step == 3 then
        drawWGCursor()
        drawChooseEmbarkText()
      elseif step == 2 then
        drawWorldGenText()
      elseif step == 1 then
        drawWorldGenText()
        drawUnstartedText('Press any key to start world generation or press ESC to go back.')
      end
    end


    function self:update(dt)
      updateProgress()
      updateGenerator()
      if step == 3 or step == 5 then
        updateKeys(dt)
      elseif step == 1 then
        updateKeyStart()
      end
    end

    return self
end

return WorldGenScreen
