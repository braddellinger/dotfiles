require('_settings')
require('_keymaps')
require('plugins')

-- Statusline
-- Options: rounded
local statusline_style = 'rounded'
require('/statuslines/' .. statusline_style)

-- Tabline
-- Options: rounded
local tabline_style = 'rounded'
require('/tablines/' .. tabline_style)

