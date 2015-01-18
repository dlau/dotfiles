local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local appfinder = require "mjolnir.cmsj.appfinder"
local grid = require "mjolnir.bg.grid"

--default is 3x3, adjust to 5x3
grid.adjustwidth(2)

hotkey.bind({"alt", "shift"}, "1", function()
    application.launchorfocus("MacVim")
end)

hotkey.bind({"alt", "shift"}, "2", function()
    application.launchorfocus("iTerm")
end)

hotkey.bind({"alt", "shift"}, "3", function()
    application.launchorfocus("Google Chrome")
end)

hotkey.bind({"alt", "shift"}, "h", function()
  grid.resizewindow_thinner()
end)

hotkey.bind({"alt", "shift"}, "j", function()
  grid.resizewindow_shorter()
end)

hotkey.bind({"alt", "shift"}, "k", function()
  grid.resizewindow_taller()
end)

hotkey.bind({"alt", "shift"}, "l", function()
  grid.resizewindow_wider()
end)

hotkey.bind({"alt", "shift"}, ";", function()
  win = window.focusedwindow()
  grid.set(win, {x=0, y=0, w=2, h=3}, win:screen())
end)

hotkey.bind({"alt", "shift"}, "'", function()
  win = window.focusedwindow()
  grid.set(win, {x=3, y=0, w=2, h=3}, win:screen())
end)
