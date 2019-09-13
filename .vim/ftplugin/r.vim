let b:lint = 2
setlocal ts=4 sts=4 sw=4 

" <- shortcut
inoremap <buffer> -- <-
" vim-slime - sending to terminal
let g:slime_no_mappings = 1
let g:slime_python_ipython = 1
let g:slime_target = 'vimterminal'
let g:slime_vimterminal_cmd = 'radian'
let g:slime_vimterminal_config = {'term_name': 'R', 'vertical': 1, 'term_finish': 'close'}
xmap <buffer> <leader><leader> <Plug>SlimeRegionSend
nmap <buffer> <leader><leader> <Plug>SlimeParagraphSend
nmap <buffer> tt <Plug>SlimeConfig

" Object browsing
nnoremap <buffer> <leader>lO :call term_sendkeys(bufnr("R"), "objects()\<lt>CR>")<CR>
nnoremap <buffer> <leader>lo "ayiw:exe 'call term_sendkeys(bufnr("R"), "show(' . @a . ')\<lt>CR>")'<CR>
" Run file in R
nnoremap <buffer> <leader><CR> :w<CR>:exe 'call term_sendkeys(bufnr("R"), "source(\"' . @% . '\")\<lt>CR>")'<CR>

" coc.nvim - language server integration
" This is basically VSCode integration for vim. 
" Intellisense completion and all that
" a lot of the settings for this plugin in are in the coc-settings.json
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
nmap <buffer> <leader>ll :CocList diagnostics<CR>
nmap <buffer> <leader>lj :CocNext<CR>
nmap <buffer> <leader>lk :CocPrev<CR>
" go to defintion
nmap <buffer> <leader>ld <Plug>(coc-definition)
" <Plug>(coc-format-selected) is not supported by Black
nmap <buffer> <leader>lf <Plug>(coc-format)
" rename variables - not yet supported in R
" nmap <buffer> <leader>lr <Plug>(coc-rename)
" get information
nmap <buffer> <leader>li :call CocActionAsync('doHover')<CR>
nmap <buffer> <leader>lh :call CocActionAsync('showSignatureHelp')<CR>
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" Find other commands
nmap <buffer> <leader>lc :CocCommand<CR>

