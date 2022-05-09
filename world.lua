verticalPipeGap = 40
horizontalPipeGap = 40
pipeWidth = 28
pipeSpeed = 26
maxPipesOnScreen = math.ceil(nativeWidth / (horizontalPipeGap + pipeWidth))

function drawBackground()
  background = love.graphics.newImage("img/gasworks.png")
  love.graphics.draw(background, 0, 0)
end

function setupPipes()
  pipes = {}
  for i = 1, maxPipesOnScreen do
    createPipe(nativeWidth + ((i-1) * (horizontalPipeGap + pipeWidth)))
  end
end

function pipeUpdate(dt)
  for i in pairs(pipes) do pipes[i].x = pipes[i].x - (pipeSpeed * dt) end
  if pipes[1].x <= -pipeWidth then
    for i = 1, maxPipesOnScreen do pipes[i] = pipes[i+1] end
    createPipe(pipes[maxPipesOnScreen - 1].x + (horizontalPipeGap + pipeWidth))
  end
end

function createPipe(pipeStartingX)
  bottomPipeBound = (nativeHeight * 4) / 5
  topPipeBound = nativeHeight / 5 + verticalPipeGap
  local pipe = {}
  pipe.x = pipeStartingX
  pipe.scored = false
  -- Generates a Y value from bottomPipeBound to topPipeBound
  pipe.bottomPipeY = love.math.random(bottomPipeBound - topPipeBound) + topPipeBound
  pipe.sprite = love.graphics.newImage("img/pipe.png")

  table.insert(pipes, pipe)
end


function drawPipes()
  for i in pairs(pipes) do drawPipe(pipes[i]) end
end

function drawPipe(pipe)

  -- Draws the bottom pipe
  love.graphics.draw(pipe.sprite, pipe.x, pipe.bottomPipeY, 0, 1, 1)
  -- Draws the top pipe
  love.graphics.draw(pipe.sprite, pipe.x, pipe.bottomPipeY - verticalPipeGap, 0, 1, -1)
end
