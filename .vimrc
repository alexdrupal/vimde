set nocompatible

"
"-------------------------
" Plugins
"-------------------------
"

call plug#begin('~/.vim/plugged')

" IDE like stuff 
Plug 'amiorin/vim-project' " The main plugin for VIMDe
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'majutsushi/tagbar'
Plug 'ludovicchabant/vim-gutentags'

" Snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sniphpets/sniphpets'
Plug 'sniphpets/sniphpets-symfony'

" Colors
Plug 'joshdick/onedark.vim'
Plug 'alexdrupal/vim-darcula-colors'
Plug 'arzg/vim-colors-xcode'
Plug 'chiendo97/intellij.vim'
Plug 'vim-scripts/kate.vim'
Plug 'vim-scripts/SyntaxAttr.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'
Plug 'shumphrey/fugitive-gitlab.vim'

" Search
Plug 'skwp/greplace.vim'
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Utils
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'ap/vim-buftabline'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/echodoc.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'

" HTML, CSS
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

" Javascript
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim'

" PHP
Plug 'StanAngeloff/php.vim'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'qbbr/vim-symfony'
Plug 'Rican7/php-doc-modded'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Autocomplete
Plug 'Shougo/deoplete.nvim', {'commit': '7535773f9dba82bd8077a2319b7aa8b275dde25a'}
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'kristijanhusak/deoplete-phpactor'

" Python
Plug 'deoplete-plugins/deoplete-jedi'

" Syntax check (ALE)
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'

Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

call plug#end()

"
"-------------------------
" Functions
"-------------------------
"
"

" TODO: pull logic from phpcomplete to get real function name
" function MagentoTagFunc()
"    echom "Hello from Magento Tags"
"    let current_term = expand('<cword>')
"    echom current_term
"    execute "tag " . current_term
" endfunction
" map <C-]> :call MagentoTagFunc()<CR>

function! VimDeInitializeComposerProject(...) abort
    " TODO Add specific settings for composer based projects OR remove
endfunction

function! VimDeInitializeGitlabProject(...) abort
    let g:fugitive_gitlab_domains = {'git@gitrepo.superiorcommunications.com': 'https://gitrepo.superiorcommunications.com'}
endfunction

function! VimDeInitializeDrupalProject(...) abort
    set tabstop=2
    set shiftwidth=2
endfunction

function! VimDeInitializePimcoreProject(...) abort
    " TODO Add specific settings for pimcore projects OR remove
endfunction

function! VimDeInitializeMagento1Project(...) abort
endfunction

function! VimDeInitializeJavascriptProject(...) abort
endfunction

function! VimDeInitializeMagento2Project(...) abort
    " Set to Magento2 coding standard
    let g:ale_php_phpcs_standard = expand('~/.config/composer/vendor/magento/magento-coding-standard/Magento2/ruleset.xml')
    let g:ale_php_phpcbf_standard = expand('~/.config/composer/vendor/magento/magento-coding-standard/Magento2/ruleset.xml')
endfunction

function! VimDEBranch()
    if exists('*fugitive#head')
        let branch = fugitive#head()
            return branch !=# '' ? 'Git branch: '.branch : ''
        endif
    return ''
endfunction

"
"-------------------------
" Settings
"-------------------------
"

"Show cursor position everytime
set ruler
set relativenumber

" Display vertical line at 80 column
set colorcolumn=120
 
" Change cursor type (works in Konsole and GVIM)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7" 

" Enable syntax highlight
syntax on

if (has("termguicolors"))
 set termguicolors
endif


" Set font
set guifont=Monospace\ 12
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 12
  endif
endif

" Set the color scheme
set background=dark
colorscheme darcula

" Show commands in status bar
set showcmd		

" Remove wrapping
set nowrap

" Enable line numbers
set nu

" Set folding method
set nofoldenable
set foldmethod=indent
set splitbelow

" Search during type
set incsearch

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
set completeopt+=preview

" Enable filetype plugin
filetype plugin on


" SessionMgr settings
let g:SessionMgr_AutoManage = 0
let g:SessionMgr_DefaultName = "mysession"

" Notes
let g:notes_directories = ['~/Documents/Notes']

"-------------------------
" Projects settings
"-------------------------
"

" set root folder for projects to $HOME/www
call project#rc("~/www")

" Load project list from .vimprojects
if filereadable($HOME . "/.vimprojects")
    source $HOME/.vimprojects
endif

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

"
"-------------------------
" NERDTree
"-------------------------
"

let NERDTreeShowHidden=1

"
"-------------------------
" Tagbar
"-------------------------
"

let g:tagbar_type_php = {
    \ 'kinds' : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constant definitions',
        \ 'f:functions',
    \ ],
\ }

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
let g:ale_enabled = 1
let g:ale_loclist_msg_format='%linter% | %s'
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign WarningMsg
highlight link ALEErrorSign Error

let g:ale_linters_explicit = 1
let g:ale_history_log_output = 1
let g:ale_php_phpstan_level = 8

let g:ale_linters = {
\  'php': ['php', 'phpcs', 'phpstan'],
\  'javascript': ['eslint']
\}
let g:ale_fixers = {
\  'php': ['phpcbf'],
\  'javascript': ['eslint']
\}

