Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }

function ConfigureJavascript()
  "let g:ale_linters.javascript = ['eslint', 'tsserver']
  "let g:ale_fixers.javascript = ['eslint']

  let g:javascript_plugin_jsdoc = 1
  let g:javascript_conceal_function             = "ƒ"
  let g:javascript_conceal_null                 = "ø"
  let g:javascript_conceal_this                 = "@"
  let g:javascript_conceal_return               = "⇚"
  let g:javascript_conceal_undefined            = "¿"
  let g:javascript_conceal_NaN                  = "И"
  let g:javascript_conceal_prototype            = "#"
  let g:javascript_conceal_static               = "•"
  let g:javascript_conceal_super                = "Ω"
  let g:javascript_conceal_arrow_function       = "λ"
  let g:javascript_conceal_noarg_arrow_function = "φ"

endfunction
