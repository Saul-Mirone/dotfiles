if has('nvim')
  set rtp+=~/.local/share/nvim
  call plug#begin('~/.local/share/nvim/plugged')
else
  set rtp+=~/.vim
  call plug#begin('~/.vim/plugged')
endif

so <sfile>:p:h/plugin/theme.vim
so <sfile>:p:h/plugin/components/components.vim
so <sfile>:p:h/plugin/languages/languages.vim

call plug#end()

call ConfigureTheme()
call ConfigureComponents()
call ConfigureLanguages()
