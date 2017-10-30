local gamera = require 'lib/gamera'

Cam = gamera.new(0,0,1280,768)
Cam:setScale(1.0)

local progressBars = {
  'Climate Generation',
  'Biome Assigment',
  'River Placement',
  'Lake Placement'
}

local activeBar = 1

function stepForwardActiveBar()
  activeBar = activeBar + 1
end



function drawWorldGenProgressBars()
  love.graphics.setShader(ColorAssign)


  for l=1,#progressBars do
    local x,y = (1*TileW),(4+(l*2))*TileH
    if l<activeBar then
      for i=1,12 do
        local nX = x + (i*TileW)
        ColorAssign:send("color1", {255, 255, 255, 255}, {})
        ColorAssign:send("color2", {60, 111, 193, 255}, {})
        ColorAssign:send("color3", {60, 111, 193, 255}, {})
        ColorAssign:send("color4", {60, 111, 193, 255}, {})
        local num
        if i==1 then
          num = 43
        elseif i==12 then
          num = 45
        else
          num = 44
        end
        love.graphics.draw(GUI_Tiles, GUI_Quads[num], nX, y)
      end
    elseif l== activeBar then
      for i=1,12 do
        local nX = x + (i*TileW)
        ColorAssign:send("color1", {255, 255, 255, 255}, {})
        ColorAssign:send("color2", {60, 111, 193, 255}, {})
        ColorAssign:send("color3", {60, 111, 193, 255}, {})
        ColorAssign:send("color4", {60, 111, 193, 255}, {})
        local num
        if i==1 then
          num = 43
        elseif i==12 then
          num = 45
        else
          num = 44
        end
        love.graphics.draw(GUI_Tiles, GUI_Quads[num], nX, y)
      end
    else
      for i=1,12 do
        local nX = x + (i*TileW)
        ColorAssign:send("color1", {255, 255, 255, 255}, {})
        ColorAssign:send("color2", {0,0,0,0}, {})
        ColorAssign:send("color3", {0,0,0,0}, {})
        ColorAssign:send("color4", {0,0,0,0}, {})
        local num
        if i==1 then
          num = 43
        elseif i==12 then
          num = 45
        else
          num = 44
        end
        love.graphics.draw(GUI_Tiles, GUI_Quads[num], nX, y)
      end
    end


  end

  love.graphics.setShader()

end


local skip = 0
local storedMaps = {}
function updateProgress()
  local map = returnCurColorMap()
  if #storedMaps == 0 then
    storedMaps[1] = map
  end
  for i=1,#storedMaps do
    if map == storedMaps[i] then
      --do nothing for now
    else
      storedMaps[storedMaps+1] = map
    end
  end
  if skip > 30 then
    table.remove(storedMaps,1)
    skip = 0
  elseif skip > 0 then
    skip = skip + 1
  elseif skip == 0 then
    setWorldGenScreenTiles(storedMaps[1])
  end

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
  local height = (5 * TileH)-16
  local width = (2 * TileW)

  love.graphics.setFont(FontCommo)

  for l=1,#progressBars do

    if l < activeBar then
      love.graphics.setColor(77, 193, 19,255)
      love.graphics.print('Done!', width, height)
    else
      love.graphics.setColor(244,244,66,255)
      love.graphics.print(progressBars[l], width, height)
    end
    height = height + 64

  end


end
