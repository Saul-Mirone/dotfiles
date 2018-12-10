if has('gui_running')
  Plug 'altercation/vim-colors-solarized'
else
  Plug 'junegunn/seoul256.vim'
  "Plug 'dracula/vim', { 'as': 'dracula' }
endif

function! ConfigureTheme()
  if !has('gui_running')
    set t_Co=256
    if has('termguicolors') && !exists('$TMUX')
      set termguicolors
    end

    let g:seoul256_light_background = 254
    colo seoul256-light
    let g:lightlineColor = 'seoul256'

    " for dark start
    " let g:dracula_italic = 0
    " colo dracula
    " let g:lightlineColor = 'Dracula'
    " set termguicolors
    " for dark end
  else
    if strftime('%H') >= 21 || strftime('%H') <= 9
      set background=dark
    else
      set background=light
    endif
    colo solarized
    call togglebg#map("<F9>")
    let g:lightlineColor = 'solarized'

  endif
endfunction
