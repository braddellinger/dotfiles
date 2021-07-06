local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local keys = require('keys')


----------------------------------------
-- Colors
----------------------------------------

-- Update appended number to adjust transparency of inactive tags
local inactive = { colors.color6 .. '00', colors.color3 .. '00', colors.color5 .. '00', colors.color4 .. '00', colors.color2 .. '00' }
local active = { colors.color6, colors.color3, colors.color5, colors.color4, colors.color2 }

local update_colors = function(item, tag, index)
    if tag.selected then
        item.bg = active[index]
    else
        item.bg = inactive[index]
    end
end


----------------------------------------
-- Add taglist to screens
----------------------------------------

awful.screen.connect_for_each_screen(function(s)
    s.taglist = awful.widget.taglist {
        filter = awful.widget.taglist.filter.all,
        buttons = keys.taglistbuttons,
        screen = s,
        layout = { layout = wibox.layout.flex.horizontal },
        widget_template = {
            create_callback = function(self, tag, index, _) update_colors(self, tag, index) end,
            update_callback = function(self, tag, index, _) update_colors(self, tag, index) end,
            widget = wibox.container.background,
        },
    }

    s.taglist_bar = awful.wibar({
        bg = '#00000000',
        position = 'top',
        height = dpi(20),
        visible = true,
        ontop = false,
        type = 'dock',
        screen = s,
    })

    s.taglist_bar:setup { widget = s.taglist }
end)
