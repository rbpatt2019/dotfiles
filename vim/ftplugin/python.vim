setlocal ts=4 sts=4 sw=4 

" vim-slime - sending to terminal
let g:slime_python_ipython = 1
let g:slime_cell_delimiter = "#%%"
nnoremap <buffer> <localleader>% :%g/#%%/d<CR>
nmap <buffer> <localleader><leader> <Plug>SlimeSendCell}
vmap <buffer> <localleader><leader> <Plug>SlimeRegionSend
nmap <buffer> <localleader>tt <Plug>SlimeConfig
nnoremap <buffer> <localleader><localleader> :w<CR>:let @+="\%run " . @%<CR>:!tmux send -t 1 '\%paste' Enter<CR><C-L>

" Object browsing
nnoremap <buffer> <localleader>O :!tmux send -t 1 '\%whos' Enter<CR><C-L>
nnoremap <buffer> <localleader>P "ayiw:exe "!tmux send -t -1 'print(" . @a . ")' Enter"<CR><C-L>
nnoremap <buffer> <localleader>D :CocCommand pydocstring.runFile<CR>
nnoremap <buffer> <localleader>T I%timeit <ESC>"+yy:!tmux send -t 1 '\%paste' Enter<CR><C-L>u

" coc.nvim - language server integration
" This is basically VSCode integration for vim. 
" Intellisense completion and all that
" a lot of the settings for this plugin in are in the coc-settings.json
let b:coc_root_patterson = ['.gitignore', '.python-version']
" snippets
imap <C-e> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<C-d>'
let g:coc_snippet_prev = '<C-s>'
" Add docstring support
let b:coc_pairs = [["'''", "'''"], ["\"\"\"", "\"\"\""]]
" go to defintion
nmap <buffer> <localleader>d <Plug>(coc-definition)
" <Plug>(coc-format-selected) is not supported by Black
nmap <buffer> <localleader>f <Plug>(coc-format)
nmap <buffer> <localleader>s :CocCommand pyright.organizeimports<CR>
" rename variables
nmap <buffer> <localleader>r <Plug>(coc-rename)
" get information
nmap <buffer> <localleader>h :call CocActionAsync('doHover')<CR>
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" Set venv
if !empty($PYENV_VIRTUAL_ENV)
  call coc#config('python', {
  \   'pythonPath': $PYENV_VIRTUAL_ENV . '/bin/python'
  \ })
endif

"Run tests using makefile in root directory
nnoremap <buffer> <localleader>t :w ! make test<CR>
