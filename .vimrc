"设置vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized' "solarized theme
Plugin 'joshdick/onedark.vim' "onedark theme
Plugin 'dracula/vim' "dracula theme
Plugin 'L9'
Plugin 'scrooloose/nerdtree'  "文件浏览
Plugin 'Xuyuanp/nerdtree-git-plugin' "nerdtree的git插件
Plugin 'godlygeek/tabular' "自动对齐
Plugin 'Tagbar' "结构预览
Plugin 'ctrlpvim/ctrlp.vim' "全局搜索
Plugin 'itchyny/lightline.vim' "状态栏
Plugin 'tpope/vim-fugitive' "git栏
Plugin 'Shougo/vimproc.vim' "async
Plugin 'w0rp/ale' "异步语法检查
Plugin 'Yggdroot/indentLine' "垂直参考线
Plugin 'severin-lemaignan/vim-minimap' "预览图
Plugin 'airblade/vim-gitgutter' "vim git提示
Plugin 'kshenoy/vim-signature' "可视化书签

Plugin 'haskell.vim' "Haskell language
Plugin 'leafgarland/typescript-vim' "typescript高亮
Plugin 'pangloss/vim-javascript' "javascript高亮
Plugin 'mxw/vim-jsx' "react高亮
Plugin 'tpope/vim-rails' "rails.vim
Plugin 'luochen1990/rainbow' "彩虹括号
Plugin 'ternjs/tern_for_vim' "JS结构预览
Plugin 'eagletmt/ghcmod-vim' "ghc-mod
Plugin 'bitc/lushtags' "haskell结构预览
Plugin 'npm.vim' "npm commands

call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"vundle设置完毕

let mapleader=","
"设置leader键为,

set re=1

set confirm
" 在处理未保存或只读文件的时候，弹出确认

syntax on
" 语法高亮

autocmd InsertLeave * se nocul
autocmd InsertEnter * se cul
" 用浅色高亮当前行

set smartindent
" 智能对齐

set autoindent
" 自动对齐

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround
"  统一缩进为2


set number
" 显示行号

set history=50
" 历史纪录数

set hlsearch
set incsearch
" 搜索逐字符高亮

set gdefault
" 行内替换

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1
" 编码设置

syntax enable

if !has('gui_running')
  set t_Co=256
  if has('termguicolors')
    set termguicolors
  end
  colorscheme dracula
  let lightlineColor = 'Dracula'
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  set timeoutlen=1000 ttimeoutlen=0
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


set guifont=Monaco:h20
" 设置颜色主题

set langmenu=zn_CN.UTF-8
set helplang=cn
" 语言设置

set cmdheight=2
" 命令行（在状态行）的高度，默认为1,这里是2

set ruler
" 在编辑过程中，在右下角显示光标位置的状态行

set laststatus=2
" 总是显示状态行

set showcmd
" 在状态行显示目前所执行的命令，未完成的指令片段亦会显示出来

set scrolloff=3
" 光标移动到buffer的顶部和底部时保持3行距离

set showmatch
" 高亮显示对应的括号

set matchtime=5
" 对应括号高亮的时间（单位是十分之一秒）

set autowrite
" 在切换buffer时自动保存当前文件

set wildmenu
" 增强模式中的命令行自动完成操作

set linespace=2
" 字符间插入的像素行数目

set foldmethod=indent
set nofoldenable

" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=20
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="right"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
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

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" tabular
nnoremap <leader>t :Tab/
vnoremap <leader>t :Tab/

" Ale
let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['tslint', 'tsserver'],
\  'haskell': ['ghc-mod', 'hint'],
\  'cpp': ['clang', 'cpplint', 'g++']
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

" lightline
set laststatus=2 " Always display the status line
let g:lightline = {
  \ 'colorscheme': lightlineColor,
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'ale' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LightlineFugitive',
  \ },
  \ 'component': {
  \   'ale': '%{LinterStatus()}',
  \ },
  \ }
function! LightlineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    return fugitive#head()
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
map <Leader>q :w<CR>:!clang++ % -o %< && ./%< <CR>

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
