setlocal ts=2 sts=2 sw=2 

" Tabular - for lining up text, particularly in markdown
packadd tabular
AddTabularPattern! GitTable /|/c0
nnoremap <buffer> <localleader>t :Tabularize GitTable<CR>
vnoremap <buffer> <localleader>t :Tabularize GitTable<CR>

" vim-markdown-toc : for creating table of contents
packadd markdown-toc
let g:mdtoc_starting_header_level = 1
nnoremap <buffer> <localleader>c :GenerateMarkdownTOC<CR>

" Preview markdown files
nnoremap <buffer> <localleader>v :w<CR>:exe '!grip -b ' . @% . ' 0'<CR>

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
