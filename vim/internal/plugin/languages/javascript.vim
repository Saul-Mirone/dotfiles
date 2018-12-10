Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

function ConfigureJavascript()
  let g:ale_linters.javascript = ['eslint', 'tsserver']
  let g:ale_fixers.javascript = ['eslint']
endfunction
