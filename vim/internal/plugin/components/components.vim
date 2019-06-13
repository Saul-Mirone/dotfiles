so <sfile>:p:h/git.vim
so <sfile>:p:h/defx.vim
"so <sfile>:p:h/nerdtree.vim
so <sfile>:p:h/lightline.vim
so <sfile>:p:h/fzf.vim
"so <sfile>:p:h/ultisnips.vim
so <sfile>:p:h/goyo.vim
so <sfile>:p:h/slime.vim
so <sfile>:p:h/indent.vim
so <sfile>:p:h/vista.vim
so <sfile>:p:h/coc.vim

Plug 'tpope/vim-sensible'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'mbbill/undotree'
Plug 'godlygeek/tabular'
Plug 'ryanoasis/vim-devicons'

function ConfigureComponents()
  call ConfigureGit()
  call ConfigureDefx()
  "call ConfigureNERDTree()
  call ConfigureLightLine()
  call ConfigureFZF()
  "call ConfigureUltiSnips()
  call ConfigureGoyo()
  call ConfigureSlime()
  call ConfigureIndent()
  call ConfigureVista()
  call ConfigureCOC()
endfunction
