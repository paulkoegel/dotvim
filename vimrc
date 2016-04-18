" Cheat Sheet
" ===========
" <A> Alt
" <S> Shift
" <C> Control
" <D> Command (or apple key on Macs)
" <M> Meta (Windows key)
"
" <CR> Carriage Return (Enter)
" <C-O> switch to normal mode for the following alias command
" <left>, <right>, <up>, <down> arrow keys

execute pathogen#infect()

runtime! plugin/sensible.vim " make sensible.vim overridable. Without this line, it'd be loaded AFTER .vimrc.

" GENERAL SETUP
" -------------
syntax on
filetype plugin indent on
set nocompatible

set mouse=a " fix mouse in command line vim: don't copy line numbers

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set encoding=utf-8
set enc=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,latin2,latin2
set backspace=indent,eol,start
set number
set smartindent
set linebreak
set ruler
set scrolloff=5

set wrap
set display=lastline " imagine you have a a single non-breaking line that spans several screens. as soon as wrapping is activated, vim will display '@' signs as placeholders for the wrapped lines when you scroll with the mousewheel. by setting this option, the actual content and not the '@' sign will be shown.

set timeoutlen=500              " if you have two commands, ',dv' and ',d' it will take 'timeoutlen' milliseconds to recognize which one you're going for

let mapleader = ","

nnoremap <leader><space> :noh<CR>

" buffer
nmap <leader>h :leftabove  vnew<CR>
nmap <leader>l :rightbelow vnew<CR>
nmap <leader>k :leftabove  new<CR>
nmap <leader>j :rightbelow new<CR>


" UI DESIGN
" =========

colorscheme molokai
set t_Co=256 " enable 256 colors in console vim - grey background, proper syntax highlighting etc.
set gfn=Ubuntu\ Mono:h16
set guioptions-=T "remove toolbar

" start fullscreen
set lines=999
set columns=999
" set colorcolumn=80 " highlight column 80 to allow manual wrapping of long
" lines


" SWAP FILES
" ==========
" put all temporary and swap files into a single folder; '//' makes sure swap
" filenames start with the files' full pathname, this prevents duplicate swap
" files for files with the same name in different locations
set backupdir=~/.vim_backups//
set directory=~/.vim_backups//


" KEYS
" ====
let mapleader = ","
nnoremap <leader><space> :noh<CR>

" SEARCH
" ------
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set hlsearch                    " highlight search terms
set incsearch                   " start highlighting (partial) matches as soon as you start typing letters after '/'

" search through files' contents
" Git-Grep.Vim
" nnoremap <leader>a :GitGrep 
nnoremap <leader>a :Ag 


" Custom Gimmicks
" ---------------
" shortcut for hash rocket
imap <C-q> <Space>=><Space>
imap <C-w> <C-O>i

" insert blank lines without leaving insert mode (cf. 12.15 here: http://vimdoc.sourceforge.net/htmldoc/vimfaq.html)
nmap <D-j> :put=''<CR>
nmap <D-k> :put!=''<CR>


" TABS
" ----
map <C-t><up> :tabr<CR>
map <C-t><down> :tabl<CR>
map <D-M-left> :tabp<CR>
map <D-M-right> :tabn<CR>
map <C-t><z> :tabnew<CR>
nmap <C-Delete> :tabclose<CR>

nmap <D-1> 1gt<CR>
nmap <D-2> 2gt<CR>
nmap <D-3> 3gt<CR>
nmap <D-4> 4gt<CR>
nmap <D-5> 5gt<CR>
nmap <D-6> 6gt<CR>
nmap <D-7> 7gt<CR>
nmap <D-8> 8gt<CR>
nmap <D-9> 9gt<CR>

" switch to normal mode when changing tabs
autocmd TabEnter * stopinsert

" USABILITY
" ---------
nnoremap <D-w> :q<CR>
nnoremap <D-e> :enew<CR>


" command alias for saving and opening files
:ca W w
:ca E e
:ca Cd cd
:ca CD cd

" move by display lines
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap <S-Down> vgj
nnoremap <S-Up> vgk
vnoremap <S-Down> gj
vnoremap <S-Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
inoremap <S-up> <C-o>vgk
inoremap <S-down> <C-o>vgj

