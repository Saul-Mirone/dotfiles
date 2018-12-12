so <sfile>:p:h/git.vim
so <sfile>:p:h/nerdtree.vim
so <sfile>:p:h/lightline.vim
so <sfile>:p:h/ale.vim
so <sfile>:p:h/fzf.vim
so <sfile>:p:h/ultisnips.vim
so <sfile>:p:h/goyo.vim
so <sfile>:p:h/slime.vim

Plug 'tpope/vim-sensible'
"Plug 'Yggdroot/indentLine'
Plug 'thaerkh/vim-indentguides'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'ryanoasis/vim-devicons'

function ConfigureComponents()
  call ConfigureGit()
  call ConfigureNERDTree()
  call ConfigureLightLine()
  call ConfigureALE()
  call ConfigureFZF()
  call ConfigureUltiSnips()
  call ConfigureGoyo()
  call ConfigureSlime()
endfunction
