Plug 'w0rp/ale'

function ConfigureALE()
  let g:ale_sign_error = '✖'
  let g:ale_sign_warning = '➤'
  let g:ale_sign_info = '🛈'
  let g:ale_echo_msg_format = '%severity%: [%linter%]: %s'
	let g:ale_completion_enabled = 1
  let g:ale_lint_on_text_changed = 'never'

  let g:ale_linters = {}
  let g:ale_fixers = {}
endfunction
