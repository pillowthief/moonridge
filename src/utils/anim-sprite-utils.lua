function drawActors()
  love.graphics.setShader(ColorAssign)

  for i=1, #ActorList do
    local x = ActorList[i]:getX() * TileW - 32
    local y = ActorList[i]:getY() * TileH - 32

    ColorAssign:send("color1", ActorList[i]:getColor1(), {})
    ColorAssign:send("color2", ActorList[i]:getColor2(), {})
    ColorAssign:send("color3", ActorList[i]:getColor3(), {})
    ColorAssign:send("color4", ActorList[i]:getColor4(), {})

    love.graphics.draw(Actor_Sprites, Actor_Quads[2], x, y)
  end

  love.graphics.setShader()

end
