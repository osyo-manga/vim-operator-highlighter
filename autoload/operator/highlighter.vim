scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:S = highlighter#vital().import("Coaster.Search")


let s:default_config = get(g:, "operator#highlighter#default_config", {
\	"group" : "Error",
\	"clear_time" : 0
\})

let g:operator#highlighter#config = get(g:, "operator#highlighter#config", {})


function! s:as_wise_key(name)
	return a:name ==# "char"  ? "v"
\		 : a:name ==# "line"  ? "V"
\		 : a:name ==# "block" ? "\<C-v>"
\		 : a:name
endfunction

function! s:as_config(src)
	return type(a:src) == type({}) ? a:src : { "group" : a:src }
endfunction

function! s:get_config(base)
	return extend(deepcopy(a:base), extend(deepcopy(s:default_config), g:operator#highlighter#config))
endfunction


let s:base_config = {}
function! operator#highlighter#do(wise)
	let config = s:get_config(s:base_config)
	let config.pattern = s:S.pattern_by_range(s:as_wise_key(a:wise), getpos("'[")[1:], getpos("']")[1:])

	return highlighter#highlight(config)
endfunction




let &cpo = s:save_cpo
unlet s:save_cpo
