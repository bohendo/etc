"show line numbers by default"
set number

"no more \r in this house"
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

"use 4 spaces instead of tabs"
set tabstop=2
set shiftwidth=2
set expandtab

"turn on syntax highlighting"
syntax on

"configure spell-check"
set spelllang=en
set spellfile=$HOME/etc/en.utf-8.add
autocmd FileType markdown setlocal spell

"Install Pathogen with:
"mkdir -p ~/.vim/autoload ~/.vim/bundle
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()

"Use eslint to check javascript files
let g:syntastic_javascript_checkers=['eslint']
"Do not lint on :w
autocmd VimEnter * SyntasticToggleMode
"Lint shortcut
command Lint SyntasticCheck

