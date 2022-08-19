Object = Class{}

OBJECT_MOVEMENT_SPEED = 60

function Object:init()
    self.x = -32
    self.y = math.random(10, VIRTUAL_HEIGHT - 10)

    self.width = 10
    self.height = 10

    self.toBeDestroyed = false
end

function Object:update(dt)
    self.x = self.x + OBJECT_MOVEMENT_SPEED * dt

    if self.x > VIRTUAL_WIDTH then
        self.toBeDestroyed = true
    end
end

function Object:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end