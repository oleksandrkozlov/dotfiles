set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'dracula/vim'
Plugin 'tpope/vim-fugitive'
Plugin 'oleksandrkozlov/a.vim'
Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'

call vundle#end()

filetype plugin indent on

let mapleader = "\<Space>"
syntax on
let g:dracula_bold = 1
let g:dracula_italic = 0
let g:dracula_underline = 1
let g:dracula_undercurl = 1
let g:dracula_inverse = 1
let g:dracula_colorterm = 0
color dracula

au CursorHold * checktime
"autocmd FocusGained * silent! checktime

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#tabline#show_buffers=0
let g:airline#extensions#tabline#show_tabs=1
let g:airline#extensions#tabline#fnamemod=':p:t'
let g:airline#extensions#tabline#fnametruncate=0
let g:airline_powerline_fonts=1
let g:airline_theme='dracula'
let g:airline#extensions#ycm#enabled =1
let g:airline#extensions#ycm#error_symbol = '✖ '
let g:airline#extensions#ycm#warning_symbol = '⚠ '

let g:ycm_use_clangd=1
let g:ycm_clangd_uses_ycmd_caching=0
let g:ycm_clangd_binary_path = '/home/olkozlo/Work/workspace/llvm-project/build/bin/clangd' "or exepath('clangd')
let g:ycm_warning_symbol = '⚠'
let g:ycm_error_symbol = '✖'
let g:ycm_clangd_args = ['-background-index',
  \ '-clang-tidy',
  \ '-completion-style=bundled',
  \ '-function-arg-placeholders',
  \ '-header-insertion=iwyu',
  \ '-header-insertion-decorators',
  \ '-enable-config',
  \ '-j=4',
  \ '-pch-storage=disk',
  \ '-background-index-priority=normal',
  \ '-compile-commands-dir=/home/olkozlo/Work/workspace/user-profile-manager/',
  \ '-enable-config',
  \]

let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

let g:bufferline_echo = 0

let c_no_curly_error = 1

let g:gitgutter_max_signs = 500

function! FormatCppOnSave()
    let l:formatdiff="all"
    py3f /usr/share/clang/clang-format.py
endfunction

autocmd BufWritePre *.c,*.h,*.cc,*.cpp,*.hpp,*.cppm call FormatCppOnSave()

set encoding=utf-8
set fileencoding=utf-8
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set cinoptions=(4,W4)
set pastetoggle=<F2>
set laststatus=2
set hidden
set fileformats=unix
set autowrite
set autoread
set nobackup
set noswapfile
set nowritebackup
set t_Co=256
set updatetime=100
set backspace=indent,eol,start
set clipboard^=unnamed,unnamedplus "needs: apt isntall xsel
set completeopt=longest,menuone
set cursorline
set diffopt+=vertical
set exrc secure
set foldenable
set foldlevelstart=10
set foldnestmax=10
set gdefault
set history=8192
set incsearch
set hlsearch
set lazyredraw
set list
set listchars=eol:¬,tab:▸\ ,trail:·,nbsp:⎵
set modelines=1
set noautochdir
set noerrorbells
set nospell
set nostartofline
set nowrap
set ruler
set scrolloff=8 sidescrolloff=15 sidescroll=1
set shortmess=I
set showcmd
set showmatch
set showmode
set smartcase
set splitright
set tags=./.tags;,.tags;./.git/.tags;,.git/.tags;
set textwidth=0 wrapmargin=0
set title
set ttimeout
set ttimeoutlen=1
set ttyfast
set wildmenu
set wildmode=list:longest,list:full
set undofile
set undodir=$HOME/.vim/undo
set number
set relativenumber
set scrolloff=20
set signcolumn=yes
set mouse=""
set timeoutlen=200

if &diff
    set diffopt-=internal
    set diffopt+=vertical
endif

nnoremap ; :
vnoremap ; :

nnoremap  <silent><leader>w :w!<CR>
nnoremap  <silent><leader>wa :wa!<CR>
nnoremap  <silent><leader>q :q!<CR>
nnoremap  <silent><leader>qa :qa!<CR>
nnoremap  <silent><leader>wq :wq!<CR>

inoremap <silent> <ESC>OA <Nop>
inoremap <silent> <ESC>OB <Nop>
inoremap <silent> <ESC>OC <Nop>
inoremap <silent> <ESC>OD <Nop>

nnoremap <silent> <C-]> :YcmCompleter GoTo<CR>

nnoremap <silent> <ESC> :noh<return><ESC>
inoremap <Esc> <Esc><Esc>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap < <><left>

"Shift + j adds a new line below
nnoremap <S-J> m`o<Esc>``

"Shift +k adds a new line above
nnoremap <S-K> m`O<Esc>`` "

let NERDTreeQuitOnOpen=1
nnoremap <C-n> :NERDTreeFocus<CR>

let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', 
            \ '__pycache__', '\.so$', '\.o$', '\.gcno$', '\.a$', 
            \ '\.out$', '\.make', '\.internal$', '\.includecache$',
            \ 'Makefile', 'CMakeCache.txt', 'CMakeDoxyfile.in', '.pymon', 'core', '.cache',
            \ 'compile_commands.json', 'build', 'build-coverity']

augroup ZCppModuleFileTypes
    autocmd!
    autocmd BufRead,BufNewFile *.cppm setlocal filetype=cpp
    autocmd BufRead,BufNewFile *.ixx setlocal filetype=cpp
    autocmd BufRead,BufNewFile *.mpp setlocal filetype=cpp
augroup end

autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
autocmd FileType markdown setlocal complete+=kspell
autocmd FileType gitcommit setlocal complete+=kspell
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=markdown textwidth=72

nnoremap <silent> <C-p> :GFiles<CR>
let g:fzf_vim = {}
let g:fzf_vim.preview_window = []
