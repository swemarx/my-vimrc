call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
" Plug 'joshdick/onedark.vim'
Plug 'fatih/vim-go'
call plug#end()

" Bools
set syntax=on
set list
set ignorecase
set smartcase
set noautoindent

" Vars
set bg=dark
set tabstop=4
set shiftwidth=4
set showbreak=↪\
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨,nbsp:+
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨,nbsp:+
"set colorscheme=solarized
"set colorscheme=onedark
"setlocal spell spelllang=en_us,sv
set guicursor=n:blinkon0

" Start NERDTree with Ctrl-n
map <C-n> :NERDTreeToggle<CR>

" Autostart NERDTree if vim started with no args
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Use space as leader
let mapleader=" "

" Quickly edit .vimrc in a split
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Quickly source .vimrc
:nnoremap <leader>sv :source $MYVIMRC<cr>

" fzy
"nnoremap <leader>e :call FzyCommand("find -type f", ":e")<cr>
"nnoremap <leader>v :call FzyCommand("find -type f", ":vs")<cr>
"nnoremap <leader>s :call FzyCommand("find -type f", ":sp")<cr>
nnoremap <leader>y :call FzyCommand("find -type f", ":e")<cr>

" disable auto-comment, better with au,
" https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines
"set formatoptions-=r formatoptions-=c formatoptions-=o
autocmd FileType * set fo-=c fo-=r fo-=o
