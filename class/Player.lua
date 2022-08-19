Player = Class{}

PLAYER_MOVEMENT_SPEED = 100

function Player:init(x, y)
    self.x = x
    self.y = y

    self.width = 5
    self.height = 5

    self.dx = 100
    self.dy = 100
end

function Player:update(dt)

    if love.keyboard.isDown("up") then
        self.y = self.y - self.dy * dt
    end

    if love.keyboard.isDown("down") then 
        self.y = self.y +  self.dy  * dt
    end

    if love.keyboard.isDown("left") then
        self.x = self.x - self.dx  * dt
    end

    if love.keyboard.isDown("right") then 
        self.x = self.x +  self.dx * dt
    end

    if self.x < 0 or self.x > VIRTUAL_WIDTH - 5 then 
        self.x = self.x +  (self.x < 0 and (0 - self.x) or (VIRTUAL_WIDTH - 5 - self.x))
    end

    if self.y < 0 or self.y > VIRTUAL_HEIGHT - 5 then
        self.y = self.y +  (self.y < 0 and (0 - self.y) or (VIRTUAL_HEIGHT - 5 - self.y))
    end

end

function Player:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end