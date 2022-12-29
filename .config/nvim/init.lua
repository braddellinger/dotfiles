local statusline_style = "sharp_sectioned"
local tabline_style = "left_sharp_splits"

require("_options")
require("_keymaps")
require("plugins")

require("statuslines/" .. statusline_style)
require("tablines/" .. tabline_style)
