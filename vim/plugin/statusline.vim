" Change color based on mode
let g:currentmode={
	\ 'n'      : 'N',
	\ 'no'     : 'NOP',
	\ 'v'      : 'V',
	\ 'V'      : 'VL',
	\ 's'      : 'S',
	\ 'S'      : 'SL',
	\ 'i'      : 'I',
	\ 'R'      : 'R',
	\ '!'      : '!',
	\ 't'      : 'T'
	\}

" Define Highlight groups
" Use for other, brmagenta
hi User1 ctermbg=13 ctermfg=0
" Use for replace, green
hi User2 ctermbg=9 ctermfg=0
" Use for select, yellow
hi User3 ctermbg=3 ctermfg=0
" Use for insert mode, blue
hi User4 ctermbg=4 ctermfg=0
" Use for normal mode, grey 
hi User5 ctermbg=7 ctermfg=0
" User for terminal, orange
hi User6 ctermbg=0 ctermfg=6
" Use for visual, purple
hi User7 ctermbg=11 ctermfg=0

" Linter status - from w0rp/ale
function! LinterStatus() abort
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total ==0 ? 'OK' : printf(
        \       '%dW %dE',
        \       all_non_errors,
        \       all_errors,
        \)
endfunction

" Enable Statusline
function! MyStatusLine() abort
  " Color
  if mode() ==? 'n' || mode() ==? 'no'
          let status = "%5*"
  elseif mode() ==? 'v' || mode() ==? 'V'
          let status = "%7*"
  elseif mode() ==? 's' || mode() ==? 'S'
          let status = "%3*"
  elseif mode() ==? 'i'
          let status = "%4*"
  elseif mode() ==? 'R'
          let status = "%2*"
  elseif mode() ==? 't'
          let status = "%6*"
	else
		let status = "%1*"
	endif
	" Mode
	let status .= "[%{toupper(g:currentmode[mode()])}]"
        " File name
	let status .= "%f"
        " Flags
	let status .= "%r%m%h%w%q"
	" Splif and Right align
  let status .= "%<%="
	" Python info
  if exists('b:lint')
    if b:lint == 2
      let status .= "[%{coc#status()}]"
    elseif b:lint == 1
      let status .= "[%{LinterStatus()}]"
    endif
  endif
	" Git branch
  let status .= "%{FugitiveStatusline()}"
	" Cursor location
  let status .= "[%l:%c]"
  return status
endfunction
