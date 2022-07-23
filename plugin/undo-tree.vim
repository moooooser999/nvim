"UndoTree
if has("persistent_undo")
   let target_path = expand('~/.vim/.undo_history')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p")
    endif

    let &undodir=target_path
    set undofile
endif
