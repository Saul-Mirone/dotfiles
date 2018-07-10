Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

function ConfigureGoyo()
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!
  let g:goyo_with = '50%'
  let g:goyo_height = '100%'
  let g:limelight_conceal_ctermfg = 240
  let g:limelight_conceal_guifg = '#585858'
endfunction
