export PATH="$HOME/shutils/scripts:$PATH"
alias globaltags="ctags --file-scope=no -R --exclude='*.git*' --exclude='*.svn*'"
alias maketags="find . -type d \! -regex '\(.*\.git.*\|.*\.svn.*\)' -exec dirtags {} \;"
