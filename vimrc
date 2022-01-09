set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'scrooloose/nerdtree'
Plugin 'junegunn/fzf.vim', {'rtp': 'plugin'}
Plugin 'xolox/vim-misc'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim' 
Plugin 'xmledit'
Plugin 'qpkorr/vim-bufkill'
Plugin 'tComment'
Plugin 'vim-showmarks'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"source $VIMRUNTIME/defaults.vim

" Stores backup files in certain directories, not in current directory
set backupdir=~/.vim/backup/,/tmp//
set directory=~/.vim/swp/,/tmp//
set undodir=~/.vim/undo/,/tmp//

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on
  " set smartindent	" Enable smart-indent

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
" if has('syntax') && has('eval')
"   packadd! matchit
" endif

"General
set number	" Show line numbers
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab
set smarttab
 
"" Advanced
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" set number relativenumber  "Relativt linjenummer til nåværende

"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

cnoremap W w

noremap << >>
noremap >> <<

syntax on

"autocmd! FileType java call CSyntaxAfter()

"highlight LineNr ctermfg=grey
"colorscheme slate

nnoremap Q <Nop>

set laststatus=2

if has('nvim')
   tnoremap <Esc> <C-\><C-n>
endif
" inoremap <C-s>p <Esc>xxiSystem.out.println();<Esc>V=f(a
" inoremap <C-s>f <Esc>xxiSystem.out.printf();<Esc>V=f(a
" inoremap /< <Esc>byei<<Esc>ea></<Esc>pa><Esc>F<i
" inoremap //< <Esc>byei<<Esc>ea></<Esc>pa><Esc>F<i<CR><Esc>O
nnoremap ci< T>dt<i
nnoremap ci> T>dt<i
set guicursor=a:blinkon100

" autocmd VimEnter * DoShowMarks!
" Write the swap file every [updatetime] ms. Showmarks relies on this to
" update marks.
set updatetime=20

"Plasserer cursor etter innliming som default, i stedet for på starten av linja
nnoremap p p==

"Save and run python scripts upon <F5>
imap <F5> <Esc>:w<CR>:!clear;python %<CR>
