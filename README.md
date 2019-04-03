# vim-minsave

Vim restore minimized windows after `close` and `split` commands in some cases.
This plugin suggests `minsave#SaveMinWins()` function to save minimized windows
list before this commands and `minsave#MinimizeWins(winlist)` to minimize
windows again.

Usage example:
```vim
func s:CloseCurrentWindow()
	let minwinlist = minsave#SaveMinWins()
   	close
   	call minsave#MinimizeWins(minwinlist)
endfunc
```
