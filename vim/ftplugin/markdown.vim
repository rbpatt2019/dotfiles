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

" Pair matching handled by coc.nvim
let b:coc_pairs = [["~", "~"], ["_", "_"], ["**", "**"]]
