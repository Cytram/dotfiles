""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins instalation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Locations for plugged instalation apps
let g:plugged_home = '~/.config/nvim/plugged'

if !filereadable(g:plugged_home)
  silent !curl --insecure -fLo '~/.local/share/nvim/site/autoload/plug.vim' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Plugins List
call plug#begin(g:plugged_home)
" UI related
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Better Visual Guide
Plug 'Yggdroot/indentLine'

" syntax check
Plug 'w0rp/ale'

"Terraform
Plug 'hashivim/vim-terraform'

" Better file browser
Plug 'scrooloose/nerdtree'

" Formater
Plug 'Chiel92/vim-autoformat'

" Nginx Config
Plug 'chr4/nginx.vim'

" Git diffs
Plug 'airblade/vim-gitgutter'

" Plug 'davidhalter/jedi-vim'

" Terraform
Plug 'hashivim/vim-terraform'

" Easy why to search for text
Plug 'easymotion/vim-easymotion'

" Easy handle of whitespaces
Plug 'ntpeters/vim-better-whitespace'

Plug 'junegunn/fzf'
" LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }


" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

call plug#end()

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configurations Part
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""
" LanguageClient
"""""""""""""""""""
let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
      \ 'tf': ['/usr/local/bin/terraform-lsp'],
      \ 'python': ['pyls'],
      \ 'go': ['gopls']
      \ }

" Run gofmt and goimports on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:LanguageClient_loggingLevel = 'DEBUG'
let g:LanguageClient_virtualTextPrefix = ''
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')

"""""""""""""""""""
" vim-easymotion
"""""""""""""""""""
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

" Run gofmt and goimports on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

let g:python3_host_prog="/usr/local/bin/python3"

" Temporary Files {{{
" Store temporarily files globally instead of in working directory
set backupdir=~/.config/nvim/backup
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif
set directory=~/.vim/tmp/swap
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif
if has('persistent_undo')
  set undodir=~/.config/nvim/undodir
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif
endif
" }}}
"

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set undofile                    " Persist undo tree across launches
set undolevels=1000             " Maximum number of changes that can be undone
set undoreload=10000            " Maximum number lines to save for undo on a buffer reload

" everything needs to be unicode. EVERYTHING
set encoding=utf-8

" always join with just one space, even between sentences
set nojoinspaces

" don't move the cursor to the start of the line when changing buffers
set nostartofline

" Yeah, we like
syntax on
syntax enable

" No folding
set nofoldenable

" lines, cols in status line
set ruler

" current mode in status line
set showmode

" set linenumber
set nu

" I want my splits done on the proper side
set splitbelow
set splitright

"no bells whatsoever
set vb t_vb=

set tabstop=2      " Set tabstop to tell vim how many columns a tab counts for
set shiftwidth=2   " set to the same as tabstop (see #4 in :help tabstop)
set softtabstop=2  " if it looks like a tab, we can delete it like a tab
set expandtab      " no tabs! spaces only..
set shiftround     " < and > will hit indentation levels instead of always -4/+4
set autoindent     " new line has indentation equal to previous line
set smartindent    " braces affect autoindentation
set copyindent     " copy indent from the previous line

let mapleader = ","

" EasyMotion setup
let g:EasyMotion_leader_key = '<Leader>'
hi link EasyMotionTarget Identifier
hi link EasyMotionTarget2First Identifier
hi link EasyMotionTarget2Second Identifier

let g:gitgutter_override_sign_column_highlight = 0

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

map <C-n> :NERDTreeToggle<CR>

" colorscheme
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard
set background=dark

" True Color Support if it's avaiable in terminal
if has("termguicolors")
  set termguicolors
endif
if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

set number
set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase

noremap <F3> :Autoformat<CR>

