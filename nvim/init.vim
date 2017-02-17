" Dein stuff
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.config/nvim/dein/'))
"call dein#add('~/.config/nvim/dein/')
call dein#add('Shougo/dein.vim')

" Plugins
call dein#add('scrooloose/nerdtree')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('vim-scripts/Mark--Karkat')
call dein#add('morhetz/gruvbox')
call dein#add('jessekphillips/d.vim')
call dein#add('neovimhaskell/haskell-vim')
call dein#add('vim-syntastic/syntastic')
call dein#add('rust-lang/rust.vim')

call dein#end()

" Let rust.vim automatically format on save
let g:rustfmt_autosave = 1

" Let syntastic do its thing
set statusline +=%#warningmsg#
set statusline +=%{SyntasticStatuslineFlag()}
set statusline +=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTree options
let NERDTreeIgnore = ['\.pyc$']
map <C-n> :NERDTreeToggle<CR>

" CTRLP options
let g:ctrlp_cache_dir = $HOME . '~/.cache/ctrlp'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_working_path_mode = 0

" Syntax highlighting and true color
syntax on
let NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme gruvbox

" Enable line numbers
set relativenumber

" Tab facilities
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Show trailing whitespace and color it
set list
set listchars=tab:▸\ ,trail:·,eol:¬

" Display 80-column marker
set colorcolumn=80

" Automatically copy to system CLIPBOARD
set clipboard+=unnamedplus

" Filetype preferences
if has ("autocmd")

    " Enable filetype detection
    filetype on

    " Makefiles require tab-only indentation, yaml wants spaces
    " ts = tabstop, sts = softtabstop, sw = shiftwidth
    autocmd fileType make setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd fileType python setlocal foldmethod=indent
    autocmd fileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
    autocmd filetype html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd filetype css setlocal ts=2 sts=2 sw=2 expandtab

    " Closes vim if last open window is NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

    " Automatically enter insert mode when switching to a terminal
    autocmd BufWinEnter,WinEnter term://* startinsert

endif

" Set external text formatter: par with 79-column width, so that the 80th
" character is a carriage return
set formatprg=par\ -w79

" Folding and splitting
set splitright
set splitbelow
set foldlevel=99

" Mappings
let mapleader=","

" Navigate splits with less hassle
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Make Esc in termal mode behave like it should
tnoremap <Esc> <C-\><C-n>

" Auto-Esc when moving away from a terminal window
" Recursive maps so they map to the remapped Esc and <C-*> shortcuts
tmap <C-h> <Esc><C-h>
tmap <C-j> <Esc><C-j>
tmap <C-k> <Esc><C-k>
tmap <C-l> <Esc><C-l>

" Autosource nvim init file when it is edited
if has ("autocmd")
    autocmd BufWritePost init.vim source $MYVIMRC
endif
