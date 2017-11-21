local previousPart

function getSeasonTint()

end

function getColorFromTime()
  local color = {}
  local time = getPartOfDay()

  if time == 'midnight' then
    color = {3, 10, 22}
  elseif time == 'predawn' then
    color = {41, 55, 79}
  elseif time == 'dawn' then
    color = {139, 157, 188}
  elseif time == 'earlymorn' then
    color = {204, 229, 208}
  elseif time == 'latemorn' then
    color = {227, 244, 168}
  elseif time == 'noon' then
    color = {247, 247, 143}
  elseif time == 'earlyaf' then
    color = {244, 230, 124}
  elseif time == 'lateaf' then
    color = {249, 187, 213}
  elseif time == 'evening' then
    color = {164, 133, 221}
  elseif time == 'sunset' then
    color = {188, 47, 110}
  elseif time == 'gloam' then
    color = {29, 41, 61}
  else color = {244, 230, 124}
  end

  return color
end

function getStrengthFromTime()
  if time == 'midnight' then
  elseif time == 'predawn' then
  elseif time == 'dawn' then
  elseif time == 'earlymorn' then
  elseif time == 'latemorn' then
  elseif time == 'noon' then
  elseif time == 'earlyaf' then
  elseif time == 'lateaf' then
  elseif time == 'evening' then
  elseif time == 'sunset' then
  elseif time == 'gloam' then
  end

  return 0.5

end
