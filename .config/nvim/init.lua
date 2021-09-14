local statusline_style = 'plain'
local tabline_style = 'plain'
local theme = 'nord'

require('_options')
require('_keymaps')
require('plugins')

require('themes/' .. theme)
require('statuslines/' .. statusline_style)
require('tablines/' .. tabline_style)
