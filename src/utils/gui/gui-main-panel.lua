local statBar  = {{43,44,44,44,44,44,45}}
local heartTemp = {{36,36,36,36,36,36,36}}

function drawMainPanelAll()
  drawMainPanelIcons()
  drawMainPanelText()
end

function drawMainPanelIcons()
  if getGUIFlip() == true then
    drawGUIFeature(statBar, 1, 2, {237, 232, 236, 175},{241, 255, 45,210},{241, 255, 45,210},{241, 255, 45,210})
    drawGUIFeature(statBar, 9, 2, {237, 232, 236, 175},{20, 232, 225,210},{20, 232, 225,210},{20, 232, 225,210})
    drawGUIFeature(heartTemp, 17, 2, {255, 73, 242, 50},{255, 73, 242,100},{255, 73, 242,150},{255, 73, 242,225})
  else
    drawGUIFeature(statBar, 1, 22, {237, 232, 236, 175},{241, 255, 45,210},{241, 255, 45,210},{241, 255, 45,210})
    drawGUIFeature(statBar, 9, 22, {237, 232, 236, 175},{20, 232, 225,210},{20, 232, 225,210},{20, 232, 225,210})
    drawGUIFeature(heartTemp, 17, 22, {255, 73, 242, 50},{255, 73, 242,100},{255, 73, 242,150},{255, 73, 242,225})
  end
end

function drawMainPanelText()
  if getGUIFlip() == true then
    drawGUIText({{241, 255, 45,255},'STAMINA'}, 1,1)
    drawGUIText({{20, 232, 225,255}, 'FOCUS'}, 9, 1)
    drawGUIText({{255, 73, 242,255},'HEALTH'},17,1)
  else
    drawGUIText({{241, 255, 45,255},'STAMINA'}, 1,21)
    drawGUIText({{20, 232, 225,255}, 'FOCUS'}, 9, 21)
    drawGUIText({{255, 73, 242,255},'HEALTH'},17,21)
  end
end
