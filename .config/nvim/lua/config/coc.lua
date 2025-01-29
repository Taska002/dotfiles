-- ref
-- https://github.com/smauel/dotfiles/blob/e46542c6d5b17ca6716153b21eda6553acd2ed4b/config/nvim.bk/lua/config/coc.lua
--
local g = vim.g
local fn = vim.fn

g.coc_global_extensions = {
  'coc-explorer',
  'coc-sumneko-lua',
  'coc-json',
  'coc-tsserver',
  'coc-docker',
  'coc-git',
  'coc-spell-checker',
  'coc-typos',
  'coc-highlight',
  'coc-pairs',
  'coc-eslint',
  'coc-prettier',
  'coc-snippets',
  'coc-html',
}

g.coc_explorer_global_presets = {
  floatingLeftside = {
    ["position"] = 'floating',
    ["floating-position"] = "left-center",
    ["floating-width"] = 90,
    ["open-action-strategy"] = 'sourceWindow',
  }
}
local function termcodes(str)

  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local function check_back_space()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  return (col == 0 or vim.api.nvim_get_current_line():sub(col, col):match "%s") and true
end
function CocSmartTab()
  print(fn["coc#pum#visible"]())
    if fn["coc#pum#visible"]() == 1 then
      return fn['coc#pum#next'](1)
  elseif fn['coc#expandableOrJumpable']() == 1 then
    return termcodes('<C-r>') .. [[=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])]] .. termcodes('<CR>')
  else
    local status, result = pcall(check_back_space)
    if status and result then
      return termcodes('<Tab>')
    else
      return termcodes('<Tab>')
    end
  end
end
function CocShowDocumentation()
  if fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.cmd('h ' .. fn.expand('<cword>'))
  elseif fn['coc#rpc#ready']() then
    fn.CocActionAsync('doHover')
  else
    vim.cmd('!' .. vim.o.keywordprg .. ' ' .. fn.expand('<cword>'))
  end
end
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")
