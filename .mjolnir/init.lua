local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local appfinder = require "mjolnir.cmsj.appfinder"
local grid = require "mjolnir.bg.grid"

--default is 3x3, adjust to 5x3
grid.adjustwidth(2)

hotkey.bind({"alt", "shift"}, "1", function()
    application.launchorfocus("iTerm")
end)

hotkey.bind({"alt", "shift"}, "2", function()
    application.launchorfocus("MacVim")
end)

hotkey.bind({"alt", "shift"}, "3", function()
    application.launchorfocus("Google Chrome")
end)

--resize fns hjkl

hotkey.bind({"alt", "shift"}, "h", function()
  grid.resizewindow_thinner()
end)

hotkey.bind({"alt", "shift"}, "j", function()
  grid.resizewindow_taller()
end)

hotkey.bind({"alt", "shift"}, "k", function()
  grid.resizewindow_shorter()
end)

hotkey.bind({"alt", "shift"}, "l", function()
  grid.resizewindow_wider()
end)

--end resize functions

--preconfigured grids, left/right sides

hotkey.bind({"alt", "shift"}, ";", function()
  win = window.focusedwindow()
  grid.set(win, {x=0, y=0, w=2, h=3}, win:screen())
end)

hotkey.bind({"alt", "shift"}, "'", function()
  win = window.focusedwindow()
  grid.set(win, {x=3, y=0, w=2, h=3}, win:screen())
end)

--end preconfigured grids

--window movement

hotkey.bind({"cmd", "shift"}, "h", function()
  grid.pushwindow_left()
end)

hotkey.bind({"cmd", "shift"}, "j", function()
  grid.pushwindow_down()
end)

hotkey.bind({"cmd", "shift"}, "k", function()
  grid.pushwindow_up()
end)

hotkey.bind({"cmd", "shift"}, "l", function()
  grid.pushwindow_right()
end)

--end window movement
