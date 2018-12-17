set confirm

if !exists("g:syntax_on")
  syntax enable
endif

set smartindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround

set number
set hlsearch

set gdefault

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936,utf-16,big5,euc-jp,latin1

set cmdheight=2

set showcmd

set showmatch

set linespace=2

set foldmethod=indent
set nofoldenable

set showtabline=2  " Show tabline

set cursorline
set conceallevel=1
set concealcursor=nc
hi Conceal guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE

if has('gui_running')
  set guifont=Hack\ Nerd\ Font:h16
  set guioptions-=e  " Don't use GUI tabline
elseif !has('nvim')
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
  else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
endif