"
"-------------------------
" Ack
"-------------------------
"

if executable('ag')
  let g:ackprg = 'ag --vimgrep --hidden '
endif

set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

"
"-------------------------
" FZF
"-------------------------
"

command! -bang -nargs=? -complete=dir HFiles
  \ call fzf#vim#files(<q-args>, {'source': 'ag --hidden --ignore .git -g ""'}, <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   <q-args>,
  \   '--hidden --ignore=*.sql --ignore=.git --color-path 41 --color-match "1;35" --color-line-number 32',
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0
  \ )

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"
"-------------------------
" Tern for vim
"-------------------------
"

let g:tern#command = ["/home/work/.npm-global/bin/tern"]
let g:tern#arguments = ["--persistent"]
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 1
autocmd FileType javascript setlocal omnifunc=tern#Complete

"
"-------------------------
" Deoplete
"-------------------------
"

let g:deoplete#enable_at_startup = 1
"let g:deoplete#auto_complete_delay=150

" let g:deoplete#sources = {}
" let g:deoplete#sources._=['omni', 'buffer', 'member', 'tag', 'ultisnips', 'file']
" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#functions.php = [ 'phpactor#Complete' ]
let g:deoplete#omni_patterns = get(g:,'deoplete#omni_patterns',{})
call deoplete#custom#var('omni', 'input_patterns', {
	\ 'javascript': '[^. *\t]\.\w*',
	\ })
"
" if !exists('g:deoplete#omni#input_patterns')
"   let g:deoplete#omni#input_patterns = {}
" endif
call deoplete#custom#source('_', 'max_menu_width', 150)
let g:deoplete#sources#jedi#show_docstring = 1
"
"-------------------------
" Echodoc
"-------------------------
"

set cmdheight=2
let g:echodoc_enable_at_startup = 1
set noshowmode
let g:echodoc#type = 'popup'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"
"-------------------------
" PHP 
"-------------------------
"

au BufRead,BufNewFile *.phps set filetype=php
au BufRead,BufNewFile *.phtml set filetype=php
autocmd FileType php setlocal omnifunc=phpactor#Complete
autocmd FileType php nmap <C-]> :PhpactorGotoDefinition<CR>

ab xclass <C-R>=expand('%:t:r')<CR>

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

" Show syntax highlighting groups for word under cursor
nmap <leader>z :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"
"-------------------------
" Hotkeys
"-------------------------
"

let mapleader = ';'

imap kj <esc>

map <leader>ps :e ~/.vimprojects<CR>

" Space list pages when in normal mode
nmap <Space> <PageDown>

" CTRL-F for omni completion
imap <C-F> <C-X><C-O>

" C-c and C-v - Copy/Paste to the global Clipboard
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Force shift-insert to work as in Xterm
map <S-Insert> <MiddleMouse>

" C-d - Duplicate current line
imap <C-d> <esc>yypi

" w;  - quick save
nnoremap <leader>w :w<cr>
vmap <leader>w <esc>:w<cr>i
imap <leader>w <esc>:w<cr>i

" F3 - show errors
nmap <F3> :copen<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

" F5 - show buffers
nmap <F5> <Esc>:Buffers<cr>
vmap <F5> <esc>:Buffers<cr>
imap <F5> <esc><esc>:Buffers<cr>

" F7 - NERDTree
nmap <silent> <leader>m :NERDTreeToggle<CR>
vmap <silent> <leader>m <esc>:NERDTreeToggle<CR>i
imap <silent> <leader>m <esc>:NERDTreeToggle<CR>i

" F10 - buffer delete
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F11 - show tagbar window
map <leader>t :TagbarToggle<cr>
vmap <leader>t <esc>:TagbarToggle<cr>
imap <leader>t <esc>:TagbarToggle<cr>

" < & > - indents blocks
vmap <s-tab> <gv
vmap <tab> >gv

" Disable replace mode
imap >Ins> <Esc>i

" С-q - quite Vim 
map <C-Q> <Esc>:qa<cr>

" C-T - next buffer
map <C-tab> <Esc>:bnext<cr>

" Show highlight group for character under cursor
map <leader>a :call SyntaxAttr()<CR>

" highlight word under cursor
map <leader>h :match StatusLineTerm /<C-R><C-W>/<CR>

" Close current buffer
map <leader>c :bd<cr>

" Open FZF file search dialog
map <leader>fo :HFiles<cr>

" Open FZF :Ag search
map <leader>f :Ag

" Fix formatting using ALE for current buffer
map <leader>ff :ALEFix<cr>

" Terminate current string with ; in normal mode (PHP)
imap ;; <esc>A;<esc>
nmap <leader>; A;<esc>

" phpDocumentor
let g:pdv_cfg_annotation_Package = 0
imap <A-P> <ESC>:call PhpDocSingle()<CR>i
nmap <A-P> :call PhpDocSingle()<CR>
vmap <A-P> :call PhpDocRange()<CR> 

" Git
nmap <leader>gs :15G<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gb :GBranches<CR>
nmap <leader>gp :Git pull<CR>

" Open .vimrc
nmap <leader>e :e ~/.vimrc<CR>

if filereadable($HOME . "/.vimrc.local")
    source $HOME/.vimrc.local
endif
