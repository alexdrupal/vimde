set nocompatible

" set t_Co=256

"
"-------------------------
" Plugins
"-------------------------
"
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'amiorin/vim-project'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
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
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'shawncplus/phpcomplete.vim'
Plug 'Rican7/php-doc-modded'
Plug 'ap/vim-css-color'

call plug#end()

"
"-------------------------
" Settings
"-------------------------
"

"Show cursor position everytime
set ruler		

" Change cursor type (works in Konsole)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7" 

" Enable syntax highlight
syntax on

if (has("termguicolors"))
 set termguicolors
endif

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

" allow to use backspace instead of x
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Expand tabs as spaces
set expandtab

" Set tab width as 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Set format for status line
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P 
set laststatus=2

if has('gui_running')
    set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:.
else
    set listchars=tab:>.,trail:.,extends:\#,nbsp:.
endif

" Enable smart indent
set smartindent

" Fix <Enter> for comment
set fo+=cr

" Set session options
set sessionoptions=curdir,buffers,tabpages

set complete=""

" Set complete from current buffer
set complete+=.
set complete+=k

" Set complete from other open buffers
set complete+=b

" Set complete from tags
set complete+=t

" Complete options
set completeopt+=longest

" Enable filetype plugin
filetype plugin on
au BufRead,BufNewFile *.phps set filetype=php
au BufRead,BufNewFile *.phtml set filetype=php
" au FileType php set omnifunc=phpcomplete#CompletePHP

" SessionMgr settings
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

"
"-------------------------
" Projects settings
"-------------------------
"
" set root folder for projects to $HOME/www
call project#rc("~/www")

" Load project list from .vimprojects
source ~/.vimprojects

function! VimDeInitializeProject(...) abort
endfunction

function! VimDeInitializeDrupalProject(...) abort
endfunction

"
"-------------------------
" Netrw
"-------------------------
"
let g:netrw_browse_split = 3

"
"-------------------------
" Ultisnips
"-------------------------
"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"
"-------------------------
" Ale settings
"-------------------------
"

let g:ale_loclist_msg_format='%linter% | %s'
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign WarningMsg
highlight link ALEErrorSign Error

let g:ale_linters_explicit = 1
let g:ale_history_log_output = 1
let g:ale_linters = {
    \ 'php': ['php', 'phpstan', 'phpcs'],
\}

" Set the default code style to Symfony
let g:ale_php_phpcs_standard = 'Symfony'

let g:tagbar_type_php  = {
  \ 'ctagstype' : 'php',
  \ 'kinds'     : [
      \ 'i:interfaces',
      \ 'c:classes',
      \ 'f:functions'
    \ ]
\ }

"
"-------------------------
" Light line
"-------------------------
"
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
      \   'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding', 'filetype'], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]],
    \ },
    \ 'component_function': {
      \   'gitbranch': 'VimDEBranch',
    \ },
    \ 'component_expand': {
        \  'linter_checking': 'lightline#ale#checking',
        \  'linter_warnings': 'lightline#ale#warnings',
        \  'linter_errors': 'lightline#ale#errors',
        \  'linter_ok': 'lightline#ale#ok',
    \ },
    \ 'component_type': {
        \  'linter_checking': 'left',
        \  'linter_warnings': 'warning',
        \  'linter_errors': 'error',
        \  'linter_ok': 'left',
    \ },
\ }

function! VimDEBranch()
    if exists('*fugitive#head')
        let branch = fugitive#head()
            return branch !=# '' ? 'Git branch: '.branch : ''
        endif
    return ''
endfunction

"
"-------------------------
" Drupal
"-------------------------
"
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

"
"-------------------------
" Gutentags
"-------------------------
"
let g:gutentags_ctags_extra_args=["--PHP-kinds=+cdfint-av"]

let g:gutentags_ctags_exclude = ['*.css', '*.html', '*.js', '*.json', '*.xml',
                            \ '*.phar', '*.ini', '*.rst', '*.md',
                            \ '*vendor/*/test*', '*vendor/*/Test*',
                            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
                            \ '*var/cache*', '*var/log*']

"
"-------------------------
" Ack
"-------------------------
"
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

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
nmap <F5> <Esc>:Buffers<cr>
vmap <F5> <esc>:Buffers<cr>
imap <F5> <esc><esc>:Buffers<cr>

" F7 - NERDTree
nmap <silent> <F7> :NERDTreeToggle<CR>
vmap <silent> <F7> <esc>:NERDTreeToggle<CR>i
imap <silent> <F7> <esc>:NERDTreeToggle<CR>i

" F8 - marks browser
map <F8> :Files<cr>
vmap <F8> <esc>:Files<cr>
imap <F8> <esc>:Files<cr>

" F9 - make command
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" F10 - buffer delete
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F11 - show tagbar window
map <F11> :TagbarToggle<cr>
vmap <F11> <esc>:TagbarToggle<cr>
imap <F11> <esc>:TagbarToggle<cr>

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


" phpDocumentor
"

let g:pdv_cfg_annotation_Package = 0
imap <C-P> <ESC>:call PhpDocSingle()<CR>i
nmap <C-P> :call PhpDocSingle()<CR>
vmap <C-P> :call PhpDocRange()<CR> 

source ~/.vimrc.local
