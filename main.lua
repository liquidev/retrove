-- NOTE: This is the test file for retrove. You're looking for retrove.lua
-- if you want to just use the library.

local graphics = love.graphics

local retrove = require "retrove"

---

local canvas

function love.load()
  canvas = love.graphics.newCanvas(64, 64)
end

function love.draw()
  love.graphics.setCanvas(canvas)

  local w, h = canvas:getDimensions()
  local t = love.timer.getTime() * math.pi
  love.graphics.clear(0, 0, 1)
  love.graphics.setLineStyle("rough")
  love.graphics.arc("line", "open", w/2, h/2, 16, t, t + math.pi, 20)

  love.graphics.setCanvas()
  retrove(canvas)
end
