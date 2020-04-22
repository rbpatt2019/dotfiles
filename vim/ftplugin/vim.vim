setlocal tabstop=2 sts=2 sw=2 

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
nmap <buffer> <localleader>f <Plug>(coc-format)
nmap <buffer> <localleader>r <Plug>(coc-rename)
nmap <buffer> <localleader>h :call CocActionAsync('doHover')<CR>
nmap <buffer> <localleader>i :call CocActionAsync('showSignatureHelp')<CR>
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
