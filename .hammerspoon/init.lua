--default is 3x3, adjust to 5x3
--hs.grid.adjustwidth(2)

--resize fns hjkl
hs.window.animationDuration = 0

hs.hotkey.bind({"alt", "shift"}, "h", function()
  hs.grid.resizeWindowThinner()
end)

hs.hotkey.bind({"alt", "shift"}, "j", function()
  hs.grid.resizeWindowTaller()
end)

hs.hotkey.bind({"alt", "shift"}, "k", function()
  hs.grid.resizeWindowShorter()
end)

hs.hotkey.bind({"alt", "shift"}, "l", function()
  hs.grid.resizeWindowWider()
end)

--end resize functions

--preconfigured hs.grids, left/right sides

hs.hotkey.bind({"alt", "shift"}, ";", function()
  win = hs.window.focusedhs.window()
  hs.grid.set(win, {x=0, y=0, w=2, h=3}, win:screen())
end)

hs.hotkey.bind({"alt", "shift"}, "'", function()
  win = hs.window.focusedhs.window()
  hs.grid.set(win, {x=3, y=0, w=2, h=3}, win:screen())
end)

--end preconfigured hs.grids

--hs.window movement

hs.hotkey.bind({"cmd", "shift"}, "h", function()
  hs.grid.pushWindowLeft()
end)

hs.hotkey.bind({"cmd", "shift"}, "j", function()
  hs.grid.pushWindowDown()
end)

hs.hotkey.bind({"cmd", "shift"}, "k", function()
  hs.grid.pushWindowUp()
end)

hs.hotkey.bind({"cmd", "shift"}, "l", function()
  hs.grid.pushWindowRight()
end)

--end hs.window movement
