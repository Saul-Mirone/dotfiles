Plug 'SirVer/ultisnips'

function ConfigureUltiSnips()
  if has('nvim')
    let g:UltiSnipsSnippetsDir="~/.local/share/nvim/UltiSnips"
  else
    let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
  endif
  let g:ultisnipseditsplit = "tabdo"
endfunction
