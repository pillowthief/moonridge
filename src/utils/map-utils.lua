function floodFill()


end

function expandTableBlank(ySize,xSize)
  local table = {}
  for i=1,ySize do
    table[i] = {}
    for q=1,xSize do
      table[i][q] = {}
    end
  end
  return table
end

function expandTableFilled(ySize,xSize,fill)
  f = fill
  local table = {}
  for i=1,ySize do
    table[i] = {}
    for q=1,xSize do
      table[i][q] = f
    end
  end
  return table
end
