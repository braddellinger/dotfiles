require('_options')
require('_keymaps')
require('plugins')

-- Statusline
-- Options: rounded_simple, rounded_sectioned, sharp_sectioned
local statusline_style = 'sharp_sectioned'
require('/statuslines/' .. statusline_style)

-- Tabline
-- Options: rounded_simple, rounded_expanded
local tabline_style = 'rounded_expanded'
require('/tablines/' .. tabline_style)

