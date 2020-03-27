set tabstop=2
set shiftwidth=2
set expandtab

let R_app = "radian"
let R_cmd = "R"
let R_hl_term = 0
let R_close_term = 1
let R_esc_term = 0
let R_args = []
let R_bracketed_paste = 1
let R_nvim_wd = 1
let R_objbr_w = 90
let R_objbr_openlist = 1
let R_objbr_opendf = 1
let R_disable_cmds = []

nmap <localleader>: :RSend

nmap <localleader>tt <Plug>RStart
nmap <localleader>tq :RSend quit()<CR>
" Since using radian, close with quit()

nmap <localleader><S-space>  <Plug>RSendFile
vmap <localleader><space>  <Plug>RDSendSelection
nmap <localleader><space>  <Plug>RDSendLine
" ,o insert output of line as comment

nmap <localleader>h <Plug>RHelp
nmap <localleader>i <Plug>RShowArgs
nmap <localleader>L :call RAction("levels")<CR>
nmap <localleader>t :call RAction("typeof")<CR>
nmap <localleader>T :call RAction("table")<CR>
nmap <localleader>I :call RAction("Idents")<CR>
nmap <localleader>N :call RAction("names")<CR>
nmap <localleader>P :call RAction("print")<CR>
nmap <localleader>H :call RAction("head")<CR>

" ,rm remove objects and clear console
nmap <localleader>bo <Plug>RUpdateObjBrowser
nmap <localleader>b= <Plug>ROpenLists
nmap <localleader>b- <Plug>RCloseLists

