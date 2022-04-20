local anim8 = require "anim8"

function setupBird()
  bird = {}
  bird.x = nativeWidth/2
  bird.y = nativeHeight/2
  bird.spritesheet = love.graphics.newImage('img/bird.png')
  local grid = anim8.newGrid(16,16, bird.spritesheet:getWidth(),
                             bird.spritesheet:getHeight())
  bird.animation = anim8.newAnimation(grid('1-6',1), 0.1)
  bird.animation:pauseAtStart()
end

function updateBird(dt)
  bird.animation:update(dt)
end

function drawBird()
  bird.animation:draw(bird.spritesheet, bird.x, bird.y)
end
