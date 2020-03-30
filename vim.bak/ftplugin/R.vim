setlocal ts=2 sts=2 sw=2 

" <- shortcut
inoremap <buffer> --  <- 
" vim-slime - sending to terminal
" as R-lsp does not yet support sending to terminal
let g:slime_no_mappings = 1
let g:slime_target = 'vimterminal'
let g:slime_vimterminal_cmd = 'radian'
let g:slime_vimterminal_config = {'term_name': 'R', 'vertical': 1, 'term_finish': 'close'}
vmap <buffer> <localleader><leader> <Plug>SlimeRegionSend
nmap <buffer> <localleader>tt <Plug>SlimeConfig

" Object browsing
nnoremap <buffer> <localleader>o :call term_sendkeys(bufnr("R"), "objects()\<lt>CR>")<CR>
nnoremap <buffer> <localleader>p "ayiw:exe 'call term_sendkeys(bufnr("R"), "print(' . @a . ')\<lt>CR>")'<CR>
" Run file in R
nnoremap <buffer> <localleader><CR> :w<CR>:exe 'call term_sendkeys(bufnr("R"), "source(\"' . @% . '\")\<lt>CR>")'<CR>

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
nmap <buffer> <localleader>l :CocList diagnostics<CR>
nmap <buffer> <localleader>j :CocNext<CR>
nmap <buffer> <localleader>k :CocPrev<CR>
" go to defintion
nmap <buffer> <localleader>d <Plug>(coc-definition)
" <Plug>(coc-format-selected) is not supported by Black
nmap <buffer> <localleader>f <Plug>(coc-format)
" rename variables
nmap <buffer> <localleader>r <Plug>(coc-rename)
" get information
nmap <buffer> <localleader>h :call CocActionAsync('doHover')<CR>
nmap <buffer> <localleader>i :call CocActionAsync('showSignatureHelp')<CR>
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
