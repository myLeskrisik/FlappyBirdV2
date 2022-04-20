height = 768
width = 1366
nativeHeight = 180
nativeWidth = 320
flags =
{
  fullscreen = true,
  display = 0,
  vsync = 0,
}

-- Sets the window for the game up by changing the scale in order to make the
-- game scale properly
function setupWindow()
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.window.setMode(width, height, flags)
end

function setScale()
  love.graphics.scale(width/nativeWidth, height/nativeHeight)
end
