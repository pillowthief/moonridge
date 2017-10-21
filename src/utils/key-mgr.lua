function updateKeys(dt)
  local curScreen = ScreenManager.getCurrent()

  if curScreen == 'game' then
    if love.keyboard.isDown( "up" ) then
      movePlayer(Player:getX(), Player:getY() - Player:getSpeed())
      playerSprite:switch('walkUp', true)
    end

    if love.keyboard.isDown( "down" ) then
      movePlayer(Player:getX(), Player:getY() + Player:getSpeed())
      playerSprite:switch('walkDown', true)
    end

    if love.keyboard.isDown( "right" ) then
      movePlayer(Player:getX() + Player:getSpeed(), Player:getY())
      playerSprite:switch('walkRight', true)
    end

    if love.keyboard.isDown( "left" ) then
      movePlayer(Player:getX() - Player:getSpeed(), Player:getY())
      playerSprite:switch('walkLeft', true)
    end

    function love.keyreleased( key )
      if key == "`" then
        debugDrawToggle()
      elseif key == "m" then
      elseif key == "escape" then
        love.event.quit()
      elseif key == "delete" then
        love.event.quit("restart")
      end
    end
  end

  if curScreen == 'menu' then
    if love.keyboard.isDown( "up" ) then
    end

    if love.keyboard.isDown( "down" ) then
    end

    if love.keyboard.isDown( "right" ) then
    end

    if love.keyboard.isDown( "left" ) then
    end

    function love.keyreleased( key )
      if key == "`" then
      elseif key == "m" then
      elseif key == "escape" then
      elseif key == "delete" then
      end
    end
  end


end
