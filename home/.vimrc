set nocompatible
filetype off

runtime macros/matchit.vim

if filereadable(expand("~/bundles.vim"))
  source ~/bundles.vim
endif

" File types
filetype plugin indent on
syntax enable

if has('clipboard')
  if has('unnamedplus')
    set clipboard=unnamedplus
  else
    set clipboard=unnamed
  endif
endif

set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set hidden

set directory=$HOME/.vim/.tmp/swp//,/var/tmp//,/tmp//
set backupdir=./.backup//,$HOME/.vim/.tmp/backup//,/var/tmp//,/tmp//
set backup

if has('persistent_undo')
  set undodir=$HOME/.vim/.tmp/undo//,/var/tmp//,/tmp//
  set undofile
  set undolevels=1000
  set undoreload=10000
endif

set shortmess+=I
set tabpagemax=15
set showmode
set cursorline

set scrolljump=5
set scrolloff=3

set splitright
set splitbelow

" File encoding
set fileencoding=utf-8
scriptencoding=utf-8
set encoding=utf-8

" White space
set autoindent
set smartindent
set cindent
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:⋅     " Show whitespace characters
set shiftround

" Wrapping
set wrap
set linebreak
set showbreak=>\ 

" Search
set hlsearch
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch

" Minimum window sizes
set winheight=999
set winheight=5
set winminheight=5
set winwidth=84
set colorcolumn=110

" Shell
"set noswapfile
set shell=/bin/zsh
set visualbell
set mouse=a
set mousehide

" Current line
"set relativenumber
set number

set nrformats=octal

" mapping
set timeout
set timeoutlen=1000
set ttimeoutlen=100


" Status line
set showcmd
set history=5000
let g:airline_powerline_fonts = 1

" Keyboard mappings
let mapleader = ","
let g:rspec_command = 'call Send_to_Tmux("time spring rspec {spec}\n")'

" CtrlP
set wildignore+=*/tmp/*,*/log/*,*/bin/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Auto commands
autocmd BufRead,BufNewFile *.ru set filetype=ruby
autocmd BufRead,BufNewFile [vV]agrantfile set filetype=ruby
autocmd BufRead,BufNewFile Guardfile set filetype=ruby
autocmd BufRead,BufNewFile Procfile set filetype=ruby
autocmd BufRead,BufNewfile Gemfile set filetype=ruby
autocmd Bufread,BufNewFile *.feature set filetype=cucumber
autocmd BufRead,BufNewFile *.md set filetype=markdown textwidth=79
autocmd BufRead,BufNewFile *.markdown set textwidth=79
autocmd BufWritePre *.(rb|erb|js|coffee|slim|haml) :%s/\s\+$//e
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Generate CTags on file save
autocmd BufWritePost *
  \ if exists('b:git_dir') && executable(b:git_dir.'/hooks/ctags') |
  \   call system('"'.b:git_dir.'/hooks/ctags" &') |
  \ endif

augroup vimscript
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd BufWritePost ~/bundles.vim source $MYVIMRC
  autocmd BufWritePost ~/mappings.vim source $MYVIMRC
augroup END

augroup rubypath
  autocmd!
  autocmd FileType ruby setlocal suffixesadd+=.rb
augroup END

" Theme
set background=dark
set laststatus=2
colorscheme solarized
highlight SignColumn ctermbg=black

source ~/mappings.vim
