
local menuGlyph = Glyph:new(MenuBlanks)

local MenuBlanks = {
  color1={60, 111, 193, 255}
}

function drawMenu()
  love.graphics.setShader(ColorAssign)
  local x_offset = 8
  local y_offset = 5

  for i=y_offset,(MAP_WIDTH - y_offset) do
    local y = i * TileH
    for q=x_offset,(MAP_HEIGHT - x_offset) do
      local x = q * TileW

      ColorAssign:send("color1", menuGlyph:getColor1(), {})
      ColorAssign:send("color2", menuGlyph:getColor2(), {})
      ColorAssign:send("color3", menuGlyph:getColor3(), {})
      ColorAssign:send("color4", menuGlyph:getColor4(), {})

      love.graphics.draw(World_Tiles, World_Quads[2], x, y)
    end
  end

  love.graphics.setShader()
end
