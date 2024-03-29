
"don't clutter the current dir with backup files"
"WARNING you need to create ~/.vimtmp manually first"
set backupdir=$HOME/.config/nvim/tmp

"Setup persistent undo
set undodir=$HOME/.config/nvim/undo
set undofile

"configure spell-check"
set spelllang=en
set spellfile=$HOME/Obsidian/en.utf-8.add
autocmd FileType markdown setlocal spell
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

"Install Pathogen with:
"mkdir -p ~/.vim/autoload ~/.vim/bundle
"curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"execute pathogen#infect()

"treat [jt]sx files similarly to [jt]s
autocmd BufNewFile,BufRead *.jsx setlocal filetype=javascript
autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript
"autocmd BufNewFile,BufRead *.sol setlocal filetype=solidity
"autocmd BufNewFile,BufRead *.py setlocal filetype=python
"autocmd BufNewFile,BufRead *.sh setlocal filetype=sh
autocmd BufRead,BufNewFile *[Dd]ockerfile setfiletype dockerfile

"Use eslint to check javascript & typescript files
let g:syntastic_sh_checkers=['shellcheck']
"let g:syntastic_sh_shellcheck_exec=['shellcheck']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exec='node_modules/.bin/eslint'
let g:syntastic_typescript_checkers=['eslint']
let g:syntastic_typescript_eslint_exec='node_modules/.bin/eslint'
let g:syntastic_typescriptreact_checkers=['eslint']
let g:syntastic_typescriptreact_eslint_exec='node_modules/.bin/eslint'
let g:syntastic_python_checkers=['pylint']
let g:syntastic_solidity_checkers=['solhint']

"Lint shortcut
command LR SyntasticReset
command LT SyntasticToggleMode
command L SyntasticCheck

"Do not lint on :w
"autocmd VimEnter * SyntasticToggleMode

"use n spaces instead of tabs"
set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType solidity setlocal shiftwidth=4 softtabstop=4

"enable scrolling with mouse"
set mouse=a

"Fold code
set foldmethod=manual

"show line & column numbers by default"
set number
set relativenumber
set ruler

augroup linenumbers
  autocmd!
  autocmd BufEnter *    :set relativenumber
  autocmd BufLeave *    :set number norelativenumber
  autocmd WinEnter *    :set relativenumber
  autocmd WinLeave *    :set number norelativenumber
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd FocusLost *   :set number norelativenumber
  autocmd FocusGained * :set relativenumber
augroup END

"no more \r"
set fileformat=unix

"fixes broken backspace"
set backspace=indent,eol,start

"wrap lines on whitespace/punctuation instead of the middle of words"
set nolist wrap linebreak breakat&vim

"display half-lines rather than @@@"
set display+=lastline

"screen will scroll to keep cursor more than n lines from edge"
set scrolloff=3

"turn on syntax highlighting"
syntax on
" Use new regular expression engine
set re=1

"turn on auto indent"
set autoindent
set smartindent

"NERDtree shortcut
map <silent> <C-n> :NERDTreeFocus<CR>
