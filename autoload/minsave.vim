" Functions that save minimized windows on current tab
" before close and split and minimize after.
" Windows sizes saved in reverse order because they
" should be minimized in this order.

func minsave#SaveMinWins()
	let winlist = []
	let cwinnr = winnr('$')
	while cwinnr >= 1
		let winheight = winheight(cwinnr)
		let winwidth = winwidth(cwinnr)
		if winheight == 1 || winwidth == 1
			call add(winlist, [win_getid(cwinnr), winheight, winwidth])
		endif
		let cwinnr -= 1
	endwhile
	return winlist
endfunc

func minsave#MinimizeWins(winlist)
	let cwinid = win_getid()
	for mwin in a:winlist
		if win_id2win(mwin[0])
			call win_gotoid(mwin[0])
			if mwin[1] == 1
				resize 1
			endif
			if mwin[2] == 1
				vertical resize 1
			endif
		endif
	endfor
	call win_gotoid(cwinid)
endfunc
