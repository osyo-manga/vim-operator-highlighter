scriptencoding utf-8
if exists('g:loaded_operator_highlighter')
  finish
endif
let g:loaded_operator_highlighter = 1

let s:save_cpo = &cpo
set cpo&vim


call operator#user#define('highlighter', 'operator#highlighter#do')


let &cpo = s:save_cpo
unlet s:save_cpo
