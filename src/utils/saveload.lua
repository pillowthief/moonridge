function SAVETHEGAME()
  local time = getTotalMinutes()
  binser.writeFile('saves/save.dat', TileTable, BlockTable, ActorList, time)
end

function LOADAGAME()
  if love.filesystem.exists('saves/save.dat') then
    local level_data, len = binser.readFile('saves/save.dat')
    STARTGAME(level_data[1],level_data[2],level_data[3],level_data[4])
  else
  end
end
