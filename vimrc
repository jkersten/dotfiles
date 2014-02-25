set nocompatible
filetype off
runtime macros/matchit.vim

" Vundle config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'bling/vim-airline'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-rails'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'wincent/Command-T'
Bundle 'altercation/vim-colors-solarized'
Bundle 'w0ng/vim-hybrid'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rbenv'
Bundle 'airblade/vim-gitgutter'
Bundle 'basepi/vim-conque'
Bundle 'skwp/vim-ruby-conque'
Bundle 'kien/ctrlp.vim'
Bundle 'slim-template/vim-slim'
Bundle 'rking/ag.vim'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'thoughtbot/vim-rspec'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" File types
filetype plugin indent on
syntax enable

" File encoding
set fileencoding=utf-8
set encoding=utf-8

" White space
set autoindent
set smartindent
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:⋅
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
"set term=screen-256color
set visualbell
set mouse=a
"set t_Co=256

" Current line
set relativenumber
set cursorline

set nrformats=octal

" mapping
set timeout
set timeoutlen=1000
set ttimeoutlen=100

" Theme
"let g:solarized_termcolors=256
"let g:hybrid_use_Xresources = 1
"set background=light
set background=dark
set laststatus=2
colorscheme solarized
"colorscheme hybrid

" Buffer options
set hidden

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
augroup END

" Status line
set showcmd
let g:airline_powerline_fonts = 1
highlight SignColumn ctermbg=black

" Keyboard mappings
let mapleader = ","
nnoremap \ ,
nnoremap ; :
nnoremap <leader><space> :noh<cr>
nnoremap Y y$
nnoremap & :&&<cr>
"nnoremap : ;
nnoremap <C-s-p> :RelatedSpecVOpen<cr>
nnoremap j gj
nnoremap k gk
nnoremap 0 g0
nnoremap ^ g^
nnoremap $ g$
nnoremap <tab> >>
nnoremap <s-tab> <<
vnoremap <tab> >>
vnoremap <s-tab> <<

cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Tabe tabe
cnoreabbrev wrap set wrap
cnoreabbrev nowrap set nowrap

noremap <left> <nop>
noremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>

map <C-h> :noh<cr>
imap <C-l> :<Space>
map <C-s> <esc>:w<cr>
imap <C-s> <esc>:w<cr>
map <C-t> <esc>:tabnew<cr>
map <C-n> :cn<cr>
map <C-p> :cp<cr>



" RSpec.vim mappings
let g:rspec_command = "!spring rspec {spec}"
map <Leader>bi :! bundle install && rbenv rehash<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>r :!spring rspec spec<CR>
"map <Leader>s :RelatedSpecVOpen<CR>
map <Leader>h <c-p>
map <Leader>at :AT<CR>
map <Leader>re :RT<CR>
map <Leader>i mmgg=G`m<CR>
map <Leader>p :set paste<CR>o<ESC>"*]:set notpaste<CR> 
map <Leader>gac :Gcommit -m -a ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
map <Leader>gs :Gstatus<CR>
map <Leader>gw :! git add . && git commit -m "WIP"<CR>
map <Leader>vi :tabe ~/.vimrc<CR>

" CtrlP
set wildignore+=*/tmp/*,*/log/*,*/bin/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

function! InsertTabWrapper()
  let col = col(".") - 1
  if !col || getline(".")[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-n>"
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>
