local gamera = require 'lib/gamera'

Cam = gamera.new(0,0,1280,768)
Cam:setScale(1.0)

local progressBars = {
  'Temperature Generation',
  'Moisture Generation',
  'Biome Assigment',
  'River Placement',
  'Lake Placement'
}

local activeBar = 1

function stepForwardActiveBar()
  activeBar = activeBar + 1
end

local skip = 0
local storedMaps = {}

function pushToStoredMaps(map)
  storedMaps[#storedMaps+1] = map
end


function updateProgress()
  if skip > 5 then
    if #storedMaps > 1 then
      emptyMap = false
      table.remove(storedMaps,1)
    else
      setNextStep(true)
    end
    skip = 0
  elseif skip > 0 then
    skip = skip + 1
  elseif skip == 0 then
    setWorldGenScreenTiles(storedMaps[1])
    skip = skip + 1
  end

end


function updateKeyStart()
  function love.keyreleased( key )
    if key == 'escape' then
      ScreenManager.switch('home')
    else
      generateOverworld()
    end
  end
end

local emptyMap = false
function setEmptyMap()
  local tiles = {}
    for i=1,384 do
      tiles[i] = {}
      for q=1,384 do
        tiles[i][q] = {60, 111, 193, 255}
      end
    end
    emptyMap = true
    pushToStoredMaps(tiles)
end


function drawWolrdGenCurMap(TileTable)
  for y=1,#TileTable do
    for x=1,#TileTable[y] do
      local color = TileTable[y][x]
      love.graphics.setColor(color)
      love.graphics.rectangle("fill", ((x-1)*2)+512, ((y-1)*2), 2, 2 )
    end
  end
end


function drawWorldGenText()
  love.graphics.setColor(255,255,255)
  local height = (5 * TileH)-16
  local width = (2 * TileW)

  love.graphics.setFont(FontCommo)

  for l=1,#progressBars do
    local item = {}
    if l == activeBar then
      item = {{239, 72, 11,225},progressBars[l]}
    elseif l < activeBar then
      item = {{77, 193, 19,255},'Done!'}
    else
      item = {{255,255,255,225},progressBars[l]}
    end

    love.graphics.printf(item, width, height, 400)
    height = height + 32
  end
end
