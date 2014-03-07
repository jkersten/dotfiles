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

noremap <C-h> :noh<cr>
inoremap jj <ESC>

" RSpec.vim mappings
map <Leader>bi :! bundle install && rbenv rehash<CR>
map <Leader>bu :! bundle update && rbenv rehash<CR>
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>m :!<SPACE>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>r :!rspec spec<CR>
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
map <Leader>nm :set relativenumber!<CR>

map <Leader>ec :Econtroller<SPACE>
map <Leader>ee :Eenvironment<SPACE>
map <Leader>ef :Efixture<SPACE>
map <Leader>eh :Ehelper<SPACE>
map <Leader>ei :Einitializer<SPACE>
map <Leader>ejs :Ejavascript<SPACE>
map <Leader>ela :Elayout<SPACE>
map <Leader>el :Elocale<SPACE>
map <Leader>ema :Emailer<SPACE>
map <Leader>emi :Emigration<SPACE>
map <Leader>em :Emodel<SPACE>
map <Leader>es :Espec<SPACE>
map <Leader>ess :Estylesheet<SPACE>
map <Leader>et :Etask<SPACE>
map <Leader>eu :Eunittest<SPACE>
map <Leader>ev :Eview<SPACE>
map <Leader>ed :find

map <Leader>sc :Scontroller<SPACE>
map <Leader>se :Senvironment<SPACE>
map <Leader>sf :Sfixture<SPACE>
map <Leader>sh :Shelper<SPACE>
map <Leader>si :Sinitializer<SPACE>
map <Leader>sjs :Sjavascript<SPACE>
map <Leader>sla :Slayout<SPACE>
map <Leader>sl :Slocale<SPACE>
map <Leader>sma :Smailer<SPACE>
map <Leader>smi :Smigration<SPACE>
map <Leader>sm :Smodel<SPACE>
map <Leader>ss :Sspec<SPACE>
map <Leader>sss :Sstylesheet<SPACE>
map <Leader>st :Stask<SPACE>
map <Leader>su :Sunittest<SPACE>
map <Leader>sv :Sview<SPACE>

map <Leader>vc :Vcontroller<SPACE>
map <Leader>ve :Venvironment<SPACE>
map <Leader>vf :Vfixture<SPACE>
map <Leader>vh :Vhelper<SPACE>
map <Leader>vi :Vinitializer<SPACE>
map <Leader>vjs :Vjavascript<SPACE>
map <Leader>vla :Vlayout<SPACE>
map <Leader>vl :Vlocale<SPACE>
map <Leader>vma :Vmailer<SPACE>
map <Leader>vmi :Vmigration<SPACE>
map <Leader>vm :Vmodel<SPACE>
map <Leader>vs :Vspec<SPACE>
map <Leader>vss :Vstylesheet<SPACE>
map <Leader>vt :Vtask<SPACE>
map <Leader>vu :Vunittest<SPACE>
map <Leader>vv :Vview<SPACE>

map <Leader>tc :Tcontroller<SPACE>
map <Leader>te :Tenvironment<SPACE>
map <Leader>tf :Tfixture<SPACE>
map <Leader>th :Thelper<SPACE>
map <Leader>ti :Tinitializer<SPACE>
map <Leader>tjs :Tjavascript<SPACE>
map <Leader>tla :Tlayout<SPACE>
map <Leader>tl :Tlocale<SPACE>
map <Leader>tma :Tmailer<SPACE>
map <Leader>tmi :Tmigration<SPACE>
map <Leader>tm :Tmodel<SPACE>
map <Leader>ts :Tspec<SPACE>
map <Leader>tss :Tstylesheet<SPACE>
map <Leader>tt :Ttask<SPACE>
map <Leader>tu :Tunittest<SPACE>
map <Leader>tv :Tview<SPACE>

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
