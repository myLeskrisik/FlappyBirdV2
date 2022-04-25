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
  end
end

function love.draw()
  setScale()
  -- Everything should go after this
  love.graphics.rectangle("fill", 0, 0, nativeWidth, nativeHeight)
  drawBird()

end
