local tileW, tileH, tileset, quads, tileTable

function loadMap(path)
  --loads an external file.
  love.filesystem.load(path)()

  function newMap(tileWidth,tileHeight,tilesetPath,quadInfo,tileString)
    TileWidth, TileHeight = tileW,tileH
    Tileset = love.graphics.newImage(tilesetPath)

 
--numbers are where x and y coordinates start 
local tilesetW, tilesetH = Tileset:getWidth(),Tileset:getHeight()

  Quads = {}


-- quadInfo[2] == {32,0}
-- quadInfo[2][1] == 32
-- quadInfo[2][0] == 0

-- Quads[1] = love.graphics.newQuad(quadInfo[1][1], quadInfo[1][2], TileW, TileH, tilesetW, tilesetH)
-- Quads[2] = love.graphics.newQuad(quadInfo[2][1], quadInfo[2][2], TileW, TileH, tilesetW, tilesetH)
-- Quads[3] = love.graphics.newQuad(quadInfo[3][1], quadInfo[3][2], TileW, TileH, tilesetW, tilesetH)
-- Quads[4] = love.graphics.newQuad(quadInfo[4][1], quadInfo[4][2], TileW, TileH, tilesetW, tilesetH)
-- Quads[5] = love.graphics.newQuad(quadInfo[5][1], quadInfo[5][2], TileW, TileH, tilesetW, tilesetH)
-- Quads[6] = love.graphics.newQuad(quadInfo[6][1], quadInfo[6][2], TileW, TileH, tilesetW, tilesetH)
-- Quads[7] = love.graphics.newQuad(quadInfo[7][1], quadInfo[7][2], TileW, TileH, tilesetW, tilesetH)
-- Quads[8] = love.graphics.newQuad(quadInfo[8][1], quadInfo[8][2], TileW, TileH, tilesetW, tilesetH)

--   Quads[i] = love.graphics.newQuad(quadInfo[i][1], quadInfo[i][2], TileW, TileH, tilesetW, tilesetH)

  for i,info in ipairs(quadInfo) do
    -- info[1] = x, info[2] = y
    Quads[info[1]] = love.graphics.newQuad(info[2], info[3], TileW, TileH, tilesetW, tilesetH)
  end

  TileTable = {}
  local width = #(tileString:match("[^%s]+"))

  for x = 1,width,1 do
    TileTable[x] = {} 
  end

  local rowIndex,columnIndex = 1,1
  --[^\n] means anything that's not a new line character
  --[^%s] means anything that is not a whitespace character(Ex. Spaces, Tabs, Newlines)
  for row in tileString:gmatch("[^%s]+") do
    assert(#row == width, 'Map is not aligned: width of row ' .. tostring(rowIndex) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
    columnIndex = 1
    -- "48134"
    -- {"4", "8", "1", "3", "4"}
    for character in row:gmatch(".") do
      TileTable[rowIndex][columnIndex] = character
      columnIndex = columnIndex + 1
    end
    rowIndex=rowIndex+1
  end


end

-- how rowindex works.
-- 1, {8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8}
-- 2, {8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8},
-- 3, {8,8,8,8,8,1,2,2,2,2,2,2,1,1,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8},
-- 4, {8,8,8,8,8,4,8,8,8,8,8,8,3,3,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8},
-- 5, {8,8,8,1,1,4,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8},
-- 7, {4,8,1,3,4,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6}

--" butt  uuu"
--Tilemap = 
--"nnnnnnnnnUUUUUUUnnnnn
--"nnnUUUUUnnnnn
--UUUUnnnnnnnnnUUUUUUnnnhghgjhgjhg

--how columnindex works, for code on row 7.
-- 1,4
-- 2,8
-- 3,1
-- 4,3
-- 5,4
-- 6,6
-- 7,6
-- 8,6
-- ....

function drawMap()
  for rowIndex,row in ipairs(TileTable) do
    -- rowIndex == 1
    -- row == {8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8}
    for columnIndex,symbol in ipairs(row) do
      -- columnIndex == 1
      -- number == 9
      local x,y = (columnIndex-1)*TileW, (rowIndex-1)*TileH
      love.graphics.draw(Tileset, Quads[symbol], x, y)
    end
  end
end

