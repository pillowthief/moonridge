function drawMap()
  if CameraMoving == true then
    x_offset = frozenCameraRef[1] - 10
    if x_offset < 0 then x_offset = 0 end
    y_offset = frozenCameraRef[2] - 10
    if y_offset < 0
  local visible = {}
  visible = {Cam:getVisible()}
  local x_offset = 0
  local y_offset = 0

  if visible[1] == 0 then x_offset = 0
  else x_offset = visible[1] / TileW end

  if visible[2] == 0 then y_offset = 0
  else y_offset = visible[2] / TileH end

  local max_x = visible[3] / TileW
  local max_y = visible[4] / TileH

  for rowIndex=1, max_y do
    local row = TileTable[rowIndex + y_offset]
    for columnIndex=1, max_x do
      local number = row[columnIndex + x_offset]
      local x,y = (columnIndex-1 + x_offset)*TileW, (rowIndex-1 + y_offset)*TileH

      love.graphics.draw(Tileset, Quads[number], x, y)
    end
  end

  frozenCameraRef = {x_offset, y_offset, max_x, max_y}
end



function drawMap()
  for rowIndex=1, #TileTable do
    local row = TileTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      local x,y = (columnIndex-1)*TileW, (rowIndex-1)*TileH

      love.graphics.draw(Tileset, Quads[number], x, y)
    end
  end
end
