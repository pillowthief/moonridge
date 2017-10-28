require ('src/utils/gui/gui-clock')
require ('src/utils/gui/gui-main-panel')

function generateMainPanel()
  local panel = {}
  for i=1,4 do
    panel[i] = {}
  end

  panel[1][1] = 1
  panel[1][2] = 2
  for i=3,38 do
    panel[1][i] = 10
  end
  panel[1][39] = 3
  panel[1][40] = 4

  panel[2][1] = 8
  for i=2,39 do
    panel[2][i] = 9
  end
  panel[2][40] = 11

  panel[3][1] = 15
  for i=2,39 do
    panel[3][i] = 9
  end
  panel[3][40] = 18

  panel[4][1] = 22
  panel[4][2] = 23
  for i=3,38 do
    panel[4][i] = 17
  end
  panel[4][39] = 24
  panel[4][40] = 25

  return panel
end

function generateSidePanel(height)
  local h = height or 8
  local panel = {}

  for i=1,4+h do
    panel[i] = {}
  end

  panel[1][1] = 20
  for i=2,7 do
    panel[1][i] = 21
  end
  panel[1][8] = 14

  for i=1,h do
    panel[i+1][1] = 7
    for q=2,7 do
      panel[i+1][q] = 9
    end
    panel[i+1][8] = 28
  end

  panel[h+2][1] = 19
  for i=2,7 do
    panel[h+2][i] = 9
  end
  panel[h+2][8] = 28

  panel[h+3][1] = 19
  for i=2,7 do
    panel[h+3][i] = 9
  end
  panel[h+3][8] = 28

  panel[h+4][1] = 26
  for i=2,7 do
    panel[h+4][i] = 16
  end
  panel[h+4][8] = 27

  return panel
end

local tabButtons = {
  {5,6,5,6,5,6},
  {12,13,12,13,12,13}
}

local itemButtons = {
  {5,6,5,6,5,6,5,6,5,6,5,6,5,6,5,6,5,6,5,6},
  {12,13,12,13,12,13,12,13,12,13,12,13,12,13,12,13,12,13,12,13}
}

local buttonMask = {
  {32,29},
  {31,30}
}

local mainPanel = generateMainPanel()
local sidePanel = generateSidePanel()

local tabSelector = 0

local tabs = {
  'log',
  'look',
  'calendar'
}

local tabIcons = {
  {33,35,34,35,41}
}

function changeTab(num)
  tabSelector = num
  if tabSelector < 0 then
    tabSelector = 0
  end
  if tabSelector > #tabs then
    tabSelector = #tabs
  end
  if tabSelector == 0 then
    setSidePanelOn(false)
  else
    setSidePanelOn(true)
  end
end


function xTabSelected()
  if tabSelector == 0 then
    return false
  else
    return tabSelector
  end
end

local itemSelector = 1

function itemSelected()
  return itemSelector
end

function selectItem(num)
  itemSelector = num
end

local GUIFlip = false
local sidePanelOn = false

function setGUIFlip(bool)
  GUIFlip = bool
end

function getGUIFlip()
  return GUIFlip
end

function setSidePanelOn(bool)
  sidePanelOn = bool
end

function shouldGUIFlip()
  local visible = getVisibleTiles()
  local y = Player:getApproxGridY()
  if y-visible[2] > (((visible[4])/2)+5) then
    setGUIFlip(true)
  elseif y-visible[2] > (((visible[4])/2)-6) then
    --do nothing
  else
    setGUIFlip(false)
  end
end

function drawGUI()
  drawGUIFeatures()
  drawButtonMasks()
  shouldGUIFlip()
  drawClock()
  drawMainPanelAll()
end

function drawGUIFeatures()
  local num = (itemSelected() - 1)
  if GUIFlip == true then
    drawGUIFeature(mainPanel, 0, 0, {0,0,0,0},{0,0,0,0},{247, 224, 79, 255},{229, 203, 39,255})
    drawGUIFeature(tabButtons, 0, 4, {0,0,0,0}, {133, 136, 145, 255}, {99, 102, 112, 255}, {57, 60, 68,255})
    drawGUIFeature(itemButtons, 14, 4, {0,0,0,0}, {247, 224, 79, 255}, {193, 154, 23, 255}, {229, 203, 39,255})
    drawGUIFeature(buttonMask, ((num*2)+14), 4, {190, 244, 247,30}, {0,0,0,0}, {0,0,0,0}, {255, 255, 255, 200})
    drawGUIFeature(tabIcons, 0.5, 4.5, {255, 255, 255, 255}, {244, 227, 227, 255}, {79, 1, 1, 255}, {17, 9, 9, 255})
  else
    drawGUIFeature(mainPanel, 0, 20, {0,0,0,0},{0,0,0,0},{247, 224, 79, 255},{229, 203, 39,255})
    drawGUIFeature(tabButtons, 0, 18, {0,0,0,0}, {133, 136, 145, 255}, {99, 102, 112, 255}, {57, 60, 68,255})
    drawGUIFeature(itemButtons, 14, 18, {0,0,0,0}, {247, 224, 79, 255}, {193, 154, 23, 255}, {229, 203, 39,255})
    drawGUIFeature(buttonMask, ((num*2)+14), 18, {190, 244, 247,30}, {0,0,0,0}, {0,0,0,0}, {255, 255, 255, 200})
    drawGUIFeature(tabIcons, 0.5, 18.5, {255, 255, 255, 255}, {244, 227, 227, 255}, {79, 1, 1, 255}, {17, 9, 9, 255})
  end
  if sidePanelOn == true then
    drawGUIFeature(sidePanel,0,6,{0,0,0,0}, {72, 81, 107, 255}, {193, 154, 23, 225}, {40, 44, 56,220})
  end
end

function drawButtonMasks()
  if GUIFlip == true then
    if xTabSelected() == false then
      --do nothing
    else
      local num = (xTabSelected() - 1)
      drawGUIFeature(buttonMask, (num*2), 4, {190, 244, 247,20}, {0,0,0,0}, {0,0,0,0}, {255, 255, 255, 200})
    end
  else
    if xTabSelected() == false then
      --do nothing
    else
      local num = (xTabSelected() - 1)
      drawGUIFeature(buttonMask, (num*2), 18, {190, 244, 247,20}, {0,0,0,0}, {0,0,0,0}, {255, 255, 255, 200})
    end
  end
end

function drawGUIFeature(tileset,offset_x,offset_y,color1,color2,color3,color4)
  love.graphics.setShader(ColorAssign)
  ColorAssign:send("color1", color1, {})
  ColorAssign:send("color2", color2, {})
  ColorAssign:send("color3", color3, {})
  ColorAssign:send("color4", color4, {})

  for i=1,#tileset do
    for q=1,#tileset[i] do
      local x = (q+offset_x-1) * TileW
      local y = (i+offset_y-1) * TileH
      local number = tileset[i][q]

      love.graphics.draw(GUI_Tiles, GUI_Quads[number], x, y)
    end
  end


  love.graphics.setShader()
end

function drawGUIText(colorString,tileX,tileY)
    love.graphics.setFont(FontArcade)
    local x = tileX * TileW
    local y = tileY * TileH

    love.graphics.print(colorString, x, y)
end
