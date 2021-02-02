setlocal ts=2 sts=2 sw=2 

" <- shortcut
inoremap <buffer> -- <space><-<space>
inoremap <buffer> ;; <space>%>%<space>
" vim-slime - sending to terminal
" as R-lsp does not yet support sending to terminal
let g:slime_cell_delimiter = "#%%"
nnoremap <buffer> <localleader>% :%g/#%%/d<CR>
nmap <buffer> <localleader><leader> <Plug>SlimeSendCell}
vmap <buffer> <localleader><leader> <Plug>SlimeRegionSend
nmap <buffer> <localleader>tt <Plug>SlimeConfig

" Object browsing
nnoremap <buffer> <localleader>O :call term_sendkeys(bufnr("R"), "objects()\<lt>CR>")<CR>
nnoremap <buffer> <localleader>P "ayiw:exe 'call term_sendkeys(bufnr("R"), "print(' . @a . ')\<lt>CR>")'<CR>
nnoremap <buffer> <localleader>H "ayiw:exe 'call term_sendkeys(bufnr("R"), "head(' . @a . ')\<lt>CR>")'<CR>
nnoremap <buffer> <localleader>T "ayiw:exe 'call term_sendkeys(bufnr("R"), "table(' . @a . ')\<lt>CR>")'<CR>
nnoremap <buffer> <localleader>I "ayiw:exe 'call term_sendkeys(bufnr("R"), "levels(Idents(' . @a . '))\<lt>CR>")'<CR>
" Run file in R
nnoremap <buffer> <localleader><localleader> :w<CR>:exe 'call term_sendkeys(bufnr("R"), "source(\"' . @% . '\")\<lt>CR>")'<CR>

" coc.nvim - language server integration
" This is basically VSCode integration for vim. 
" Intellisense completion and all that
" a lot of the settings for this plugin in are in the coc-settings.json
" snippets
imap <C-e> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<C-f>'
let g:coc_snippet_prev = '<C-d>'
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
