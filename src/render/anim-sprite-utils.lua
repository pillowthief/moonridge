function drawActors()
  love.graphics.setShader(ColorAssign)

  for i=1, #ActorList do
    local x = ActorList[i]:getX()
    local y = ActorList[i]:getY()

    ColorAssign:send("color1", ActorList[i]:getColor1(), {})
    ColorAssign:send("color2", ActorList[i]:getColor2(), {})
    ColorAssign:send("color3", ActorList[i]:getColor3(), {})
    ColorAssign:send("color4", ActorList[i]:getColor4(), {})

    playerSprite:draw((x),(y))
  end

  love.graphics.setShader()

end
