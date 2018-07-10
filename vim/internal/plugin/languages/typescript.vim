Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

function ConfigureTypescript()
  let g:ale_linters.typescript = ['tsserver', 'tslint']
endfunction
