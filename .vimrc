" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
"if filereadable("/etc/vim/vimrc.local")
"  source /etc/vim/vimrc.local
"endif

set t_Co=256
set number
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set wildmenu
set showmatch
"set hlsearch

" allows cursor change in tmux mode
if exists('$TMUX')
  let &t_SI = "\ePtmux;\e\e[6 q\e\\"
  let &t_SR = "\ePtmux;\e\e[4 q\e\\"
  let &t_EI = "\ePtmux;\e\e[2 q\e\\"
else
  let &t_SI = "\<esc>[6 q"  " blinking I-beam in insert mode
  let &t_SR = "\<esc>[4 q"  " blinking underline in replace mode
  let &t_EI = "\<esc>[2 q"  " default cursor (usually blinking block) otherwise
endif

" configure backup files
set backup                    " keep a backup file
set backupdir=~/.vim/ " store backups here
set directory=~/.vim/ " store swap files here

" netrw config
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

" set text width 
set textwidth=80
:set colorcolumn=+1

" vim-plugged
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'sjl/badwolf/'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

colorscheme badwolf 
