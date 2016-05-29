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
call dein#add('rust-lang/rust.vim')

call dein#end()

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

    " Closes vim if last open window is NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif 

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

" Autosource nvim init file when it is edited
if has ("autocmd")
    autocmd BufWritePost init.vim source $MYVIMRC
endif
