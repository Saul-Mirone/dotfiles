Plug 'othree/yajs.vim', { 'for': 'javascript' }

function ConfigureJavascript()
  let g:ale_fixers.javascript = ['eslint']
endfunction
