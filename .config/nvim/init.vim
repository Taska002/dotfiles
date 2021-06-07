call plug#begin('~/.vim/plugged')
"syntax
Plug 'ntpeters/vim-better-whitespace'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'slim-template/vim-slim'
Plug 'jparise/vim-graphql'
Plug 'puremourning/vimspector'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yggdroot/indentline'
"nerdtree
Plug 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
"scheme
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
"ファイル検索
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'airblade/vim-gitgutter'
call plug#end()

" typescript誤判定対策
" https://github.com/ianks/vim-tsx/blob/master/ftdetect/typescript.vim
autocmd BufNewFile,BufRead *.tsx let b:tsx_ext_found = 1
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
noremap <C-j> <C-d><CR>
noremap <C-k> <C-u><CR>
map <C-p> :GitFiles<CR>
noremap <C-l> w <CR>
nnoremap <C-h>  b
nnoremap <C-l>  w
nmap <F1> <Esc>

"vimspector debug inspect
nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval


"フォーマット
command! -nargs=0 Format :call CocAction('format')
nmap <F5> :Format<CR>
"行数を表示
set number
"編集中のファイル名を表示
set title

" yankでクリップボードにコピー
set clipboard=unnamed

"インデント
set expandtab
set tabstop=2
set shiftwidth=2
let g:indentLine_conceallevel = 2
let g:indentLine_color_tty_light = 7
"オートインデント
set smartindent

"scheme
syntax on
colorscheme molokai
set t_Co=256
"カーソル行をハイライト
set cursorline
"カッコのハイライト消す
hi MatchParen term=standout ctermbg=Black ctermfg=LightGray guibg=#555555 guifg=LightGray

"tab
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


set updatetime=1000
augroup cocgroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  "型注釈
  " autocmd CursorHoldI * silent call CocAction('doHover')
augroup end

"検索文字列に大文字が含まれている場合は区別する
set smartcase
"大文字小文字区別なく検索
set ignorecase
"検索時に最後まで行ったら最初に戻る
set wrapscan
"検索語をハイライト
set hlsearch
"検索ハイライトを消すキーバインド
nmap <Esc><Esc> :nohl<CR>
"スワップファイルを作らない
set noswapfile
