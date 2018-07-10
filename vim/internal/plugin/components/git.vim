Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

function ConfigureGit()
  let g:gitgutter_realtime = 0
  let g:gitgutter_eager = 0
endfunction
