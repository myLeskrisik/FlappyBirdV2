require "bird"

function love.keypressed(key)
  if (key == "space") then flapBird() end
  if (key == "f") then toggleFullscreen() end
end
