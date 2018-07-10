Plug 'jpalardy/vim-slime'

function ConfigureSlime()
  let g:slime_target = "tmux"
  let g:slime_paste_file = tempname()
endfunction
