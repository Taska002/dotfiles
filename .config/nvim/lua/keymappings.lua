local util = require('util')

vim.g.mapleader = ' '

util.map('n', '<Esc><Esc>', ':nohl<Esc>')
util.map('n', '<C-j>', '<C-d><CR>')
util.map('v', '<C-j>', '<C-d><CR>')
util.map('v', '<C-k>', '<C-u><CR>')
util.map('v', '<C-k>', '<C-u><CR>')
util.map('n', '<C-l>', 'w')
util.map('n', '<C-h>', 'b')

util.map('n', '<Leader>1', '<Plug>(coc-codeaction)')
util.map('n', '<Leader>2', '<Plug>(coc-codeaction-cursor)')
util.map('n', '<Leader>3', '<Plug>(coc-codeaction-line)')
util.map('n', '<Leader>4', '<Plug>(coc-codeaction-selected)')
util.map('v', '<Leader>4', '<Plug>(coc-codeaction-selected)')
util.map('n', '<F1>', '<Plug>(coc-definition)')
util.map('n', 'gd', '<Plug>(coc-type-definition)')
util.map('n', 'gy', '<Plug>(coc-implementation)')
util.map('n', 'gi', '<Plug>(coc-reference)')

util.map('n', '<F3>', '<Plug>(coc-rename)')
util.map('n', '<F5>', ':call CocAction("format")<CR>', { silent = true })
util.map('n', '<F6>', ':CocCommand eslint.executeAutofix<CR>', { silent = true })
util.map('n', '<C-e>', ':CocCommand explorer --preset floatingLeftside<CR>')

util.map('n', '<C-f>', 'CocFzfList grep<CR>')
util.map('n', 'K', ':call v:lua.CocShowDocumentation()<CR>', { noremap = true, silent = true })
util.map('i', '<Tab>', 'v.lua.CocSmartTab()', { expr = true, noremap = true, silent = true })
--util.map('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=cic#on_enter()<CR>"', { expr = true, noremap = true, silent = true })
util.map('i', '<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : <C-h>', { expr = true, noremap = true, silent = true })
util.map('i', '<c-space>', 'coc#fresh()', { expr = true, noremap = true, silent = true })

util.map('n', 'f', ':HopWord<CR>')

--git copilot
vim.g.copilot_no_tab_map = true
util.map('i', '<C-Space><C-Space>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
util.map('i', '<C-k>', '<Plug>(copilot-next)', { noremap = false })
util.map('i', '<C-j>', '<Plug>(copilot-previous', { noremap = false })


