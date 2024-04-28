if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

set nobackup
if has('persistent_undo')
  set undofile	" keep an undo file (undo changes after closing)
endif

colorscheme slate

set sc
set scs

set ts=4
set sts=0
set sw=4
set ai
set et
set si
set sta

set vb
set noeb
set t_vb=

let &t_ut=''

let mapleader=' '

nnoremap <leader>qq :q<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>ff :e 
nnoremap <leader><cr> :nohl<cr>

cnoremap w!! w! sudo tee % > /dev/null
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

execute pathogen#infect()

