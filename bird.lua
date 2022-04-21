local anim8 = require "anim8"

-- Determines how fast the bird falls
gravity = 75
-- The constant which dictates how far the bird flys when space is pressed
liftConst = 65
-- The duration of the flap animation
flapDuration = 0.05

-- Sets up the bird table so it is ready to be used after this method is called
-- and initializes it's sprite/animation
function setupBird()
  bird = {}
  bird.x = nativeWidth/2
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


  if frame == 6 then bird.animation:pauseAtStart() end
  bird.velocity = bird.velocity - gravity * delta
  bird.y = bird.y - bird.velocity * delta
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
