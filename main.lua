-- main.lua
require 'mapFunctions'

function love.load()
loadmap('/maps/map1.lua')
end

function love.draw()
  drawMap()
end