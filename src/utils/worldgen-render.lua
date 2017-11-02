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

function resetActiveBar()
  activeBar = 1
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
  local height = (4 * TileH)-16
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

local phase = 255
local phasing = 'down'
function drawUnstartedText(message)
  local height = (10 * TileH)
  local width = (5 * TileW)
  love.graphics.setColor(0, 0, 0, phase)
  love.graphics.rectangle("fill", width, height, 928, 128 )
  if phase >= 255 then
    phase = 255 --in case it came in above 255 which is bad
    phasing = 'down'
  elseif phase <= 0 then
    phase = 0
    phasing = 'up'
  end
  if phasing == 'up' then
    phase = phase + 5
  elseif phasing == 'down' then
    phase = phase - 5
  end
  love.graphics.setColor(255, 238, 0, ((255+phase)/2))

  love.graphics.setFont(FontCommo)

  love.graphics.printf(message, (width+32),(height)+8, 864, 'center')

  love.graphics.setColor(255,255,255)
end
