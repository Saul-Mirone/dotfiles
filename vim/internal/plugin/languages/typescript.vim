Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }

function ConfigureTypescript()
  autocmd BufNewFile,BufRead *.tsx set filetype=typescript
  let g:ale_linters.typescript = ['tsserver', 'tslint']
  let g:ale_fixers.typescript = ['tslint']
endfunction
