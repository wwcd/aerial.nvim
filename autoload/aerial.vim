function! aerial#fzf() abort
	let l:labels = luaeval("require('aerial.fzf').get_labels()")
	if type(l:labels) == type(v:null) && l:labels == v:null
		return
	endif
  let l:opts = {
        \'source': l:labels,
        \'sink': funcref('aerial#goto_symbol'),
        \'options': ['+m', '--tiebreak=index', '--prompt', 'Tags> ', '--with-nth', '2..', '--nth=2..', '--ansi'],
        \}
	call fzf#run(fzf#wrap('aerial', l:opts, 0))
endfunction

function! aerial#goto_symbol(symbol) abort
	call luaeval("require('aerial.fzf').goto_symbol(_A)", a:symbol)
endfunction
