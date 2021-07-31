----
--
-- retrove - a screen scaler for low resolution retro-style games
-- Copyright (C) liquidev, 2021
--
----
--
-- This is free and unencumbered software released into the public domain.
--
-- Anyone is free to copy, modify, publish, use, compile, sell, or
-- distribute this software, either in source code form or as a compiled
-- binary, for any purpose, commercial or non-commercial, and by any
-- means.
--
-- In jurisdictions that recognize copyright laws, the author or authors
-- of this software dedicate any and all copyright interest in the
-- software to the public domain. We make this dedication for the benefit
-- of the public at large and to the detriment of our heirs and
-- successors. We intend this dedication to be an overt act of
-- relinquishment in perpetuity of all present and future rights to this
-- software under copyright law.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
-- OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-- ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.
--
-- For more information, please refer to <https://unlicense.org>
--
----
--
-- USAGE:
--
--   local retrove = require "retrove"
--
--   -- Render a canvas to the current canvas and scale it to fit
--   -- the target canvas:
--   retrove(canvas)
--
--   -- To disable integer scaling, pass `true` as the second parameter to
--   -- the function.
--   retrove(canvas, true)
--
----

local graphics = require("love").graphics

local function windowSize()
  local canvas = graphics.getCanvas()
  if canvas ~= nil then
    return canvas:getDimensions()
  else
    return graphics.getDimensions()
  end
end

--- Renders the given canvas scaled to fit the screen.
---
--- @param canvas Canvas        The canvas to render.
--  @param fractional? boolean  Enables fractional scaling.
return function (canvas, fractional)
  local windowWidth, windowHeight = windowSize()
  local canvasWidth, canvasHeight = canvas:getDimensions()

  local scale = math.min(windowWidth / canvasWidth, windowHeight / canvasHeight)
  if not fractional then
    scale = math.floor(scale)
  end

  local min, mag = canvas:getFilter()
  canvas:setFilter("nearest", "nearest")
  graphics.draw(
    canvas,
    windowWidth / 2, windowHeight / 2,
    0,
    scale, scale,
    canvasWidth / 2, canvasHeight / 2
  )
  canvas:setFilter(min, mag)
end
