local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local gfs = require("gears.filesystem")
local beautiful = require('beautiful')

local themes_path = gfs.get_themes_dir()
local dpi = xresources.apply_dpi
local theme = { }


----------------------------------------
-- Basic settings
----------------------------------------

theme.font = "sans 8"

theme.bg_systray  = colors.background
theme.bg_minimize = colors.color2
theme.bg_normal   = colors.color0
theme.bg_urgent   = colors.color2
theme.bg_focus    = colors.color2

theme.fg_minimize = colors.color0
theme.fg_normal   = colors.color0
theme.fg_urgent   = colors.color0
theme.fg_focus    = colors.color0

theme.border_color_normal = colors.background
theme.border_color_marked = colors.background
theme.border_color_active = colors.color5
theme.border_width        = dpi(0)
theme.useless_gap         = dpi(20)


return theme

