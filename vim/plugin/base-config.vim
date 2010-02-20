set nocompatible

" set color scheme
colo default

filetype on

syntax on

" Always insert spaces for tabs
set tabstop=4
set shiftwidth=4
set expandtab

" display line numbers by default
set number
set ruler

set wildmode=longest:list

" Only fold blocks with more than 12 lines
set foldmethod=indent
set foldminlines=12

set visualbell t_vb=

nmap <Right> :bn<CR>
nmap <Left> :bp<CR>

" Keep swap files in one place
if !isdirectory($HOME . "/vim-swap-files")
  call mkdir($HOME . "/vim-swap-files", "p")
endif
set dir=~/vim-swap-files


" Size window
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=50 columns=170
  colo desert
endif

" Trial functions for python code checking
command Pyflakes :call Pyflakes()
function! Pyflakes()
    let tmpfile = tempname()
    execute "w" tmpfile
    execute "set makeprg=(pyflakes\\ " . tmpfile . "\\\\\\|sed\\ s@" . tmpfile ."@%@)"
    make
    cw
endfunction

command -nargs=? Py call Python(<args>)
function Python(...)
    let pargs = ""
    if a:0 > 0
        let pargs = a:1
    endif
    echo system('python ' . expand('%', ':p') . ' ' . pargs)
endfunction

set viminfo='100,f0

" leave whitespace alone...
"au BufRead *.java,*.py,*.rb,*.php,*.js retab
"au BufWrite *.* silent! %s/[\r \t]\+$//

" Run contents of current buffer through xmllint.
command XmlFormat exe ":silent %!xmllint --format --recover - 2>/dev/null"
map <Leader>xf :XmlFormat<CR>

command LoadUrl exe ":silent 1!xargs curl 2>/dev/null"
map <Leader>lu :LoadUrl<CR>

" For autotag plugin that updates tag files on file save
let g:autotagCtagsCmd="/usr/local/bin/ctags"
let g:autotagDisabled=0

" For taglist plugin
let Tlist_Ctags_Cmd=g:autotagCtagsCmd
" Display function name in status bar:
let g:ctags_statusline=1
" Automatically start script
let generate_tags=1
" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window=0
" Shorter commands to toggle Taglist display
nnoremap TT :TlistToggle<CR>
map <F4> :TlistToggle<CR>
" Various Taglist diplay config:
let Tlist_Use_Right_Window = 1
let Tlist_Compact_Format = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_File_Fold_Auto_Close = 1

let Tlist_Inc_Winwidth=0

nmap <silent> TP <Plug>ToggleProject
