" set color scheme
:colo darkblue

syntax on

" Always insert spaces for tabs
set tabstop=4
set shiftwidth=4
set expandtab

" display line numbers by default
set number

set wildmode=longest:list

" Only fold blocks with more than 12 lines
set foldmethod=indent
set foldminlines=12

set visualbell t_vb=

" Keep swap files in one place
if !isdirectory($HOME . "/vim-swap-files")
  :call mkdir($HOME . "/vim-swap-files", "p")
endif
set dir=~/vim-swap-files


" Size window
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=60 columns=170
endif

set nocompatible

map <C-Up> :bn<CR>
map <C-Down> :bp<CR>
map <C-Right> :tabn<CR>
map <C-Left> :tabp<CR>

:au BufRead *.java,*.py,*.rb,*.php,*.js retab
:au BufWrite *.* silent! %s/[\r \t]\+$//


" Run contents of current buffer through xmllint.
"command XmlFormat exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" For autotag plugin that updates tag files on file save
let g:autotagCtagsCmd="/usr/local/bin/ctags"