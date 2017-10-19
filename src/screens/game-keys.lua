upListener = conversation:listen('pressed up', function()
  movePlayer(Player:getX(), Player:getY(), Player:getX(), Player:getY() - 1)
end)

downListener = conversation:listen('pressed down', function()
  movePlayer(Player:getX(), Player:getY(), Player:getX(), Player:getY() + 1)
end)

rightListener = conversation:listen('pressed right', function()
  movePlayer(Player:getX(), Player:getY(), Player:getX() + 1, Player:getY())
end)

leftListener = conversation:listen('pressed left', function()
  movePlayer(Player:getX(), Player:getY(), Player:getX() - 1, Player:getY())
end)

escListener = conversation:listen('pressed escape', function()
  love.event.quit()
end)

delListener = conversation:listen('pressed delete', function()
  love.event.quit("restart")
end)
