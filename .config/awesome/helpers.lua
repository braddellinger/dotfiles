helpers = { }


-- Change color of text
helpers.colorize_text = function(text, color)
    return '<span foreground="' .. color .. '">' .. text .. '</span>'
end

-- Change cursor on enter & leave
function helpers.add_hover_cursor(w)
    local original_cursor = 'left_ptr'
    local hover_cursor = 'hand1'

    w:connect_signal('mouse::enter', function()
        local w = _G.mouse.current_wibox
        if w then
            w.cursor = hover_cursor
        end
    end)

    w:connect_signal('mouse::leave', function()
        local w = _G.mouse.current_wibox
        if w then
            w.cursor = original_cursor
        end
    end)
end


return helpers
