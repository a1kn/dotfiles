" Install vim-plugged
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plugged plugins
call plug#begin()
Plug 'tpope/vim-sensible' "default settings
Plug 'tpope/vim-commentary' "comment stuff out
Plug 'rstacruz/vim-closer' "sensible auto-close
Plug 'vim-airline/vim-airline' "airline status bar
Plug 'ctrlpvim/ctrlp.vim' "fuzzy search
Plug 'dracula/vim' "dracula scheme
Plug 'neoclide/coc.nvim' "completion
Plug 'morhetz/gruvbox' "gruvbox scheme
Plug 'Yggdroot/indentLine' "indent guides
Plug 'mhinz/vim-startify' "fancy start screen
Plug 'benmills/vimux' "vimux to run vim files in tmux
call plug#end()

" current colorscheme
colorscheme gruvbox

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set number " Line numbers
set tabstop=2 "tab spaces
set shiftwidth=2 " indenting
set expandtab " use for autocompletion
set cursorline " highlight current line
set wildmenu " command completion
set showmatch " shows matching opening/closing parentheses

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

" vimux shortcuts
map <Leader>r :VimuxPromptCommand<CR>
map <Leader>l :VimuxRunLastCommand<CR>
map <Leader>q :VimuxCloseRunner<CR>
