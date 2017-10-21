require('src/utils/menu-render')
require('src/utils/home-render')

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
        ScreenManager.push('menu')
      elseif key == "delete" then
        love.event.quit("restart")
      end
    end
  end

  if curScreen == 'menu' then
    function love.keyreleased( key )
      if key == "`" then
      elseif key == "m" then
      elseif key == "escape" then
        ScreenManager.pop()
      elseif key == "delete" then
      elseif key == "up" then
        setMenuSelector(-1)
      elseif key == "down" then
        setMenuSelector(1)
      elseif key == "return" then
        menuActions()
      end
    end
  end

  if curScreen == 'home' then
    function love.keyreleased( key )
      if key == "`" then
      elseif key == "m" then
      elseif key == "escape" then
        love.event.quit()
      elseif key == "delete" then
      elseif key == "up" then
        setHomeSelector(-1)
      elseif key == "down" then
        setHomeSelector(1)
      elseif key == "return" then
        homeActions()
      end
    end
  end


end
