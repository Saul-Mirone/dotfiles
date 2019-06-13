Plug 'itchyny/lightline.vim'

function ConfigureLightLine()
  let g:lightline = {
  \ 'colorscheme': g:lightlineColor,
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'bufnum', 'readonly'] ],
  \   'right': [ ['lineinfo'],
  \              ['percent'],
  \              ['linter_warnings', 'linter_errors', 'linter_hint', 'linter_info', 'linter_ok'],
  \              ['fileformat'],
	\              ['fileencoding'] ]
  \ },
  \ 'tabline': {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['session'] ]
  \ },
	\ 'component_expand': {
	\   'linter_warnings': 'LightlineLinterWarnings',
	\   'linter_errors': 'LightlineLinterErrors',
	\   'linter_info': 'LightlineLinterInfo',
	\   'linter_hint': 'LightlineLinterHints',
	\   'linter_ok': 'LightlineLinterOK',
	\   'lineinfo': 'LineInfo'
	\ },
	\ 'component_type': {
	\   'readonly': 'error',
	\   'linter_warnings': 'warning',
	\   'linter_errors': 'error',
	\   'linter_info': 'tabsel',
	\   'linter_hint': 'middle',
	\   'linter_ok': 'ok'
	\ },
  \ 'component_visible_condition': {
  \   'session': 'SessionVisible()',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LightlineFugitive',
  \   'readonly': 'LightlineReadonly',
  \   'cocstatus': 'coc#status'
  \ },
  \ 'component': {
  \   'lineinfo': ' %3l:%-2v',
  \   'session': '%{ObsessionStatus()}'
  \ },
  \ 'separator': {
  \    'left': '',
  \    'right': ''
  \ },
	\ }

	"autocmd User ALELintPost call s:MaybeUpdateLightline()
  autocmd User CocDiagnosticChange call lightline#update()

	function! s:MaybeUpdateLightline()
		if exists('#lightline')
			call lightline#update()
		end
	endfunction
endfunction

function SessionVisible()
  return ObsessionStatus() != ''
endfunction

function LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function LightlineFugitive()
  if &ft !~? 'vimfiler' && exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineLinterWarnings() abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, 'warning', 0) == 0
    return ''
  endif
  return printf('%d ◆', info['warning'])
endfunction

function! LightlineLinterErrors() abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, 'error', 0) == 0
    return ''
  endif
  return printf('%d ✗', info['error'])
endfunction

function! LightlineLinterInfo() abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, 'information', 0) == 0
    return ''
  endif
  return printf('%d ●', info['information'])
endfunction

function! LightlineLinterHints() abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, 'hints', 0) == 0
    return ''
  endif
  return printf('%d ○', info['hits'])
endfunction

function! LightlineLinterOK() abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || (get(info, 'error', 0) == 0 && get(info, 'warning', 0) == 0 )
    return '✓'
  endif
  return ''
endfunction

function! LineInfo()
	return !&binary ? '%3l:%-2v' : '%3l:%-2v off:%o,0x%O'
endfunction
