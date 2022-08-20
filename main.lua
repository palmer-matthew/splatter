require "src/dependencies"

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle("Splatter - TBD")

    math.randomseed(os.time())

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true
    })

    fpsFont = love.graphics.newFont("fonts/pixel_bug.otf", 8)

    player = Player(VIRTUAL_WIDTH / 2 - 2.5,  VIRTUAL_HEIGHT / 2 - 2.5)
    
    objects = {}

    timer = 0

    love.keyboard.keysPressed = {}
end

function love.resize(w,h)
    push:resize(w,h)
end

function love.keypressed(key)

    love.keyboard.keysPressed[key] = true
    
    if key == "escape" then 
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key] and true or false
end

function love.update(dt)
    timer = timer + dt 

    if timer > 3 then
        table.insert(objects, Object())
        timer = 0
    end

    for k, object in pairs(objects) do 
        if object:collides(player) then
            object.dx = 0
        end 
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

    displayFPS()

    push:finish()
end


function displayFPS()
    -- simple FPS display across all states
    love.graphics.setFont(fpsFont)
    love.graphics.setColor(0, 255/255, 0, 255/255)
    love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
end