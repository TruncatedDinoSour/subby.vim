" Plugin Name: subby.vim
" Description: inline buffer substitute in vim
" Author: Ari Archer <ari.web.xyz@gmail.com>
" Version: 1.0.0
" License: GPLv3
" URL: https://ari-web.xyz/gh/subby.vim


if !exists('g:subby')
    let g:subby = {'sh': 'š'}
endif

if !exists('g:subby_delim')
    let g:subby_delim = '\'
endif

function! s:SubbyGetWord()
    let line = getline('.')
    let col = col('.')
    let start_col = col - 1

    while start_col > 0 && line[start_col - 1] =~ '\w'
        let start_col -= 1
    endwhile

    let end_col = col

    while end_col < strlen(line) && line[end_col] =~ '\w'
        let end_col += 1
    endwhile

    return line[start_col - 1:end_col]
endfunction

function! s:Subby()
    let word = s:SubbyGetWord()

    for [key, val] in items(g:subby)
        let pattern = '\V' . escape(g:subby_delim . key, '\')

        if word =~ pattern
            let s = substitute(word, pattern, val, '')

            normal! dbdh
            execute 'normal! i' . s
            execute 'normal! l' . len(s)
        endif
    endfor
endfunction

augroup subby_init
    autocmd!

    if len(g:subby_delim) != 1
        echoerr "error : g:subby_delim must be exactly one character"
        finish
    endif

    autocmd TextChangedI <buffer> call s:Subby()
augroup END
