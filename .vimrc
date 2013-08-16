" Set more advanced features and dont be compatible to vi
set nocompatible
set encoding=utf-8
set fileencoding=utf-8

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Load pathogen
"call pathogen#infect()

" Set prefered colourscheme
"colorscheme zenburn
set background=dark
colorscheme solarized

" Enable cursorline
set cursorline

" Switch on syntax highlighting
"let mysyntaxfile = "~/.vim/mysyntax/mysyntax.vim"
syntax on

set cindent
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set nohls
set hls
set wildmenu
set foldmethod=syntax

" Set the search to scan so that it ignores case when the search is all lower
" case but recognizes if it's specified
set ignorecase
set smartcase
set incsearch

" Make command line two lines high
"set ch=2

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
set cpoptions=ces$

" Set the status line the way i like it
set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]

" Tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Show the current command in the lower right corner
set showcmd

" Show the current mode
"set showmode
set noshowmode

" Keep some stuff in the history
set history=100

" Enable omnicompletion
filetype on
filetype plugin on
filetype indent on
set ofu=syntaxcomplete#Complete

" Enable automatic folding {{{
if has ('folding')
	set foldenable
	set foldmethod=marker
	set foldmarker={{{,}}}
	set foldcolumn=0
endif
"}}}

" Configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp

" Build tags of your own project with F12
"map <[24^> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
"map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" Automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

set directory=~/.vim/backup,/tmp
" Proper paste behaviour
" nnoremap <F2> :set invpaste paste?<CR>
" imap <F2> <C-O><F2>
set pastetoggle=<F2>

" Tell vim to remember certain things when we exit
" '10  : marks will be remembered for up to 10 previously edited files
" "100 : will save up to 100 lines for each register
" :20  : up to 20 lines for command-line history will be remembered
" %    : saves abd restores the buffer list
" n... : where to save the viminfo files
set viminfo='100,\"100,:20,%,n~/.viminfo

" When we reload, tell vim to restore the cursor to the saved position
augroup JumpCursorOnEdit
 au!
 autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif
 " Need to postpone using "zv" until after reading the modelines.
 autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif
augroup END

" LaTeX
"au FileType tex set ts=2
au FileType tex set noautoindent

" html
au FileType html set tabstop=4
au FileType html set shiftwidth=4
au FileType html set expandtab

" c/cpp
au FileType c set nu
au FileType cpp set nu
au FileType h set nu
au FileType hpp set nu

" vimwiki configuration
let wiki = {}
let wiki.path = '~/misc/vimwiki/'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp'}
let g:vimwiki_list = [wiki]

" immediately update statusline
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" powerline stuff
let g:Powerline_symbols = 'fancy'
if has('gui_running')
	set guifont=Inconsolata\ for\ Powerline\ Medium\ 12
endif
