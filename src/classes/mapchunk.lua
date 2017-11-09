MapChunk = class('MapChunk')

binser.registerClass(MapChunk)

function MapChunk:initialize(x,y,tilemap,blockmap,actorlist)
  self._atlasX = x
  self._atlasY = y
  self._tilemap = tilemap
  self._blockmap = blockmap or {}
  self._actorlist = actorlist or {}
  self._utileguide = {}
end

function MapChunk:getAtlasCoords()
  local coords = {self._atlasX, self._atlasY}
  return coords
end

function MapChunk:setTileMap(tiles)
  self._tilemap = tiles
end

function MapChunk:getTileMap()
  return self._tilemap
end

function MapChunk:setTile(tile,x,y)
  self._tilemap[y][x] = tile
end

function MapChunk:getTile(x,y)
  return self._tilemap[y][x]
end

function MapChunk:setBlockMap(blocks)
  self._blockmap = blocks
end

function MapChunk:getBlockMap()
  return self._blockmap
end

function MapChunk:setBlock(block,x,y)
  self._blockmap[y][x] = block
end

function MapChunk:getBlock(x,y)
  return self._blockmap[y][x]
end

function MapChunk:addActor(actor)
  table.insert(self._actorlist, actor)
end

function MapChunk:getActorList()
  return self._actorlist
end

function MapChunk:removeDeadActors()

end


return map
