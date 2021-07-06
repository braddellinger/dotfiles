local beautiful = require('beautiful')
local helpers = require('helpers')
local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')


----------------------------------------
-- Icon commands and settings
----------------------------------------

local poweroff_command = function() awful.spawn.with_shell('poweroff') end
local reboot_command   = function() awful.spawn.with_shell('reboot') end
local exit_command     = function() awesome.quit() end

local icon_font = 'material bold 80'

local poweroff_icon = '\u{e8ac}'
local reboot_icon   = '\u{e5d5}'
local exit_icon     = '\u{e9ba}'

local button_bg   = colors.color0 .. 90
local button_size = dpi(200)


----------------------------------------
-- Buttons
----------------------------------------

local create_button = function(symbol, hover_color, text, command)
    local icon = wibox.widget {
        widget = wibox.widget.textbox(),
        forced_height = button_size,
        forced_width = button_size,
        valign = 'center',
        align = 'center',
        font = icon_font,
        text = symbol,
    }

    local button = wibox.widget {
        shape = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 20) end,
        widget = wibox.container.background,
        forced_height = button_size,
        forced_width = button_size,
        border_color = button_bg,
        border_width = dpi(10),
        bg = button_bg,
        icon,
    }

    button:buttons(
        gears.table.join(awful.button({ }, 1, function() command() end)
    ))

    button:connect_signal('mouse::enter', function()
        icon.markup = helpers.colorize_text(icon.text, hover_color)
        button.border_color = hover_color
    end)

    button:connect_signal('mouse::leave', function ()
        icon.markup = helpers.colorize_text(icon.text, colors.foreground)
        button.border_color = button_bg
    end)

    helpers.add_hover_cursor(button)

    return button
end

local poweroff = create_button(poweroff_icon, colors.color5, 'Poweroff', poweroff_command)
local reboot = create_button(reboot_icon, colors.color6, 'Rebool', reboot_command)
local exit = create_button(exit_icon, colors.color4, 'Exit', exit_command)


----------------------------------------
-- Exit screen
----------------------------------------

local exit_screen = wibox({
    bg = colors.background .. 70,
    fg = colors.foreground,
    visible = false,
    type = 'dock',
    ontop = true,
})

awful.placement.maximize(exit_screen)

local exit_screen_grabber
function hide_exit_screen()
    awful.keygrabber.stop(exit_screen_grabber)
    exit_screen.visible = false
end

local keybinds = { ['Escape'] = hide_exit_screen }
function show_exit_screen() 
    exit_screen_grabber = awful.keygrabber.run(function(_, key, event)
        if event == 'release' then return end
        if keybinds[key] then
            keybinds[key]()
        end
    end)
    exit_screen.visible = true
end

exit_screen:buttons(
    gears.table.join(
        awful.button({ }, 1, function() hide_exit_screen() end),
        awful.button({ }, 2, function() hide_exit_screen() end),
        awful.button({ }, 3, function() hide_exit_screen() end)
))

exit_screen:setup {
    nil,
    {
        nil,
        {
            layout = wibox.layout.fixed.horizontal,
            spacing = dpi(50),
            poweroff,
            reboot,
            exit,
        },
        expand = 'none',
        layout = wibox.layout.align.horizontal,
    },
    expand = 'none',
    layout = wibox.layout.align.vertical,
}
