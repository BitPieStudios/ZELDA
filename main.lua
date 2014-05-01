function love.load()
  Tileset = love.graphics.newImage('countryside.png')
  tileW, tileH = 32,32
  tilesetW, tilesetH = Tileset:getWidth(),Tileset:getHeight()
--first are x and y coordinates where left corner starts.
--second and third are width and height of tile.
--fourth and fifth are are reference width and height these are usually the tileset's width and height. 

  GrassQuad = love.graphics.newQuad(0,  0, tileW, tileH, tilesetW, tilesetH)
  BoxQuad = love.graphics.newQuad(32, 0, tileW, tileH, tilesetW, tilesetH)
  FlowerQuad = love.graphics.newQuad(0,32,tileW,tileH,tilesetW,tilesetH)
  BoxtopQuad = love.graphics.newQuad(32,32,tileW,tileH,tilesetW,tilesetH)

  TileQuadMap = {GrassQuad, BoxQuad, FlowerQuad, BoxtopQuad}

  TileTable = {
    {1,1,1,2,3,4},
    {1,2,1},
    {1,1,1}
  }
end

function love.draw()
  --first is tileset.
  --second is quad used to point to tile wanted to draw from the quad.
  -- last are x & y coordinates.
  for rowIndex=1, #TileTable do
    local row = TileTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      love.graphics.draw(Tileset, TileQuadMap[number], (columnIndex-1)*tileW, (rowIndex-1)*tileH)
    end
  end
end