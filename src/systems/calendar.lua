function getStartingYear()
  local year = 423
  local ran1 = love.math.random(1,80)
  year = year + ran1
  local ran2 = (love.math.random(1,20)-10)
  year = year + ran2
  return year
end

function getStartingDay()
  local day = 1
  local ran1 = love.math.random()
end
