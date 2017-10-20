upListener = conversation:listen('pressed up', function()
  movePlayer(Player:getX(), Player:getY() - Player:getSpeed())
  playerSprite:switch('walkUp', true)
end)

downListener = conversation:listen('pressed down', function()
  movePlayer(Player:getX(), Player:getY() + Player:getSpeed())
  playerSprite:switch('walkDown', true)
end)

rightListener = conversation:listen('pressed right', function()
  movePlayer(Player:getX() + Player:getSpeed(), Player:getY())
  playerSprite:switch('walkRight', true)
end)

leftListener = conversation:listen('pressed left', function()
  movePlayer(Player:getX() - Player:getSpeed(), Player:getY())
  playerSprite:switch('walkLeft', true)
end)

escListener = conversation:listen('pressed escape', function()
  love.event.quit()
end)

delListener = conversation:listen('pressed delete', function()
  love.event.quit("restart")
end)

tildeListener = conversation:listen('pressed tilde', function()
  debugDrawToggle()
end)
