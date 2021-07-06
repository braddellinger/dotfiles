
awful.screen.connect_for_each_screen(function(s)
    s.dock = awful.popup({
        placement = awful.placement.right,
        visible = true,
        bg = '#ffffff',
        ontop = true,
        type = 'dock',
        widget = dock,
    })
end)
