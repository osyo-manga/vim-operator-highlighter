scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

let s:V = vital#of("vital")
function! highlighter#vital()
	return s:V
endfunction

let s:H = s:V.import("Coaster.Highlighter")
let s:Gift = s:V.import("Gift")


function! highlighter#highlight(config)
	let group = a:config.group
	let pattern = a:config.pattern
	let priority = get(a:config, "priority", 10)
	let clear_time = a:config.clear_time
	let id = s:H.get().highlight(group, pattern, priority)

	if clear_time == 0 || !exists("*timer_start")
		return id
	endif

	let clear_obj = {
\		"id" : id,
\		"winnr" : s:Gift.uniq_winnr(),
\	}
	function! clear_obj.clear(...)
		silent! call s:Gift.execute(self.winnr, "call matchdelete(" . self.id . ")")
	endfunction

	call timer_start(clear_time, function(clear_obj.clear, [], clear_obj))
endfunction


function! highlighter#clear()
	return s:H.get().clear()
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
