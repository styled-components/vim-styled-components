" Vim detect file
" Language:   styled-components (JavaScript)
" Maintainer: Karl Fleischmann <fleischmann.karl@gmail.com>
" URL:        https://github.com/fleischie/vim-styled-components

function! s:SelectStyledComponent()
  " find import line matching styled-components
  let import_line = search("import.*from.*styled-components")

  " if there is such a line in the document
  if import_line > 0
    " set the filetype accordingly
    set filetype=styled-components
  endif
endfunction

autocmd BufNewFile,BufRead *.js  call s:SelectStyledComponent()
autocmd BufNewFile,BufRead *.jsx call s:SelectStyledComponent()
