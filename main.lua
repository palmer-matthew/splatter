-- require external scritps for use in main
push = require "scripts/push"
Class = require "scripts/class"

-- require developed classes for use in main
require "class/Player"
require "class/Object"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    player = Player(VIRTUAL_WIDTH / 2 - 2.5,  VIRTUAL_HEIGHT / 2 - 2.5)
    
    objects = {}

    timer = 0
end

function love.resize(w,h)
    push:resize(w,h)
end

function love.keypressed(key)
    if key == "escape" then 
        love.event.quit()
    end
end


function love.update(dt)
    timer = timer + dt 

    if timer > 1 then
        table.insert(objects, Object())
        timer = 0
    end

    for k, object in pairs(objects) do 
        object:update(dt)
    end

    for k, object in pairs(objects) do
        if object.toBeDestroyed then
            table.remove(objects, k)
        end
    end
    
    player:update(dt)
end

function love.draw()
    push:start()

    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    for k, object in pairs(objects) do 
        object:render()
    end
    
    player:render()

    push:finish()
end


-- function displayFPS()
--     -- simple FPS display across all states
--     love.graphics.setFont(smallFont)
--     love.graphics.setColor(0, 255/255, 0, 255/255)
--     love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
-- end