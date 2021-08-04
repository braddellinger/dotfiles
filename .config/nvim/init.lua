require('_settings')
require('_keymaps')
require('plugins')

-- Statusline & tabline
local line = 'rounded'
require('/statuslines/' .. line)
require('/tablines/rounded')

