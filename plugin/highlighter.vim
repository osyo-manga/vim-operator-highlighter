scriptencoding utf-8
if exists('g:loaded_highlighter')
  finish
endif
let g:loaded_highlighter = 1

let s:save_cpo = &cpo
set cpo&vim

command! HighlighterClear call highlighter#clear()

noremap <silent> <Plug>(operator-highlighter-clear) :<C-u>Highlighter<CR>
map <silent> <Plug>(operator-highlighter-once) <Plug>(operator-highlighter-clear)<Plug>(operator-highlighter)

let &cpo = s:save_cpo
unlet s:save_cpo
