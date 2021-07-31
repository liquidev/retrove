# retrove

A super-simple low resolution canvas scaling library for LÖVE.

## Usage

Before retrove can be of any use, it's best to make the window resizable in
`love.conf`:

**File:** conf.lua
```lua
function love.conf(t)
  t.window.resizable = true
end
```

The library interface consists of a single function that renders the pixel
canvas to the currently active canvas. It's worth noting that retrove supports
rendering the scaled pixel canvas to an off-screen canvas, to allow for
post-processing effects.

**File:** main.lua
```lua
local retrove = require "retrove"

local canvas

function love.load()
  canvas = love.graphics.newCanvas(64, 64)
end

function love.draw()
  love.graphics.setCanvas(canvas)

  -- draw stuff here

  love.graphics.setCanvas()
  retrove(canvas)
end
```
By default, retrove will render with integer scaling. To instead use fractional
scaling, pass an extra `true` parameter to the `retrove` function:
```lua
  retrove(canvas, true)
```

## License

This library is freely available under the public domain.

