upListener = conversation:listen('pressed up', function()
  movePlayer(PlayerPosition[2], PlayerPosition[1], PlayerPosition[2], PlayerPosition[1] - 1)
end)

downListener = conversation:listen('pressed down', function()
  movePlayer(PlayerPosition[2], PlayerPosition[1], PlayerPosition[2], PlayerPosition[1] + 1)
end)

rightListener = conversation:listen('pressed right', function()
  movePlayer(PlayerPosition[2], PlayerPosition[1], PlayerPosition[2] + 1, PlayerPosition[1])
end)

leftListener = conversation:listen('pressed left', function()
  movePlayer(PlayerPosition[2], PlayerPosition[1], PlayerPosition[2] - 1, PlayerPosition[1])
end)

escListener = conversation:listen('pressed escape', function()
  love.event.quit()
end)

delListener = conversation:listen('pressed delete', function()
  love.event.quit("restart")
end)
