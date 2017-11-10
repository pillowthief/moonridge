CameraMoving = false

local gamera = require 'lib/gamera'

local Grid = require ("lib/jumper/grid") -- The grid class
local Pathfinder = require ("lib/jumper/pathfinder") -- The pathfinder class

local walkable = 0
local cameragridtable = {}
local grid
local cameraStartPoint = {}
local cameraDestination = {}


local cameraSpeed = 1

function setupCamera() --add camera to the map for the first time
  PlayerPosition = {Player:getApproxGridY(), Player:getApproxGridX()}
  Cam = gamera.new(0,0,(MAP_WIDTH*TileW*3),(MAP_HEIGHT*TileH*3))
  Cam:setWindow(0,0,1280,768)
  Cam:setScale(1.0)

  createCameraGrid()

  Cam:setPosition(PlayerPosition[2] * TileW, PlayerPosition[1] * TileH)
end

function createCameraGrid()
  --an empty space for the camera to pathfind in, mostly so it can see things on other grids in relation to itself

  for rowIndex=1, MAP_WIDTH*3 do
    cameragridtable[rowIndex] = {}
    for columnIndex=1, MAP_HEIGHT*3 do
      cameragridtable[rowIndex][columnIndex] = 0
    end
  end
  grid = Grid(cameragridtable)

end

function checkPlayerDistFromCamera()
  if CameraMoving == false then
    PlayerPosition = {Player:getApproxGridY(), Player:getApproxGridX()}
    addDebugTile((PlayerPosition[2]*TileW),(PlayerPosition[1]*TileH))
    local myFinder = Pathfinder(grid, 'ASTAR', walkable)
    local cameraPosition = {Cam:getPosition()}
    cameraPosition[1] = cameraPosition[1] / TileW
    cameraPosition[2] = cameraPosition[2] / TileH

    local path = myFinder:getPath(cameraPosition[1], cameraPosition[2], PlayerPosition[2], PlayerPosition[1])

    if path then
      if path:getLength() > 10 then
        cameraStartPoint = {cameraPosition[2], cameraPosition[2]}
        cameraDestination = {PlayerPosition[2], PlayerPosition[1]}
        CameraMoving = true
      end
    end
  end
end

function updateCamera()
  if CameraMoving == true then --if the camera is moving, update it, else do nothing
    local cameraPosition = {Cam:getPosition()}
    cameraPosition[1] = cameraPosition[1] / TileW
    cameraPosition[2] = cameraPosition[2] / TileH
    if cameraPosition[1] == cameraDestination[1] and cameraPosition[2] == cameraDestination[2] then
      CameraMoving = false --if the camera is at its destination, it is no longer moving
      return
    else
      moveCameraTowards()
      --updateAllGlyphs()
    end
  end
end

local oldPath
local edgeSanityCounter = 0 -- to keep the camera from getting stuck on edges where it cant reach its destination
local recentCheckFlag = true

function moveCameraTowards()
  PlayerPosition = {Player:getApproxGridY(), Player:getApproxGridX()}
  addDebugTile((PlayerPosition[2]*TileW),(PlayerPosition[1]*TileH))
  local myFinder = Pathfinder(grid, 'ASTAR', walkable)
  local cameraPosition = {Cam:getPosition()}
  local path
  cameraPosition[1] = cameraPosition[1] / TileW
  cameraPosition[2] = cameraPosition[2] / TileH
  if math.floor(cameraPosition[1]) == cameraPosition[1] and math.floor(cameraPosition[2]) == cameraPosition[2] then -- sanity check
    local pathTest = myFinder:getPath(cameraPosition[1], cameraPosition[2], PlayerPosition[2], PlayerPosition[1])
    if pathTest:getLength() > 9 and recentCheckFlag == false then
      CameraMoving = false
      edgeSanityCounter = 0
      checkPlayerDistFromCamera()
      recentCheckFlag = true
      return
    else
      path = myFinder:getPath(cameraPosition[1], cameraPosition[2], cameraDestination[1], cameraDestination[2])
      oldPath = path
    end
  else path = oldPath end


  if path:getLength() < 2 then --we're close enough, clamp to location
    Cam:setPosition(cameraDestination[1] * TileW, cameraDestination[2] * TileH)
    redrawAllGlyphs()
    edgeSanityCounter = 0
  else
    local newX, newY

    if (cameraDestination[1] - cameraPosition[1]) == 0 then
      newX = cameraPosition[1]
    elseif (cameraDestination[1] - cameraPosition[1]) > 0 then --we're going right
      newX = cameraPosition[1] + cameraSpeed
    else -- we're going left
      newX = cameraPosition[1] - cameraSpeed
    end

    if (cameraDestination[2] - cameraPosition[2]) == 0 then
      newY = cameraPosition[2]
    elseif (cameraDestination[2] - cameraPosition[2]) > 0 then --we're going right
      newY = cameraPosition[2] + cameraSpeed
    else -- we're going left
      newY = cameraPosition[2] - cameraSpeed
    end
    Cam:setPosition(newX * TileW, newY * TileH)
    redrawAllGlyphs()
    edgeSanityCounter = edgeSanityCounter + 1 -- add to the sanity checker
  end



  if edgeSanityCounter > 5 then -- we're stuck, stop trying to complete the path
    recentCheckFlag = false
  elseif edgeSanityCounter > 20 then
    CameraMoving = false
    edgeSanityCounter = 0
    checkPlayerDistFromCamera() end

end
