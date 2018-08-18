set nocompatible

set t_Co=256

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'amiorin/vim-project'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'StanAngeloff/php.vim'
Plug 'mileszs/ack.vim'
Plug 'skwp/greplace.vim'
Plug 'airblade/vim-gitgutter'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

"Show cursor position everytime
set ruler		

" Change cursor type (works in Konsole)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7" 

" Set the color scheme
colorscheme onedark

" Set font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Droid\ Sans\ Mono\ 13
  endif
endif

" Show commands in status bar
set showcmd		

" Remove wrapping
set nowrap

" Enable line numbers
set nu

" Set folding method
set foldmethod=indent

" Search during type
set incsearch

" Switch off search results highlight
set hlsearch
set cursorline

set scrolljump=7
set scrolloff=7

" Disable bell
set novisualbell
set t_vb= 

" Enable Mouse
set mouse=a
set mousemodel=popup

" Set default encoding to UTF-8
set termencoding=utf-8

" Allows to edit several buffers at a time without having to save it before switching to another buffer
set hidden

" Hide panel. In GUI version we don't need it
set guioptions-=T

" Set commandline height
set ch=1

" Hide mouse when typing
set mousehide


" Enable autoindent
set autoindent

if has("autocmd")
    "Drupal *.module and *.install files.
    augroup module
        autocmd BufRead,BufNewFile *.module set filetype=php
        autocmd BufRead,BufNewFile *.install set filetype=php
        autocmd BufRead,BufNewFile *.inc set filetype=php
	autocmd BufRead,BufNewFile *.engine set filetype=php
	autocmd BufRead,BufNewFile *.theme set filetype=php
	autocmd BufRead,BufNewFile *.profile set filetype=php
	autocmd BufRead,BufNewFile *.test set filetype=php
    augroup END
    augroup inf
        autocmd BufRead,BufNewFile *.info set filetype=txt
    augroup END
endif

iabbr Hook <C-R>=HookFunc()<CR>

" HookFunc(): Drupal helper function
function! HookFunc()
  let f = substitute(expand("%:t"), ".module", "", "g")
  return "function " . f . "_"
endfunction

" Enable syntax highlight
syntax on

" allow to use backspace instead of x
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Expand tabs as spaces
set expandtab

" Set tab width as 2 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Set format for status line
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2


" Enable smart indent
set smartindent

"
" Fix <Enter> for comment
set fo+=cr

" Set session options
set sessionoptions=curdir,buffers,tabpages

"
"-------------------------
" Hotkeys
"-------------------------
"

" Space list pages when in normal mode
nmap <Space> <PageDown>

" CTRL-F for omni completion
imap <C-F> <C-X><C-O>

" C-c and C-v - Copy/Paste to the global Clipboard
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Force shift-insert to work as in Xterm
map <S-Insert> <MiddleMouse>

" C-y - Delete current line
nmap <C-y> dd
imap <C-y> <esc>ddi

" C-d - Duplicate current line
imap <C-d> <esc>yypi

" F2 - quick save
nnoremap <F2> :w<cr>
vmap <F2> <esc>:w<cr>i
imap <F2> <esc>:w<cr>i

" F3 - show errors
nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

" F5 - show buffers
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F7 - NERDTree
nmap <silent> <F7> :NERDTreeToggle<CR>
vmap <silent> <F7> <esc>:NERDTreeToggle<CR>i
imap <silent> <F7> <esc>:NERDTreeToggle<CR>i

" F8 - marks browser
map <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

" F9 - make command
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" F10 - buffer delete
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F11 - show taglist window
map <F11> :TlistToggle<cr>
vmap <F11> <esc>:TlistToggle<cr>
imap <F11> <esc>:TlistToggle<cr>

" F12 - show netrw
map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>

" < & > - indents blocks
vmap < <gv
vmap > >gv

" Disable replace mode
imap >Ins> <Esc>i


" Add ] for [
imap [ []<LEFT>

" Same for {
imap {<CR> {<CR>}<Esc>O

" Same for (
imap (<CR> (<CR>)<Esc>O

" С-q - quite Vim 
map <C-Q> <Esc>:qa<cr>

" C-T - next buffer
map <C-tab> <Esc>:bnext<cr>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set complete=""

" Set complete from current buffer
set complete+=.
set complete+=k

" Set complete from other open buffers
set complete+=b

" Set complete from tags
set complete+=t

" Enable filetype plugin
filetype plugin on
au BufRead,BufNewFile *.phps set filetype=php
au BufRead,BufNewFile *.phtml set filetype=php
au FileType php set omnifunc=phpcomplete#CompletePHP

" SessionMgr settings
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

" Taglist settings
let g:Tlist_Show_One_File = 1
let g:Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = "name"
let Tlist_WinWidth = 50

" Complete options
set completeopt-=preview
set completeopt+=longest
set mps-=[:]

" Netrw settings
let g:netrw_browse_split = 3

" phpDocumentor
" 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 

call project#rc("~/www")
source ~/.vimprojects

let g:gutentags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']
let g:gutentags_cache_dir = '~/.vim/gutentags'

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
