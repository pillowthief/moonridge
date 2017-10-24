--[[
147 days in a year
8 months ~weeks in each
6 day weeks
24 hours in a day
60 minutes in an hour
]]--
local daysYear = 147
local hoursDay = 24
local minutesHour = 60

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
local partOfDay

function startTheClock (totalminutes)
  totalMinutes = totalminutes or 0
  if totalMinutes == 0 then --initiating a new calendar
    currentYear = getStartingYear()
    currentDay = getStartingDay()
    currentHour = love.math.random(6,9)
    currentMinute = love.math.random(1,minutesHour)
    totalMinutes = (((currentYear * 147)*24)*minutesHour) + ((currentDay*24)*minutesHour) + (currentHour*minutesHour) + currentMinute
  else
    currentYear = math.floor(((totalMinutes / minutesHour)/24)/147)
    local tempMinutes = totalMinutes - (((currentYear * 147)*24)*minutesHour)
    currentDay = math.floor((tempMinutes / minutesHour)/24)
    local tempMinutes2 = tempMinutes - ((currentDay*24)*minutesHour)
    currentHour = math.floor(tempMinutes2/minutesHour)
    tempMinutes = tempMinutes2 - (currentHour*minutesHour)
    currentMinute = tempMinutes
  end
end

function getTotalMinutes()
  return totalMinutes
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

function getPartOfDay()
  return partOfDay
end


function updateCalendar()
  totalMinutes = totalMinutes + 1
  updateCurrentMinute()
  updatePartOfDay()
end

function updateCurrentMinute()
  currentMinute = currentMinute + 1
  if currentMinute > minutesHour then
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

function updatePartOfDay()
  local hour = getCurrentHour()
  local minute = getCurrentMinute()
  minute = minute + (hour*60)
  if minute < 180 then
    partOfDay = 'midnight'
  elseif minute < 300 then
    partOfDay = 'predawn'
  elseif minute < 390 then
    partOfDay = 'dawn'
  elseif minute < 540 then
    partOfDay = 'earlymorn'
  elseif minute < 690 then
    partOfDay = "latemorn"
  elseif minute < 780 then
    partOfDay = "noon"
  elseif minute < 890 then
    partOfDay = "earlyaf"
  elseif minute < 1020 then
    partOfDay = "lateaf"
  elseif minute < 1170 then
    partOfDay = "evening"
  elseif minute < 1230 then
    partOfDay = "sunset"
  else
    partOfDay = "gloam"
  end
end
