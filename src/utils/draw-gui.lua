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

local mainPanel = generateMainPanel()

local sidePanel = generateSidePanel()
local sideLookPanel = generateSidePanel(2)

local GUIFlip = false

function setGUIFlip(bool)
  GUIFlip = bool
end

function shouldGUIFlip()
  local visible = getVisibleTiles()
  local y = Player:getApproxGridY()
  if y-visible[2] > ((visible[4]-visible[2])/2)+2 then
    setGUIFlip(true)
  elseif y-visible[2] > ((visible[4]-visible[2])/2)-2 then
    --do nothing
  else
    setGUIFlip(false)
  end
end

function drawGUI()
  drawGUIFeatures()
  shouldGUIFlip()
end

function drawGUIFeatures()
  if GUIFlip == true then
    drawGUIFeature(mainPanel, 0, 0, {0,0,0,0},{0,0,0,0},{247, 224, 79, 255},{229, 203, 39,255})
    drawGUIFeature(tabButtons, 0, 4, {0,0,0,0}, {247, 224, 79, 255}, {193, 154, 23, 255}, {229, 203, 39,255})
    drawGUIFeature(itemButtons, 14, 4, {0,0,0,0}, {247, 224, 79, 255}, {193, 154, 23, 255}, {229, 203, 39,255})
  else
    drawGUIFeature(mainPanel, 0, 20, {0,0,0,0},{0,0,0,0},{247, 224, 79, 255},{229, 203, 39,255})
    drawGUIFeature(tabButtons, 0, 18, {0,0,0,0}, {247, 224, 79, 255}, {193, 154, 23, 255}, {229, 203, 39,255})
    drawGUIFeature(itemButtons, 14, 18, {0,0,0,0}, {247, 224, 79, 255}, {193, 154, 23, 255}, {229, 203, 39,255})
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
