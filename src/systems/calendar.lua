--[[
147 days in a year
8 months ~weeks in each
6 day weeks
24 hours in a day
30 minutes in an hour
]]--
local daysYear = 147
local hoursDay = 24
local minutesHour = 30



function getTotalMinutes()
  return totalMinutes
end

function getStartingYear()
  local year = 423
  local ran1 = love.math.random(1,80)
  year = year + ran1
  local ran2 = (love.math.random(1,20)-10)
  year = year + ran2
  return year
end

function getStartingDay()
  local day = love.math.random(1,147)
  return day
end


local currentYear
local currentDay
local totalMinutes
local currentHour
local currentMinute
local currentDayWeek
local currentMonth

function startTheClock (totalminutes)
  totalMinutes = totalminutes or 0
  if totalMinutes == 0 then --initiating a new calendar
    currentYear = getStartingYear()
    currentDay = getStartingDay()
    currentHour = love.math.random(6,9)
    currentMinute = love.math.random(1,30)
    totalMinutes = (((currentYear * 147)*24)*30) + ((currentDay*24)*30) + (currentHour*30) + currentMinute
  else
    currentYear = math.floor(((totalMinutes / 30)/24)/147)
    local tempMinutes = totalMinutes - (((currentYear * 147)*24)*30)
    currentDay = math.floor((tempMinutes / 30)/24)
    local tempMinutes2 = tempMinutes - ((currentDay*24)*30)
    currentHour = math.floor(tempMinutes2/30)
    tempMinutes = tempMinutes2 - (currentHour*30)
    currentMinute = tempMinutes
  end
end

function getCurrentYear()
  return currentYear
end

function getCurrentDay()
  return currentDay
end

function getCurrentHour()
  return currentHour
end

function getCurrentMinute()
  return currentMinute
end


function updateCalendar()
  totalMinutes = totalMinutes + 1
  updateCurrentMinute()
end

function updateCurrentMinute()
  currentMinute = currentMinute + 1
  if currentMinute > 30 then
    currentMinute = 1
    updateCurrentHour()
  end
end

function updateCurrentHour()
  currentHour = currentHour + 1
  if currentHour > 24 then
    currentHour = 1
    updateCurrentDay()
  end
end

function updateCurrentDay()
  currentDay = currentDay + 1
  if currentDay > 147 then
    currentDay = 1
    updateCurrentYear()
  end
end

function updateCurrentYear()
  currentYear = currentYear + 1
end
