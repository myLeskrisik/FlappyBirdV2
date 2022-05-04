require "screen"
require "bird"
require "control"
require "world"
gameState = "dead"

function love.load(arg)
  gameState = "alive"
  setupWindow()
  setupBird()
  setupPipes()
end

function love.update(dt)
  if gameState == "alive" then
    updateBird(dt)
    pipeUpdate(dt)
  end
end

function love.draw()
  setScale()
  -- Everything should go after this
  love.graphics.setColor(love.math.colorFromBytes(118, 178, 240))
  love.graphics.rectangle("fill", 0, 0, nativeWidth, nativeHeight)
  love.graphics.setColor(1, 1, 1)
  drawPipes()
  drawBird()
end
