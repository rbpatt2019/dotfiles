setlocal ts=4 sts=4 sw=4 

" coc.nvim - language server integration
" This is basically VSCode integration for vim. 
" Intellisense completion and all that
" a lot of the settings for this plugin in are in the coc-settings.json
let b:coc_root_patterson = ['.gitignore', '.python-version']
" completion
inoremap <expr> <buffer> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <buffer> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <buffer> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
" snippets
imap <C-e> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<C-f>'
let g:coc_snippet_prev = '<C-d>'
" File and selection execution
nmap <buffer> <localleader><cr> :CocCommand python.execInTerminal<CR>
vmap <buffer> <localleader><cr> :CocCommand python.execSelectionInTerminal<CR>
" go to defintion
nmap <buffer> <localleader>d <Plug>(coc-definition)
" <Plug>(coc-format-selected) is not supported by Black
nmap <buffer> <localleader>f <Plug>(coc-format)
nmap <buffer> <localleader>s :CocCommand python.sortImports<CR>
" rename variables
nmap <buffer> <localleader>r <Plug>(coc-rename)
" get information
nmap <buffer> <localleader>h :call CocActionAsync('doHover')<CR>
nmap <buffer> <localleader>i :call CocActionAsync('showSignatureHelp')<CR>
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" Set venv
nmap <buffer> <localleader>v :CocCommand python.setInterpreter<CR>

"Run tests using makefile in root directory
nnoremap <buffer> <localleader>t :w ! make test<CR>
