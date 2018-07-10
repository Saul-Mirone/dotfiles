Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'alx741/vim-hindent', { 'for': 'haskell' }
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim', 'for': 'haskell' }

function ConfigureHaskell()
  let g:ale_linters.haskell = ['hlint']
endfunction
