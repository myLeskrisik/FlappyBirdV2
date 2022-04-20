require "screen"
require "bird"
require "control"
gameState = "dead"

function love.load(arg)
  gameState = "alive"

  setupWindow()
  setupBird()
end

function love.update(dt)
  if gameState == "alive" then
    updateBird(dt)
  end
end

function love.draw()
  setScale()
  drawBird()

end
