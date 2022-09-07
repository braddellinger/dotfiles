local statusline_style = "sharp_sectioned"
local tabline_style = "left_sharp_splits"
local theme = "nord"

require("_options")
require("_keymaps")
require("plugins")

require("themes/" .. theme)
require("statuslines/" .. statusline_style)
require("tablines/" .. tabline_style)
