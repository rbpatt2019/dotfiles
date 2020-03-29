setlocal ts=4 sts=4 sw=4 

" vim-slime - sending to terminal
" let g:slime_no_mappings = 1
" let g:slime_python_ipython = 1
" let g:slime_target = 'vimterminal'
" let g:slime_vimterminal_cmd = '/home/rbpatt2019/.pyenv/shims/ipython'
" let g:slime_vimterminal_config = {'term_name': 'iPython', 'vertical': 1, 'term_finish': 'close'}
" " Run file in iPython
" nnoremap <buffer> <leader><CR> :w<CR>:exe 'call term_sendkeys(bufnr("iPython"), "run -t ' . @% . '\<lt>CR>")'<CR>
" " Send variable under cursor to iPy's ?
" nnoremap <buffer> <leader>lo "ayiw:exe 'call term_sendkeys(bufnr("iPython"), "?' . @a . '\<lt>CR>")'<CR>
" " Get all variables in namespace with iPy's whos
" nnoremap <buffer> <leader>lO :call term_sendkeys(bufnr("iPython"), "whos\<lt>CR>")<CR>
" " Considering adding options for timeit, memit whos
" " The issue is parsing quotes, which escape the exe call structure
" xmap <buffer> <leader><leader> <Plug>SlimeRegionSend
" nmap <buffer> <leader><leader> <Plug>SlimeParagraphSend
" nmap <buffer> tt <Plug>SlimeConfig

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
" Errors and their navigation
nmap <buffer> <localleader>l :CocList diagnostics<CR>
nmap <buffer> <localleader>j :CocNext<CR>
nmap <buffer> <localleader>k :CocPrev<CR>
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
