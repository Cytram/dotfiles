" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'iCyMind/NeoSolarized'

Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'

Plug 'roxma/nvim-yarp'

Plug 'godlygeek/tabular'
Plug 'ntpeters/vim-better-whitespace'


" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:python3_host_prog="/usr/bin/python3"

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
syntax enable

" No folding
set nofoldenable

" lines, cols in status line
set ruler

" current mode in status line
set showmode

" set linenumber
set nu

"clipboard
set clipboard+=unnamedplus

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

" Colors
set termguicolors
set background=dark
"set background=light
"colorscheme NeoSolarized

let g:gitgutter_override_sign_column_highlight = 0

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

map <C-n> :NERDTreeToggle<CR>

"" Terraform
"if executable('terraform-ls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'terraform-ls',
"        \ 'cmd': {server_info->['terraform-ls', 'serve']},
"        \ 'whitelist': ['terraform'],
"        \ })
"  endif
"


"" GoLang
filetype plugin indent on
au filetype go inoremap <buffer> . .<C-x><C-o>

set autowrite

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

