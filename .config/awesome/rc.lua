local beautiful = require('beautiful')
local naughty = require('naughty')
local gears = require('gears')
local wibox = require('wibox')
local awful = require('awful')
local keys = require('keys')
require('awful.autofocus')


----------------------------------------
-- Error handling
----------------------------------------

if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = 'Oops, there were errors during startup!',
        text = awesome.startup_errors,
    })
end

do
    local in_error = false
    awesome.connect_signal('debug::error', function(err)
        if in_error then return end
        in_error = true

        naughty.notify({
            preset = naughty.config.presets.critical,
            title = 'Oops, an error happened!',
            text = tostring(err)
        })

        in_error = false
    end)
end


----------------------------------------
-- Global settings
----------------------------------------

user = {
    terminal = 'kitty',
    browser = 'brave',
    browser_incognito = 'brave -incognito',
    wallpaper = os.getenv('HOME') .. '/wallpapers/shore.jpg',
}

local xrdb = beautiful.xresources.get_current_theme()
colors = {
    background = xrdb.background,
    foreground = xrdb.foreground,
    color0     = xrdb.color0,
    color1     = xrdb.color1,
    color2     = xrdb.color2,
    color3     = xrdb.color3,
    color4     = xrdb.color4,
    color5     = xrdb.color5,
    color6     = xrdb.color6,
    color7     = xrdb.color7,
    color8     = xrdb.color8,
    color9     = xrdb.color9,
    color10    = xrdb.color10,
    color11    = xrdb.color11,
    color12    = xrdb.color12,
    color13    = xrdb.color13,
    color14    = xrdb.color14,
    color15    = xrdb.color15,
}

dpi = beautiful.xresources.apply_dpi


----------------------------------------
--  Theme and elements
----------------------------------------

beautiful.init(os.getenv('HOME') .. '/.config/awesome/theme.lua')
require('elements.tag_list')
require('elements.exit_screen')


----------------------------------------
-- Screens
----------------------------------------

awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.corner.nw,
    awful.layout.suit.corner.ne,
    awful.layout.suit.corner.sw,
    awful.layout.suit.corner.se,
}

-- Helper function to set wallpaper
local function set_wallpaper(s)
    gears.wallpaper.maximized(user.wallpaper, s, true)
end

-- Reset wallpaper when screen geometry changes
screen.connect_signal('property::geometry', set_wallpaper)

-- Set tags & wallpaper for each screen
awful.screen.connect_for_each_screen(function(s)
    awful.tag({ '1', '2', '3', '4', '5' }, s, awful.layout.layouts[2])
    set_wallpaper(s)
end)


----------------------------------------
-- Client rules
----------------------------------------

awful.rules.rules = {

    -- All clients
    {
        rule = { },
        properties = {
            placement = awful.placement.no_overlap + awful.placement.no_offscreen,
            border_color = beautiful.border_normal,
            border_width = beautiful.border_width,
            focus = awful.client.focus.filter,
            screen = awful.screen.preferred,
            buttons = clientbuttons,
            keys = keys.clientkeys,
            honor_workarea = true,
            honor_padding = true,
            raise = true,
        },
    },
}


----------------------------------------
-- Signals
----------------------------------------

-- Execute when a new client appears
client.connect_signal('manage', function(c)
    -- Set new clients as slave
    if not awesome.startup then awful.client.setslave(c) end

    -- Prevent clients from being unreachable after screen count changes
    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

-- Set border radius and color
client.connect_signal('manage', function(c) c.shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end end)
client.connect_signal('unfocus', function(c) c.border_color = beautiful.border_normal end)
client.connect_signal('focus', function(c) c.border_color = beautiful.border_focus end)
