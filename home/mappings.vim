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

inoremap jj <ESC>

" RSpec.vim mappings
map <Leader>bi :! bundle install && rbenv rehash<CR>
map <Leader>bu :! bundle update && rbenv rehash<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>m :!<SPACE>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>r :!spring rspec spec<CR>
map <Leader>s :RelatedSpecVOpen<CR>
map <Leader>h <c-p>
map <Leader>at :AT<CR>
map <Leader>re :RT<CR>
map <Leader>i mmgg=G`m<CR>
map <Leader>li :set list!<CR>
map <Leader>p :set paste<CR>o<ESC>"*]:set notpaste<CR> 
map <Leader>gaa :! git add .<LEFT>
map <Leader>gac :! git commit -m -a ""<LEFT>
map <Leader>gc :! git commit -m ""<LEFT>
map <Leader>gd :! git diff<CR> 
map <Leader>gdf :! git diff 
map <Leader>gs :! git status<CR>
map <Leader>gw :! git add . && git commit -m "WIP"<CR>
map <Leader>gp :! git push<CR>
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>vib :tabe ~/bundles.vim<CR>
map <Leader>vim :tabe ~/mappings.vim<CR>


function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>mv :call RenameFile()<cr>
