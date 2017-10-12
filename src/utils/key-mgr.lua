function updateKeys()
  if love.keyboard.isDown( "up" ) then
     movePlayer(PlayerPosition[2], PlayerPosition[1], PlayerPosition[2], PlayerPosition[1] - 1)
  end

  if love.keyboard.isDown( "down" ) then
     movePlayer(PlayerPosition[2], PlayerPosition[1], PlayerPosition[2], PlayerPosition[1] + 1)
  end

  if love.keyboard.isDown( "right" ) then
     movePlayer(PlayerPosition[2], PlayerPosition[1], PlayerPosition[2] + 1, PlayerPosition[1])
  end

  if love.keyboard.isDown( "left" ) then
     movePlayer(PlayerPosition[2], PlayerPosition[1], PlayerPosition[2] - 1, PlayerPosition[1])
  end

  if love.keyboard.isDown ( "escape" ) then
    love.event.quit()
  end

  if love.keyboard.isDown ( "delete" ) then
    love.event.quit("restart")
  end


end
