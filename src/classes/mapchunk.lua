MapChunk = class('MapChunk')

binser.registerClass(MapChunk)

function MapChunk:initialize(properties)
  properties = properties or {}
  self._atlasX = properties['x']
  self._atlasY = properties['y']
  self._tilemap = properties['tilemap']
  self._blockmap = properties['blockmap']
  self._actorlist = properties['actorlist']
end

function MapChunk:setTileMap(tiles)
  self._tilemap = tiles
end

function MapChunk:returnTileMap()
  return self._tilemap
end

function MapChunk:setTile(tile,x,y)
  self._tilemap[y][x] = tile
end

function MapChunk:returnTile(x,y)
  return self._tilemap[y][x]
end

function MapChunk:setBlockMap(blocks)
  self._blockmap = blocks
end

function MapChunk:returnBlockMap()
  return self._blockmap
end

function MapChunk:setBlock(block,x,y)
  self._blockmap[y][x] = block
end

function MapChunk:returnTile(x,y)
  return self._blockmap[y][x]
end

function addActor(actor)
  table.insert(self._actorlist, actor)
end

function MapChunk:returnActorList()
  return self._actorlist
end


return map
