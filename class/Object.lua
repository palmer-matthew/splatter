Object = Class{}

function Object:init()
    self.x = -32
    self.y = math.random(10, VIRTUAL_HEIGHT - 10)

    self.width = 10
    self.height = 10

    self.toBeDestroyed = false
    self.dx = 60
    self.dy = 0
end

function Object:update(dt)

    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt

    if self.x > VIRTUAL_WIDTH then
        self.toBeDestroyed = true
    end
end

function Object:collides(player)
    if self.x + self.width >= player.x and self.x <= player.x + player.width then 
        if self.y + self.height >= player.y and self.y <= player.y + player.height then
            return true
        end
    end
    return false
end

function Object:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end