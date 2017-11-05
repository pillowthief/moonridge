local Screen = require('lib/ScreenManager/Screen')
require('src/utils/worldgen-render')
require('src/utils/start-game')
require('src/gen/overworld-gen')

local WorldGenScreen = {}

function WorldGenScreen.new()
    local self = Screen.new()
    local curMap = {}
    local done = false
    local started = false
    local tiles = {}
    local firstStep = true
    local tiles = {}
    local staringCoords = {0,0}
    local startingCoordsSet = false
    setEmptyMap()

    function setWGDoneToBool(bool)
      done = bool
    end

    function setWGStartedToBool(bool)
      started = bool
    end

    function setWorldGenScreenTiles(ptiles)
      tiles = ptiles
    end

    function setWGStartingCoords(x,y)
      startingCoords = {x,y}
      startingCoordsSet = true
    end

    function returnWGStartingCoords()
      return startingCoords
    end

    function returnStartingCoordsSet()
      return startingCoordsSet
    end

    function self:draw()
      drawWorldGenText()
      drawWolrdGenCurMap(tiles)
      if done == true and startingCoordsSet == true then
        drawWGCursor()
        drawUnstartedText('Press esc to go back, R to draw a new map, press any other key to move forward.')
      elseif done == true then
        drawWGCursor()
      elseif started == false then
        drawUnstartedText('Press any key to start world generation or press esc to go back.')
      end
    end


    function self:update(dt)
      updateProgress()
      updateGenerator()
      if done == true then
        updateKeys(dt)
      elseif started == false then
        updateKeyStart()
      else
        --do nothing for now
      end
    end

    return self
end

return WorldGenScreen
