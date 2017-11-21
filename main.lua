map = {}
mapX = 29
mapY = 29
windowWidth = 1980
windowHeight = 1080

tileSize = 100

grassTile = nil

-- Note for next try, make it a table so I can add things lick pos and stats
function createMap()
  noise = 0
  
  for i=0, mapY do
    map[i] = {}
    for k=0, mapX do
      math.randomseed(os.time())
      if love.math.noise(i + math.random(),k + math.random()) < 0.9 then
        map[i][k] = 0
      else
        map[i][k] = 1
      end
    end
  end
end

function printMap()
  for i=0, mapY do
    for k=0, mapX do
      if map[i][k] == 0 then
        love.graphics.draw(grassTile, k*(windowWidth/(mapX+1)),i*(windowHeight/(mapY+1)), 0,(windowWidth/((mapX+1)*tileSize)),(windowHeight/((mapY+1)*tileSize)))
      elseif map[i][k] == 1 then
        love.graphics.draw(stoneTile, k*(windowWidth/(mapX+1)),i*(windowHeight/(mapY+1)), 0,(windowWidth/((mapX+1)*tileSize)),(windowHeight/((mapY+1)*tileSize)))
      end
    end
  end
end

function love.load()
  -- Inits
  love.window.setTitle("Map Generator")
  love.window.setMode(windowWidth,windowHeight)
  createMap()
  
  --graphics
  grassTile = love.graphics.newImage("pictures/grass.png")
  stoneTile = love.graphics.newImage("pictures/stone.png")
end

function love.draw()  
  printMap()
  --DEBUG TEXT
  love.graphics.print(map[0], 0, 0)
end