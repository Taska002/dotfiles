local util = require('util')

--indent
local indent = 2
util.opt('o', 'expandtab', true)
util.opt('o', 'shiftwidth', indent)
util.opt('o', 'tabstop', indent)

--clipboard
util.opt('o', 'clipboard', "unnamed")

--line number
util.opt('w', 'number', true)

--カーソル行をハイライト
util.opt('w', 'cursorline', true)

--file name
util.opt('o', 'title', true)

--検索文字列に大文字が含まれている場合は区別
util.opt('o', 'smartcase', true)
--大文字小文字区別なく検索
util.opt('o', 'ignorecase', true)
--検索語をハイライト
util.opt('o', 'hlsearch')

--jsonのダブルクウォートを有効にする
util.opt('o', 'conceallevel', 0)

--スワップファイルを作らない
vim.cmd 'set noswapfile'

--<Leader>キー
vim.g.mapleader = ' '
vim.notify("settings.lua が読み込まれました", vim.log.levels.INFO)
