let b:lint = 2
setlocal tabstop=2 sts=2 sw=2 

" coc.nvim - language server integration
" This is basically VSCode integration for vim. 
" Intellisense completion and all that
" a lot of the settings for this plugin in are in the coc-settings.json
" completion
inoremap <expr> <buffer> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <buffer> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <buffer> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
" Find other commands
nmap <buffer> <leader>lc :CocCommand<CR>

nnoremap <silent> <buffer> <leader>y :<C-u>CocList -A --normal yank<CR>

