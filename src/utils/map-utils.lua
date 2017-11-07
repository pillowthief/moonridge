function floodFill()


end


function expandTable(ySize,xSize)
  local table = {}
  for i=1,ySize do
    table[i] = {}
    for q=1,xSize do
      table[i][q] = {}
    end
  end
  return table
end
