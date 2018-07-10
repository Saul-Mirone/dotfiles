Plug 'itchyny/lightline.vim'

function ConfigureLightLine()
  let g:lightline = {
  \ 'colorscheme': g:lightlineColor,
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'session' ] ],
  \   'right': [ ['lineinfo'],
  \              ['percent'],
  \              ['linter_warnings', 'linter_errors', 'linter_ok'],
  \              ['fileformat'],
	\              ['fileencoding'] ]
  \ },
	\ 'component_expand': {
	\   'linter_warnings': 'LightlineLinterWarnings',
	\   'linter_errors': 'LightlineLinterErrors',
	\   'linter_ok': 'LightlineLinterOK',
	\   'lineinfo': 'LineInfo'
	\ },
	\ 'component_type': {
	\   'readonly': 'error',
	\   'linter_warnings': 'warning',
	\   'linter_errors': 'error',
	\   'linter_ok': 'ok'
	\ },
  \ 'component_visible_condition': {
  \   'session': 'SessionVisible()',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LightlineFugitive',
  \   'readonly': 'LightlineReadonly',
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

	autocmd User ALELintPost call s:MaybeUpdateLightline()
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
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

function! LineInfo()
	return !&binary ? '%3l:%-2v' : '%3l:%-2v off:%o,0x%O'
endfunction
