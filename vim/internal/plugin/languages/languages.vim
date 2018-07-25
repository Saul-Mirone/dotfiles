so <sfile>:p:h/typescript.vim
so <sfile>:p:h/javascript.vim
so <sfile>:p:h/haskell.vim
so <sfile>:p:h/cpp.vim

function ConfigureLanguages()
  call ConfigureTypescript()
  call ConfigureJavascript()
  call ConfigureHaskell()
  call ConfigureCpp()
endfunction
