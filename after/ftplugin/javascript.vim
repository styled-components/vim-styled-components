" Vim filetype plugin file
" Language:   styled-components (js/ts)
" Maintainer: Karl Fleischmann <fleischmann.karl@gmail.com>
" URL:        https://github.com/styled-components/vim-styled-components

fu! s:GetSyntaxNames(lnum, cnum)
  return map(synstack(a:lnum, a:cnum), 'synIDattr(v:val, "name")')
endfu

" re-implement SynSOL of vim-jsx
fu! s:SynSOL(lnum)
  return s:GetSyntaxNames(a:lnum, 1)
endfu

"" Return whether the current line is a jsTemplateString
fu! IsStyledDefinition(lnum)
  " iterate through all syntax items in the given line
  for item in s:SynSOL(a:lnum)
    " if syntax-item is a jsTemplateString return 1 - true
    " `==#` is a match case comparison of the item
    if item ==# 'styledDefinition'
      return 1
    endif
  endfor

  " fallback to 0 - false
  return 0
endfu

if exists('&ofu')
  if &ofu
    " Do not keep track of previous omnifunc if it was not set in the first
    " place
    let b:prevofu=&ofu
  endif
  setl omnifunc=styledcomplete#CompleteSC
endif
