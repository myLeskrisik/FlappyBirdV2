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
  drawBackground()
  drawPipes()
  love.graphics.setColor(love.math.colorFromBytes(127, 212, 74))
  love.graphics.rectangle("fill", 0, 160, 320, 20)
  love.graphics.setColor(1, 1, 1)

  drawBird()
end
