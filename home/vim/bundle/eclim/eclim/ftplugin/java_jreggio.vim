" Search
nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>

" Completion
inoremap <Nul> <C-x><C-u>
if has('gui')
  inoremap <C-space> <C-x><C-u>
endif