" CTRL-A is Select all
noremap  <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

" SPLITS
" ======
" window
nmap <leader>H :topleft  vnew<CR>
nmap <leader>L :botright vnew<CR>
nmap <leader>K :topleft  new<CR>
nmap <leader>J :botright new<CR>

" window with test
nmap <leader>HH :topleft  vnew %:p<CR>:A<CR>
nmap <leader>LL :botright vnew %:p<CR>:A<CR>
nmap <leader>KK :topleft  new %:p<CR>:A<CR>
nmap <leader>JJ :botright new %:p<CR>:A<CR>

" buffer
nmap <leader>h :leftabove  vnew<CR>
nmap <leader>l :rightbelow vnew<CR>
nmap <leader>k :leftabove  new<CR>
nmap <leader>j :rightbelow new<CR>

" buffer with test
nmap <leader>hh :leftabove  vnew %:p<CR>:A<CR>
nmap <leader>ll :rightbelow vnew %:p<CR>:A<CR>
nmap <leader>kk :leftabove  new %:p<CR>:A<CR>
nmap <leader>jj :rightbelow new %:p<CR>:A<CR>


" CTRL/CMD movement (CONTROL, COMMAND)

" one word forward / back
nnoremap <A-left> b
nnoremap <A-right> w
inoremap <A-left> <C-O>b
inoremap <A-right> <C-O>w
vnoremap <A-left> b
vnoremap <A-right> w
snoremap <A-left> <C-O>b
snoremap <A-right> <C-O>w

nnoremap <S-A-left> vb
nnoremap <S-A-right> vw<S-left>
inoremap <S-A-left> <C-O>vb
inoremap <S-A-right> <C-O>vw<S-left>

" smart home key for indented lines: go to first non-blank character (not start of line) of display line (not numbered line)
nnoremap <D-left> g^
nnoremap <D-right> g$
inoremap <D-left> <C-O>g^
inoremap <D-right> <C-O>g$
"alternatively: vg^ to automatically enter visual mode first
nnoremap <S-D-left> vg^ <S-left>
nnoremap <S-D-right> vg$
inoremap <S-D-left> <C-O>vg^ <S-left>
inoremap <S-D-right> <C-O>vg$
" best solution I could find. adding shift to the shortcut ends visual mode =(
vnoremap <D-left> g^
vnoremap <D-right> g$

" start/end of file
vnoremap <D-up> 1G
vnoremap <D-down> Gg$


" File & Folder Shortcuts
" =======================

" VIMRC
nnoremap <silent> <leader>gV :tabnew $MYVIMRC<CR>
nnoremap <silent> <leader>gv :so $MYVIMRC<CR>

"nmap <silent> <leader>ev :e $MYVIMRC<CR>
"nmap <silent> <leader>sv :so $MYVIMRC<CR>

" map ,v and ,e to open files in the same directory as the current file
" source: destroy all software screencasts: vim file navigation
"cnoremap %% <C-R>=expand('%:h').'/'<CR>
cnoremap %% <C-R>=expand('%:h')<CR>
map <leader>e :edit %%
map <leader>v :view %%

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<CR>

"PLUGINS
"=======

" Ctrl P
" ---------
"  defaults to <leader> t
nmap <leader>t ::CtrlPClearCache<CR>\|:CtrlP<CR>
nmap <leader>T ::CtrlPClearCache<CR>\|:CtrlP<CR>

