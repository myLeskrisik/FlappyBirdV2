local anim8 = require "anim8"

-- Determines how fast the bird falls
gravity = 80
-- The constant which dictates how far the bird flys when space is pressed
liftConst = 55
-- The duration of the flap animation
flapDuration = 0.07

-- Sets up the bird table so it is ready to be used after this method is called
-- and initializes it's sprite/animation
function setupBird()
  bird = {}
  bird.width = 16
  bird.height = 16
  bird.x = nativeWidth/2 - (bird.width / 2)
  bird.y = nativeHeight/2
  bird.animDur = 0
  bird.velocity = 0
  bird.spritesheet = love.graphics.newImage('img/bird.png')
  local grid = anim8.newGrid(16,16, bird.spritesheet:getWidth(),
                             bird.spritesheet:getHeight())
  bird.animation = anim8.newAnimation(grid('1-6',1), flapDuration, "pauseAtStart")
  bird.animation:pauseAtStart()
end

-- Updates the bird's position on the screen and also updates the bird's
-- animation
function updateBird(dt)
  delta = dt
  bird.animation:update(dt)
  bird.velocity = bird.velocity - gravity * delta
  bird.y = bird.y - bird.velocity * delta
  if bird.y < 0 then bird.y = 0 end
  if (bird.y + bird.height) > nativeHeight then
    bird.y = (nativeHeight - bird.height)
  end

end

-- Draws the bird on the screen
function drawBird()
  bird.animation:draw(bird.spritesheet, bird.x, bird.y)
end

-- Makes the bird "flap"
function flapBird()
  curFlapDuration = 0
  bird.velocity = liftConst
  bird.animation:resume()
end
