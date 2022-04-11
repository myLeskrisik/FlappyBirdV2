height = 640
width = 360
flags =
{
  fullscreen = false,
  display = 0,
  vsync = 0,
}

-- Sets the window for the game up by changing the scale in order to make the
-- game scale properly
function setupWindow()
  local nativeHeight = 640
  local nativeWidth = 360

  love.window.setMode(height, width, flags)
  love.graphics.scale(height/nativeHeight, width/nativeWidth)
end