" When opening a file with CtrlP that is already opened, do not even jump to the buffer
" if it's opened in the current tab - this allows opening the same file in two
" buffers in the same tab
let g:ctrlp_switch_buffer = 0
" exclude files and folders from gitignore for CtrlP.
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" cf. https://github.com/wincent/Command-T, https://wincent.com/issues/1555, and https://wincent.com/issues/1542
set wildignore+=*.o,*.obj,.git ",*.jpg,*.gif,*.jpeg,*.png,*.ico
set wildignore+=**/vendor/plugins/**,**/vendor/gems/**,**/temp/**,**/tmp/**,**/vendor/rails/**,**/vendor/ruby/**,**/node_modules/**,**/dist/**,**/grunt_dev/**,**/grunt_prod/**,**/public/images/**


" NERDTree
" --------
let NERDTreeWinSize=30
let NERDTreeWinPos='right'
" let NERDTreeShowHidden = 1

" map <F7> to toggle NERDTree window
inoremap <silent> <F7> <C-O>:NERDTreeToggle<CR>
nnoremap <silent> <F7> :NERDTreeToggle<CR>


" NERDTreeToggle
" --------------
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_open_on_console_startup = 0
" Unfocus NERDTree when leaving a tab for descriptive tab names
let g:nerdtree_tabs_meaningful_tab_names = 1

" Close current tab if there is only one window in it and it's NERDTree
let g:nerdtree_tabs_autoclose = 1

" Synchronize view of all NERDTree windows (scroll and cursor position)
let g:nerdtree_tabs_synchronize_view = 1

" Commenter
" ---------
map <leader>c :TComment<CR>
map <leader>C :TCommentBlock<CR>

" Tabular
" -------
"if exists(":Tabularize")
"  nmap <leader>a= :Tabularize /=<CR>
"  vmap <leader>a= :Tabularize /=<CR>
"  nmap <leader>a: :Tabularize /:\zs<CR>
"  vmap <leader>a: :Tabularize /:\zs<CR>
"endif


" iAWriter mode, cf. http://laktek.com/2012/09/05/distraction-free-writing-with-vim
" =============

" Toggle spell-checking
" :map <F5> :setlocal spell! spelllang=en_GB<CR>

" turn-on distraction free writing mode for markdown files
" au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} call DistractionFreeWriting()

" nnoremap <leader>df :call DistractionFreeWriting()<CR>
" nnoremap <leader>DF :call NormalWriting()<CR>

"function! DistractionFreeWriting()
"	colorscheme iawriter
"	set background=light
"	"set gfn=Cousine:h14                                     " font to use
"	set gfn=Cousine:h22                                     " font to use
"	"set lines=40 columns=100  				" size of the editable area
"	set lines=40 columns=90  				" size of the editable area
"	set fuoptions=background:#00f5f6f6                      " background color
"	set guioptions-=r 					" remove right scrollbar
"	set laststatus=0 					" don't show status line
"	set noruler 						" don't show ruler
"  set fullscreen 						" go to fullscreen editing mode
"	set linebreak 						" break the lines on words
"endfunction

"function! NormalWriting()
"  colorscheme molokai
"  set gfn=Menlo:h14
"  set lines=999
"  set columns=999
"  set guioptions+=r
"  set laststatus=1
"  set ruler
"  set nofullscreen
"endfunction

" always enable Rainbow parantheses (https://github.com/kien/rainbow_parentheses.vim)
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" comand alias for Jacinto (JSON validation etc. - https://github.com/alfredodeza/jacinto.vim)
:ca JSON Jacinto
" example usage: `:JSON validate` (instead of `:Jacinto validate`)
"

" disable vim-markdown's folding:
let g:vim_markdown_folding_disabled=1


" hack - for some reason i need to reload these even after my vimrc has
" loaded in order for my command shortcuts to work -  really weird! reloading
" the entire .vimrc breaks Rails.vim syntax highlighting (e.g. 'render' is not green anymore)
" nnoremap <silent> <leader>gc :so ~/.vim/command_shortcuts.vim<CR>

" nnoremap <A-left> b
" nnoremap <A-right> w
" inoremap <A-left> <C-O>b
" inoremap <A-right> <C-O>w
" vnoremap <A-left> b
" vnoremap <A-right> w
" snoremap <A-left> <C-O>b
" snoremap <A-right> <C-O>w
" nnoremap <S-A-left> vb
" nnoremap <S-A-right> vw<S-left>
" inoremap <S-A-left> <C-O>vb
" inoremap <S-A-right> <C-O>vw<S-left>

nnoremap <D-left> g^
nnoremap <D-right> g$
" inoremap <D-left> <C-O>g^
" inoremap <D-right> <C-O>g$
" nnoremap <S-D-left> vg^ <S-left>
" nnoremap <S-D-right> vg$
" inoremap <S-D-left> <C-O>vg^ <S-left>
" inoremap <S-D-right> <C-O>vg$
" vnoremap <D-left> g^
" vnoremap <D-right> g$

" https://github.com/mxw/vim-jsx#usage
let g:jsx_ext_required = 0

" ES6 file type support
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
