sy on
colors elflord
colors pablo
colors desert

""""""""""""""""""""""""""""""""""""""""""""""
"source $VIMRUNTIME\enscript.vim
filetype plugin on
filetype plugin indent off
au BufNewFile,BufRead *.enscript setf enscript
""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"set guifont=Lucida_Console:h9:cANSI
set guifont=Courier_New:h10:cANSI


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" pancake's exposee for vim:
let fs=0
fun Exposee()
if (g:fs == 0)
  res 1000 
  vertical res 1000
  let g:fs=1
else
  exe "normal \<C-W>="
  let g:fs=0
endif
endfun
map <F10> :call Exposee()<cr>

"some nice keymappings
map <F1> :vsp<cr>
map <F2> :sp<cr>
map <F3> :sp<cr>:e .<cr>
map <F4> :q<cr>
map <F5> <C-W>=

" fine zooming
map <C-J> 2<C-W>+
map <C-K> 2<C-W>-
map <C-L> 2<C-W>>
map <C-H> 2<C-W><

" fine frame moving
map <C-Y> <C-W>h
map <C-U> <C-W>j
map <C-I> <C-W>k
map <C-O> <C-W>l

map <C-S> :w!<cr>
set ts=4
