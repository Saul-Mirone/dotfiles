Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

function ConfigureNERDTree()
  let g:NERDChristmasTree = 0
  let g:NERDTreeWinSize = 20
  let g:NERDTreeChDirMode = 2
  let g:NERDTreeIgnore = ['\~$', '\.pyc$', '\.swp$', 'node_modules$[[dir]]']
  let g:NERDTreeShowHidden = 1
  let g:NERDTreeShowBookmarks = 1
  let g:NERDTreeWinPos = 'right'
  let g:NERDTreeHighlightCursorline = 0
  let g:WebDevIconsUnicodeDecorateFileNodes = 1
  let g:WebDevIconsUnicodeDecorateFolderNodes = 1
  let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1 
  let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
  let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
endfunction
