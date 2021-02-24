" Install vim-plugged
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plugged plugins
call plug#begin()
Plug 'tpope/vim-sensible' "sensible defaults
Plug 'tpope/vim-commentary' "comment stuff out
Plug 'rstacruz/vim-closer' "sensible auto-close brackets
Plug 'vim-airline/vim-airline' "airline status bar
Plug 'junegunn/fzf.vim' "fuzzy search
Plug 'junegunn/fzf' "fuzzy search
Plug 'morhetz/gruvbox' "gruvbox scheme
Plug 'Yggdroot/indentLine' "indent guides
Plug 'mhinz/vim-startify' "fancy start screen
Plug 'preservim/nerdtree' "nerdtree
Plug 'yuezk/vim-js' "js syntax
Plug 'maxmellon/vim-jsx-pretty' "jsx syntax
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } "prettier
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" current colorscheme
let g:gruvbox_italic=1
colorscheme gruvbox


" COC
set cmdheight=2
set updatetime=300
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" fzf config
nmap <silent> <C-p> :Files<CR>

" have Vim jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set background=dark " background
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
set termguicolors "enable true colors
set timeoutlen=1000 ttimeoutlen=0

" search
set hlsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" italicize stuff
highlight Comment cterm=italic gui=italic
highlight htmlArg cterm=italic gui=italic
highlight Type cterm=italic gui=italic

" cursor change when in insert mode
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

" set text width 
set textwidth=80
:set colorcolumn=+1

" nerdtree config
map <C-n> :NERDTreeToggle<CR>

" buffers
let g:airline#extensions#tabline#enabled = 1
nmap <C-t> :enew<CR>
nmap <C-l> :bnext<CR>
nmap <C-h> :bprevious<CR>
nmap <C-w> :bp <BAR> bd #<CR>

" split nav
nnoremap <C-J> <C-W><C-J>

" enable mouse
set mouse=a
