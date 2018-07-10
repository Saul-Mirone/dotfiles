so <sfile>:p:h/typescript.vim
so <sfile>:p:h/javascript.vim
so <sfile>:p:h/haskell.vim

function ConfigureLanguages()
  call ConfigureTypescript()
  call ConfigureJavascript()
  call ConfigureHaskell()
endfunction
