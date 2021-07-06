local awful = require('awful')
local gears = require('gears')

local keys = { }


----------------------------------------
-- Helper functions
----------------------------------------
function update_volume(step)
    local cmd
    if step == 0 then
        cmd = 'pactl set-sink-mute @DEFAULT_SINK@ toggle'
    else
        sign = step > 0 and '+' or ''
        cmd = 'pactl set-sink-volume @DEFAULT_SINK@ ' .. sign .. tostring(step) .. '%'
    end
    awful.spawn.with_shell(cmd)
end


----------------------------------------
-- Global settings
----------------------------------------

controlkey = 'Control'
shiftkey = 'Shift'
superkey = 'Mod4'
altkey = 'Mod1'


----------------------------------------
-- Global key binds
----------------------------------------

keys.globalkeys = gears.table.join(

    -- Applications
    awful.key({ superkey }, 'space', function() awful.spawn.with_shell('rofi -show drun') end, { description = 'open rofi', group = 'launcher' }),
    awful.key({ superkey }, 'Return', function() awful.spawn(user.terminal) end, { description = 'open terminal', group = 'launcher' }),
    awful.key({ superkey }, 'b', function() awful.spawn(user.browser) end, { description = 'open browser', group = 'launcher' }),
    awful.key({ superkey, shiftkey }, 'b', function() awful.spawn(user.browser_incognito) end, { description = 'open incognito browser', group = 'launcher' }),

    -- Awesome
    awful.key({ superkey }, 'Escape', function() show_exit_screen() end, { description = 'show exit screen', group = 'awesome' }),
    awful.key({ superkey, shiftkey }, 'r', awesome.restart, { description = 'reload awesome', group = 'awesome' }),
    awful.key({ superkey, shiftkey }, 'q', awesome.quit, { description = 'quit awesome', group = 'awesome' }),

    -- Brightness
    awful.key({ }, 'XF86MonBrightnessDown', function() awful.spawn.with_shell('light -U 5') end, { description = 'decrease brightness', group = 'brightness' }),
    awful.key({ }, 'XF86MonBrightnessUp', function() awful.spawn.with_shell('light -A 5') end, { description = 'increase brightness', group = 'brightness' }),

    -- Volume
    awful.key({ }, 'XF86AudioMute', function() update_volume(0) end, { description = '(un)mute volume', group = 'volume' }),
    awful.key({ }, 'XF86AudioLowerVolume', function() update_volume(-5) end, { description = 'lower volume', group = 'volume' }),
    awful.key({ }, 'XF86AudioRaiseVolume', function() update_volume(5) end, { description = 'raise volume', group = 'volume' }),

    -- Taglist
    -- Primarily used in combindation with libinput-gestures. Reference ~/.config/libinput-gestures.conf
    awful.key({ superkey, altkey }, 'n', awful.tag.viewnext, { description = 'go to next tag', group = 'tag' }),
    awful.key({ superkey, altkey }, 'p', awful.tag.viewprev, { description = 'go to previous tag', group = 'tag' })
)


----------------------------------------
-- Client key binds
----------------------------------------

keys.clientkeys = gears.table.join(
    awful.key({ superkey }, 'f', function(c)
        c.fullscreen = not c.fullscreen
        if c.fullscreen then 
            c.shape = function(cr, w, h) gears.shape.rectangle(cr, w, h) end
        else
            c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end
        end
        c:raise()
    end,
    { description = 'toggle fullscreen', group = 'client' }),

    awful.key({ superkey, controlkey }, 'space',  awful.client.floating.toggle, { description = 'toggle floating', group = 'client' }),
    awful.key({ superkey }, 'x', function(c) c:kill() end, { description = 'close', group = 'client' })
)


----------------------------------------
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
----------------------------------------

for i = 1, 5 do
    keys.globalkeys = gears.table.join(keys.globalkeys,

        -- View tag only
        awful.key({ superkey }, '#' .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = 'view tag #'..i, group = 'tag' }),

        -- Toggle tag display
        awful.key({ superkey, controlkey }, '#' .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                    if tag then
                        awful.tag.viewtoggle(tag)
                    end
            end,
            { description = 'toggle tag #' .. i, group = 'tag' }),

        -- Move client to tag
        awful.key({ superkey, shiftkey }, '#' .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                        if tag then
                            client.focus:move_to_tag(tag)
                        end
                end
            end,
            { description = 'move focused client to tag #'..i, group = 'tag' }),

        -- Toggle tag on focused client
        awful.key({ superkey, controlkey, shiftkey }, '#' .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = 'toggle focused client on tag #' .. i, group = 'tag' })
    )
end


----------------------------------------
-- Client button binds
----------------------------------------

keys.clientbuttons = gears.table.join(
    awful.button({ superkey }, 3, function(c) c:emit_signal('request::activate', 'mouse_click', { raise = true }) awful.mouse.client.resize(c) end),
    awful.button({ superkey }, 1, function(c) c:emit_signal('request::activate', 'mouse_click', { raise = true }) awful.mouse.client.move(c) end),
    awful.button({ }, 1, function(c) c:emit_signal('request::activate', 'mouse_click', { raise = true }) end)
)


----------------------------------------
-- Taglist button binds
----------------------------------------

keys.taglistbuttons = gears.table.join(
    awful.button({ }, 1, function(t) awful.screen.focused().tags[t.index]:view_only() end),
    awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end)
)


root.keys(keys.globalkeys)


return keys
