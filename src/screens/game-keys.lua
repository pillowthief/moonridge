upListener = conversation:listen('pressed up', function()
  movePlayer(Player:getX(), Player:getY() - Player:getSpeed())
end)

downListener = conversation:listen('pressed down', function()
  movePlayer(Player:getX(), Player:getY() + Player:getSpeed())
end)

rightListener = conversation:listen('pressed right', function()
  movePlayer(Player:getX() + Player:getSpeed(), Player:getY())
end)

leftListener = conversation:listen('pressed left', function()
  movePlayer(Player:getX() - Player:getSpeed(), Player:getY())
end)

escListener = conversation:listen('pressed escape', function()
  love.event.quit()
end)

delListener = conversation:listen('pressed delete', function()
  love.event.quit("restart")
end)
