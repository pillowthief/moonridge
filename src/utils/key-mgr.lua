require('src/render/menu-render')
require('src/render/home-render')

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
      elseif key == "g" then
        local x = Player:getApproxGridX()
        local y = Player:getApproxGridY()
        --local chunk = getLocalChunk('cen')
        --local tiles = chunk:getTileMap()
        TileTable[y][x] = Tile:new(ForestFloorGrass)
      elseif key == "escape" then
        ScreenManager.push('menu')
      elseif key == "delete" then
        love.event.quit("restart")
      elseif key == "1" then
        selectItem(1)
      elseif key == "2" then
        selectItem(2)
      elseif key == "3" then
        selectItem(3)
      elseif key == "4" then
        selectItem(4)
      elseif key == "5" then
        selectItem(5)
      elseif key == "6" then
        selectItem(6)
      elseif key == "7" then
        selectItem(7)
      elseif key == "8" then
        selectItem(8)
      elseif key == "9" then
        selectItem(9)
      elseif key == "0" then
        selectItem(10)
      elseif key == "l" then
        if xTabSelected() == 2 then
          changeTab(0)
        else
          changeTab(2)
        end
      elseif key == "m" then
        if xTabSelected() == 1 then
          changeTab(0)
        else
          changeTab(1)
        end
      elseif key == "r" then
        if xTabSelected() == 3 then
          changeTab(0)
        else
          changeTab(3)
        end
      end

    end
  end

  if curScreen == 'menu' then
    function love.keyreleased( key )
      if key == "`" then
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

  if curScreen == 'worldgen' then
    function love.keyreleased( key )
      if returnWGStep() == 5 then
        if key == "escape" then
          ScreenManager.switch('home')
        else
          STARTGAME(THEATLAS)
        end
      else
        if key == "escape" then
          ScreenManager.switch('home')
        elseif key == "w" then
          adjustWGCursorCoords(0,-8)
        elseif key == "a" then
          adjustWGCursorCoords(-8,0)
        elseif key == "s" then
          adjustWGCursorCoords(0,8)
        elseif key == "d" then
          adjustWGCursorCoords(8,0)
        elseif key == "up" then
          adjustWGCursorCoords(0,-8)
        elseif key == "left" then
          adjustWGCursorCoords(-8,0)
        elseif key == "down" then
          adjustWGCursorCoords(0,8)
        elseif key == "right" then
          adjustWGCursorCoords(8,0)
        elseif key == "return" then
          ScreenManager.push('wgc')
        else
          --do nothing for now
        end
      end
    end
  end

end
