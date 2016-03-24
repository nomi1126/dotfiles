set nocompatible

if has('vim_starting')
  if &compatible
    set nocompatible
  endif "
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \   'mac' : 'make -f make_mac.mak'
    \ }}
if has('lua')
    NeoBundle 'Shougo/neocomplete.vim', {
        \ 'depends' : 'Shougo/vimproc',
        \ 'autoload' : { 'insert' : 1,}
        \ }
endif
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kana/vim-submode'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'sophacles/vim-processing'
NeoBundle 'tpope/vim-surround'
NeoBundle 'hail2u/vim-css3-syntax'
" If use this, PrevimOpen command can not be used.
" NeoBundle 'othree/html5.vim'
NeoBundle 'marijnh/tern_for_vim', {
    \ 'build': {
    \   'others' : 'npm install'
    \ }}
NeoBundle 'LeafCage/yankround.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundleLazy 'junegunn/vim-easy-align', {
  \ 'autoload': {
  \   'commands' : ['EasyAlign'],
  \   'mappings' : ['<Plug>(EasyAlign)'],
  \ }}
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-fugitive'

call neobundle#end()

filetype plugin indent on
NeoBundleCheck

" --------------------------------
"  " vimfiler
"  " --------------------------------
" デフォルトでIDE風のFilerを開く
autocmd VimEnter * VimFiler -split -simple -winwidth=30 -no-quit
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default=0
let g:netrw_liststyle=3

" previmで.mdファイルをブラウザーで開けるようにする
autocmd BufNewFile,BufRead *.md set filetype=markdown

" --------------------------------
"  " vim-processing
"  " --------------------------------
augroup Processing
   autocmd!
   autocmd BufNewFile *.pde NeoBundleSource vim-processing
   autocmd BufRead    *.pde NeoBundleSource vim-processing
augroup END

" --------------------------------
"  " neocomplete.vim
"  " --------------------------------
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'

" --------------------------------
"  " Unite.vim
"  " --------------------------------
" insert modeで開始
let g:unite_enable_start_insert = 1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:.  -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" --------------------------------
"  " yankround.vim
"  " --------------------------------
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>

" --------------------------------
"  " vim-easy-align
"  " --------------------------------
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

sy on

" set tags=/usr/local/bin/ctags
set tags=tags;/

set nu

set guifont=Ricty-Regular:h9
set backupdir=$HOME/vimbackup
set clipboard=unnamed
set directory=$HOME/vimbackup
set hidden
set number
set showmatch
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
set t_Co=256
set modifiable
set write
" for tab
set expandtab
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
set softtabstop=0
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" for input
set backspace=indent,eol,start
set showmatch
set matchtime=3
" for command completion
set wildmenu
set wildmode=list,longest
set completeopt=menuone
"for search
set incsearch
" 検索結果をハイライト表示する
set hlsearch
set ignorecase
set smartcase
" ヘルプの日本語優先
set helplang=ja,en

" ステータスラインの表示設定
if has('statusline')
  set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]%{fugitive#statusline()}
  set laststatus=2
endif

set formatoptions+=mM
set virtualedit=block
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title

" キーでの移動、スペースキーでページ移動
set whichwrap=b,s,[,],<,>
nnoremap <SPACE>   <PageDown>
nnoremap <S-SPACE> <PageUp>

" window関連
nnoremap s <Nop>
" 上に移動
nnoremap sk <C-w>k
" 右に移動
nnoremap sl <C-w>l
" 下に移動
nnoremap sj <C-w>j
" 左に移動
nnoremap sh <C-w>h
" 次に移動
nnoremap sw <C-w>w
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sJ <C-w>J
nnoremap sH <C-w>H
nnoremap sr <C-w>r
nnoremap s= <C-w>=
" 縦横最大化
nnoremap so <C-w>_<C-w>|
" 大きさを揃える
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
" 新規タブ
nnoremap st :<C-u>tabnew<CR>
" 次のタブに切り替え
nnoremap sn gt
" 前のタブに切り替え
nnoremap sp gT
" 水平分割
nnoremap ss :<C-u>sp<CR>
" 垂直分割
nnoremap sv :<C-u>vs<CR>
" ウィンドウを閉じる
nnoremap sq :<C-u>q<CR>
" バッファを閉じる
nnoremap sQ :<C-u>bd<CR>

" ウィンドウサイズ変更
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" yunkした後にdやxで文字を消してもyunkの内容をペーストする
noremap PP "0p

" ハイライトの解除
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
" 「/」「?」「*」「#」が押されたらハイライトをON にしてから「/」「?」「*」「#」
nnoremap / :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" 複数行を選択して連続してインデントできるようにする
vnoremap > >gv
vnoremap < <gv

" 定義元へジャンプ
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

" Zen-Coding の実行キーを<C-e>に変更
let g:user_zen_expandabbr_key = '<c-e>'
" カーソル設定
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
" カーソル行強調
set cursorline
highlight CursorLine cterm=none ctermbg=darkgray

" ファイルのディレクトリを自動的にカレントディレクトリに変更
au BufEnter * execute ":lcd " . expand("%:p:h")

" Processing
au BufnewFIle,BufRead *.pde setf processing

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" auto reload .vimrc
augroup source-vimrc
    autocmd!
    autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
    autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END
