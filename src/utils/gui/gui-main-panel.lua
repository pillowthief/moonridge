local statBar  = {{43,44,44,44,44,44,45}}
local heartTemp = {{36,36,36,36,36,36,36}}

function drawMainPanelAll()
  drawMainPanelIcons()
  drawMainPanelText()
end

function drawMainPanelIcons()
  if getGUIFlip() == true then
    drawGUIFeature(statBar, 1, 2, {17, 9, 9, 245},{247, 218, 0,255},{247, 218, 0,255},{247, 218, 0,255})
    drawGUIFeature(statBar, 9, 2, {17, 9, 9, 245},{0, 179, 196,255},{0, 179, 196,255},{0, 179, 196,255})
    drawGUIFeature(heartTemp, 17, 2, {211, 27, 56, 245},{178, 14, 40,255},{140, 4, 26,255},{102, 0, 17,255})
  else
    drawGUIFeature(statBar, 1, 22, {17, 9, 9, 245},{247, 218, 0,255},{247, 218, 0,255},{247, 218, 0,255})
    drawGUIFeature(statBar, 9, 22, {17, 9, 9, 245},{0, 179, 196,255},{0, 179, 196,255},{0, 179, 196,255})
    drawGUIFeature(heartTemp, 17, 22, {211, 27, 56, 245},{178, 14, 40,255},{140, 4, 26,255},{102, 0, 17,255})
  end
end

function drawMainPanelText()
  if getGUIFlip() == true then
    drawGUIText({{81, 73, 9,255},'STAMINA'}, 1,1)
    drawGUIText({{4, 0, 66,255}, 'FOCUS'}, 9, 1)
    drawGUIText({{66, 0, 0,255},'HEALTH'},17,1)
  else
    drawGUIText({{81, 73, 9,255},'STAMINA'}, 1,21)
    drawGUIText({{4, 0, 66,255}, 'FOCUS'}, 9, 21)
    drawGUIText({{66, 0, 0,255},'HEALTH'},17,21)
  end
end
