setlocal ts=2 sts=2 sw=2 

" Tabular - for lining up text, particularly in markdown
AddTabularPattern! GitTable /|/c0
nnoremap <buffer> <leader>mt :Tabularize GitTable<CR>

" vim-markdown-toc : for creating table of contents
let g:vmt_auto_update_on_save = 1
let g:vmt_cycle_list_item_markers = 0
let g:vmt_list_item_char = '-'
nnoremap <buffer> <leader>mc :GenTocGFM<CR>

" Preview markdown files
" nnoremap <buffer> <leader>mv :w<CR>:exe '!markdown_previewer ' . @%<CR>

" Lexima.vim - provides brackets autocompletion
" Add strikethrough pairing for markdown
call lexima#add_rule({'char': '~', 'input_after': '~', 'filetype': 'markdown'})
call lexima#add_rule({'char': '~', 'at': '\%#\~', 'leave': 1,  'filetype': 'markdown'})
call lexima#add_rule({'char': '<BS>', 'at': '\~\%#\~', 'delete': 1, 'filetype': 'markdown'})
" Add underline pairing for markdown
call lexima#add_rule({'char': '_', 'input_after': '_', 'filetype': 'markdown'})
call lexima#add_rule({'char': '_', 'at': '\%#_', 'leave': 1,  'filetype': 'markdown'})
call lexima#add_rule({'char': '<BS>', 'at': '_\%#_', 'delete': 1, 'filetype': 'markdown'})
" Add bold pairing for markdown
call lexima#add_rule({'char': '**', 'input_after': '**', 'filetype': 'markdown'})
call lexima#add_rule({'char': '**', 'at': '\%#\*\*', 'leave': 2,  'filetype': 'markdown'})
call lexima#add_rule({'char': '<BS>', 'at': '\*\*\%#\*\*', 'input': '<BS><BS>', 'delete': 2, 'filetype': 'markdown'})
