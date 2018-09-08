Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }

function ConfigureJavascript()
  let g:ale_fixers.javascript = ['eslint', 'tsserver']
endfunction
