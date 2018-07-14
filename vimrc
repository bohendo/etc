
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"Install Pathogen with:
"mkdir -p ~/.vim/autoload ~/.vim/bundle
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()

"show line & column numbers by default"
set number
set ruler

"no more \r"
set fileformat=unix

"fixes broken backspace"
set backspace=indent,eol,start

"wrap lines on whitespace/punctuation instead of the middle of words"
set nolist wrap linebreak breakat&vim

"display half-lines rather than @@@"
set display+=lastline

"don't clutter the current dir with backup files"
"WARNING you need to create ~/.vimtmp manually first"
set backupdir=~/.vimtmp

"screen will scroll to keep cursor more than n lines from edge"
set scrolloff=5

"use n spaces instead of tabs"
set tabstop=4
set shiftwidth=4
set expandtab

"turn on syntax highlighting"
syntax on

"configure spell-check"
set spelllang=en
set spellfile=$HOME/etc/en.utf-8.add
autocmd FileType markdown setlocal spell
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

"Anything ending with .Dockerfile is a dockerfile..
autocmd BufRead,BufNewFile *.Dockerfile setfiletype dockerfile

"Setup persistent undo
set undodir=$HOME/.vim/undo
set undofile

"NERDtree shortcut
map <silent> <C-n> :NERDTreeFocus<CR>

"Use eslint to check javascript files
let g:syntastic_javascript_checkers=['eslint']
"Lint shortcut
command Lint SyntasticCheck
"Do not lint on :w
"autocmd VimEnter * SyntasticToggleMode
