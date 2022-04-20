require "screen"
require "bird"

function love.load(arg)
  setupWindow()
  setupBird()
end

function love.update(dt)
  updateBird(dt)
end

function love.draw()
  love.graphics.print("yaaa", 50, 50)
  setScale()
  love.graphics.print("yaaa", 50, 50)
  
  drawBird()
end
