setlocal ts=4 sts=4 sw=4 

" vim-slime - sending to terminal
vmap <buffer> <localleader><leader> <Plug>SlimeRegionSend
nmap <buffer> <localleader>tt <Plug>SlimeConfig

" coc.nvim - language server integration
" This is basically VSCode integration for vim. 
" Intellisense completion and all that
" a lot of the settings for this plugin in are in the coc-settings.json
let b:coc_root_patterson = ['go.mod']
" snippets
imap <C-e> <Plug>(coc-snippets-expand)
let g:coc_snippet_next = '<C-d>'
let g:coc_snippet_prev = '<C-s>'
" go to defintion
nmap <buffer> <localleader>d <Plug>(coc-definition)
" <Plug>(coc-format-selected) is not supported by Black
nmap <buffer> <localleader>f <Plug>(coc-format)
" rename variables
nmap <buffer> <localleader>r <Plug>(coc-rename)
" get information
nmap <buffer> <localleader>h :call CocActionAsync('doHover')<CR>
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Add missing imports on write
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
