" Custom Configuration
"             _____  Adarsh Shetty
"      /\    / ____| ObliviousParadigm
"     /  \  | (___  
"    / /\ \  \___ \ 
"   / ____ \ ____) |
"  /_/    \_\_____/ 
" 
" Some good references
" YT: DistroTube, Ben Awad
" Medium: https://medium.com/better-programming/setting-up-neovim-for-web-development-in-2020-d800de3efacd
" https://vim-bootstrap.com/

set nocompatible              " be iMproved, required
filetype off                  " required

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
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Themes
" Plugin 'joshdick/onedark.vim'
" Plugin 'papaya.vim' => https://github.com/HenryNewcomer/vim-theme-papaya/blob/master/colors/papaya.vim
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'ayu-theme/ayu-vim'

" Getting snippets
Plugin 'roxma/nvim-completion-manager'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Setting up autocomplete
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-airline/vim-airline-themes'
" Fuzzy File Searching
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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

" Basic preferences
set number relativenumber
" :augroup numbertoggle
" :  autocmd!
" :  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
" :  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" :augroup END
set incsearch
set nohlsearch
" Set backup location for all the files that end with '~'
" tell vim to keep a backup file
set backup
" tell vim where to put its backup files
set backupdir=$HOME/.nvim/tmp
" tell vim where to put swap files
set dir=$HOME/.nvim/tmp
" Changing tab size
set tabstop=4

" Configuring NERDTree git plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Configuring NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automatically close nvim if NERDTree is the only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" Configuring the Integrated Terminal
" Open new split panes to right and below
set splitright
set splitbelow
" Turn terminal to Normal Mode with Escape
tnoremap <Esc> <C-\><C-n>
" Start terminal in Insert Mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" Open terminal with C-n
function! OpenTerminal()
	split term://fish
	resize 10
endfunction
nnoremap <C-n> :call OpenTerminal()<CR>

" Switching between panels
" Use M-hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Switching between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Configuring Fuzzy finder
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit'
	\}

" True color support
"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
"   if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"   let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"   endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"   if (has("termguicolors"))
"     set termguicolors
"   endif
" endif

" IndentLine {{
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

syntax on
set termguicolors
let ayucolor="dark"
colorscheme ayu
" colorscheme molokai
" colorscheme onedark
" colorscheme papaya
" set t_Co=256
" set cursorline
" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'
" lightline
" let g:lightline.colorscheme='onehalfdark' 

if v:progname =~? "evim"
  finish
endif

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

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
