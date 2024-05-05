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

call plug#begin()

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'mbbill/undotree'
Plug 'preservim/tagbar'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'

call plug#end()

let g:airline#extensions#tabline#enabled = 1

nnoremap <leader>fe :NERDTreeToggle<cr>
nnoremap <leader>u :UndotreeToggle<cr>:UndotreeFocus<cr>
nnoremap <leader>cs :Tagbar<cr>

" Disable warning for vim 8.1
let g:coc_disable_startup_warning = 1

