height = (1440 - 30)
width = (2560 - 30)
nativeHeight = 180
nativeWidth = 320
flags = {}

-- Sets the window for the game up by changing the scale in order to make the
-- game scale properly
function setupWindow()
  love.graphics.setDefaultFilter("nearest", "nearest")
  flags.fullscreen = false
  flags.display = 0
  flags.vsync = 0
  love.window.setMode(width, height, flags)
  love.window.setFullscreen(false)
end

-- Scales the window to the desired height and width by scale everything
-- drawn with graphics
function setScale()
  love.graphics.scale(math.ceil(width/nativeWidth), math.ceil(height/nativeHeight))
end

function toggleFullscreen()
  local fullscreen = not love.window.getFullscreen()
  love.window.setFullscreen(fullscreen)
end
