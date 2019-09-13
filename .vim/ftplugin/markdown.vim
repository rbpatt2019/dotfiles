let b:lint = 2
setlocal ts=2 sts=2 sw=2 

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

" Tabular - for lining up text, particularly in markdown
AddTabularPattern! GitTable /|/c0
nnoremap <buffer> <leader>mt :Tabularize GitTable<CR>

" vim-markdown-toc : for creating table of contents
let g:vmt_auto_update_on_save = 1
let g:vmt_cycle_list_item_markers = 0
let g:vmt_list_item_char = '-'
nnoremap <buffer> <leader>mc :GenTocGFM<CR>

" Preview markdown files
nnoremap <buffer> <leader>mv :exe '!markdown_previewer ' . @%<CR>

" Lexima.vim - provides brackets autocompletion
" Add strikethrough pairing for markdown
" call lexima#add_rule({'char': '~', 'input_after': '~', 'filetype': 'markdown'})
" call lexima#add_rule({'char': '~', 'at': '\%#~', 'leave': 1,  'filetype': 'markdown'})
" call lexima#add_rule({'char': '<BS>', 'at': '~\%#~', 'delete': 1, 'filetype': 'markdown'})
" " Add underline pairing for markdown
" call lexima#add_rule({'char': '_', 'input_after': '_', 'filetype': 'markdown'})
" call lexima#add_rule({'char': '_', 'at': '\%#_', 'leave': 1,  'filetype': 'markdown'})
" call lexima#add_rule({'char': '<BS>', 'at': '_\%#_', 'delete': 1, 'filetype': 'markdown'})
" " Add bold pairing for markdown
" call lexima#add_rule({'char': '**', 'input_after': '**', 'filetype': 'markdown'})
" call lexima#add_rule({'char': '**', 'at': '\%#\**', 'leave': 2,  'filetype': 'markdown'})
" call lexima#add_rule({'char': '<BS>', 'at': '\**\%#\**', 'input': '<BS><BS>', 'delete': 2, 'filetype': 'markdown'})
