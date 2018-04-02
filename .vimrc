set rtp+=/usr/local/opt/fzf
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
"Plug 'Saul-Mirone/dracula-vim' "dracula theme
Plug 'dracula/vim'
Plug 'vim-scripts/L9'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'kshenoy/vim-signature'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-obsession'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'vim-scripts/Tagbar', { 'on': 'TagbarToggle' }
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'severin-lemaignan/vim-minimap', { 'on': ['Minimap', 'MinimapToggle'] }
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
Plug 'jpalardy/vim-slime', { 'on': ['SlimeRegionSend', 'SlimeParagraphSend'] }

Plug 'vim-scripts/haskell.vim', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'bitc/lushtags', { 'for': 'haskell' }
Plug 'Shougo/vimproc.vim', { 'do' : 'make', 'for': 'haskell' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'vim-scripts/npm.vim', { 'for': 'javascript' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

call plug#end()

let mapleader=","

set re=1

set confirm

if !exists("g:syntax_on")
  syntax enable
endif

autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul

set smartindent
set autoindent

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround

set number
set history=50
set hlsearch
set incsearch
set gdefault

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

if !has('gui_running')
  set t_Co=256
  let g:dracula_italic=0
  if has('termguicolors') && !exists('$TMUX')
    set termguicolors
  end
  colorscheme Dracula
  let lightlineColor = 'Dracula'

  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif

  set timeoutlen=1000 ttimeoutlen=0
  highlight Normal ctermbg=NONE
else
  if strftime('%H') >= 21 || strftime('%H') <= 9
    set background=dark
  else
    set background=light
  endif
  colorscheme solarized
  call togglebg#map("<F2>")
  let lightlineColor = 'solarized'
endif


set guifont=monofur\ for\ Powerline:h20
set langmenu=zn_CN.UTF-8
set helplang=cn

set cmdheight=2

set ruler

set laststatus=2

set showcmd

set scrolloff=3

set showmatch

set matchtime=5

set autowrite

set wildmenu

set linespace=2

set foldmethod=indent
set nofoldenable

" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=20
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="right"
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<CR>

" Tagbar
let g:tagbar_width=20
let g:tagbar_autofocus=1
let g:tagbar_left = 1
nmap <F6> :TagbarToggle<CR>
let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',
  \ 'ctagsargs' : '-f-',
  \ 'kinds': [
    \ 'e:enums:0:1',
    \ 'f:function:0:1',
    \ 't:typealias:0:1',
    \ 'M:Module:0:1',
    \ 'I:import:0:1',
    \ 'i:interface:0:1',
    \ 'C:class:0:1',
    \ 'm:method:0:1',
    \ 'p:property:0:1',
    \ 'v:variable:0:1',
    \ 'c:const:0:1',
  \ ],
  \ 'sort' : 0
\ } 

" tabular
nnoremap <leader>t :Tab/
vnoremap <leader>t :Tab/

" Ale
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['tslint', 'tsserver'],
\  'haskell': ['stack-ghc-mod', 'hlint'],
\  'cpp': ['clang', 'cpplint']
\}
let g:ale_echo_cursor = 1
let g:ale_open_list = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_echo_msg_format = '[%linter%] %s'
nnoremap <leader>e :ALEToggle<cr>
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
if !has('gui_running')
  highlight ALEError cterm=underline
  highlight ALEWarning cterm=underline
endif

" lightline
set laststatus=2 " Always display the status line
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
let g:lightline = {
  \ 'colorscheme': lightlineColor,
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'ale', 'session' ] ]
  \ },
  \ 'component_visible_condition': {
  \   'ale': 'AleVisible()',
  \   'session': 'SessionVisible()',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LightlineFugitive',
  \   'readonly': 'LightlineReadonly',
  \ },
  \ 'component': {
  \   'ale': '%{LinterStatus()}',
  \   'lineinfo': ' %3l:%-2v',
  \   'session': '%{ObsessionStatus()}'
  \ },
  \ 'separator': {
  \    'left': '',
  \    'right': ''
  \ },
  \ 'subseparator': {
  \    'left': '',
  \    'right': ''
  \ }
  \ }

function! AleVisible()
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total != 0
endfunction

function! SessionVisible()
  return ObsessionStatus() != ''
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf(
    \   '%dE  %dW',
    \   all_errors,
    \   all_non_errors
    \)
endfunction

" minimap
let g:minimap_highlight='WarningMsg'

" json
map <Leader>json :%!python -m json.tool<CR>gg=G

" Compaile and run c program
map <Leader>q :w<CR>:!clang -stdlib=libc++ -std=c++1z % -o %< && ./%< <CR>

" gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" JavaScript hightlight
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" Haskell ghc-mode
map <leader>ghcw :GhcModTypeInsert<CR>
map <leader>ghcs :GhcModSplitFunCase<CR>
map <leader>ghcq :GhcModType<CR>
map <leader>ghce :GhcModTypeClear<CR>

"open rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

"Goyo
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:goyo_with = '50%'
let g:goyo_height = '100%'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#585858'
nmap <F4> :Goyo<CR>

"vim-slime
let g:slime_target = "tmux"
let g:slime_paste_file = tempname()

"ocaml
let ocaml_revised = 1
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## e0a4c6af0df1be738d65ab08d9b21e27 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/Users/mirone/.opam/4.02.3+buckle-1/share/vim/syntax/ocp-indent.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
"
