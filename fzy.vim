function! FzyCommand(choice_command, vim_command)
	try
		let output = system(a:choice_command . " | fzy ")
	catch /Vim:Interrupt/
		" Swallow errors from ^C, allow redraw! below
	endtry
	redraw!
	if v:shell_error == 0 && !empty(output)
		exec a:vim_command . ' ' . output
	endif
endfunction

" Check .vimrc for mappings
"nnoremap <leader>e :call FzyCommand("find -type f", ":e")<cr>
"nnoremap <leader>v :call FzyCommand("find -type f", ":vs")<cr>
"nnoremap <leader>s :call FzyCommand("find -type f", ":sp")<cr>
