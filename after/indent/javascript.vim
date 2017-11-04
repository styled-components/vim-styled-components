" Vim syntax file
" Language:   styled-components (js/ts)
" Maintainer: Karl Fleischmann <fleischmann.karl@gmail.com>
" URL:        https://github.com/fleischie/vim-styled-components

" store current indentexpr for later
let b:js_ts_indent=&indentexpr

" set indentexpr for this filetype (styled-components)
setlocal indentexpr=GetStyledIndent()

" add the following keys to trigger reindenting, when in insert mode
" - *;    - Indent and insert on press of ';' key.
" - *<:>  - Indent and insert on press of ':' key.
set indentkeys+=*;,*<:>

" re-implement SynSOL of vim-jsx
" TODO: add dependency to the readme and remove duplicate implementation
fu! s:SynSOL(lnum)
  return map(synstack(a:lnum, 1), 'synIDattr(v:val, "name")')
endfu

" re-implement SynEOL of vim-jsx
" TODO: add dependency to the readme and remove duplicate implementation
fu! s:SynEOL(lnum)
  let l:lnum = prevnonblank(a:lnum)
  let l:col = strlen(getline(l:lnum))
  return map(synstack(l:lnum, l:col), 'synIDattr(v:val, "name")')
endfu


"" Return whether the current line is a jsTemplateString
fu! s:IsStyledDefinition(lnum)
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

"" Count occurences of `str` at the beginning of the given `lnum` line
fu! s:CountOccurencesInSOL(lnum, str)
  let l:occurence = 0

  " iterate through all items in the given line
  for item in s:SynSOL(a:lnum)
    " if the syntax-item equals the given str increment the counter
    " `==?` is a case isensitive equal operation
    if item ==? a:str
      let l:occurence += 1
    endif
  endfor

  " return the accumulated count of occurences
  return l:occurence
endfu

"" Count occurences of `str` at the end of the given `lnum` line
fu! s:CountOccurencesInEOL(lnum, str)
  let l:occurence = 0

  " iterate through all items in the given line
  for item in s:SynEOL(a:lnum)
    " if the syntax-item equals the given str increment the counter
    " `==?` is a case insensitive equal operation
    if item == a:str
      let l:occurence += 1
    endif
  endfor

  " return the accumulated count of occurences
  return l:occurence
endfu

"" Get the indentation of the current line
fu! GetStyledIndent()
  if s:IsStyledDefinition(v:lnum)
    " use the currently "active" styledDefinitions and styledNestedRegions
    " as indenting level if the current line is a styled definition
    let l:prev_sD = s:CountOccurencesInSOL(v:lnum, 'styledDefinition')
    let l:prev_sN = s:CountOccurencesInSOL(v:lnum, 'styledNestedRegion')

    let l:prev_indent = l:prev_sD + l:prev_sN

    let l:curr_sD = s:CountOccurencesInEOL(v:lnum, 'styledDefinition')
    let l:curr_sN = s:CountOccurencesInEOL(v:lnum, 'styledNestedRegion')

    let l:curr_indent = l:curr_sD + l:curr_sN

    let l:indent = min([l:prev_indent, l:curr_indent])

    return l:indent * &sw
  else
    " indent with the previously stored indentexpr
    " this is either GetJavascriptIndentation or GetJsxIndentation depending
    " on the available plugins
    if len(b:js_ts_indent)
      return eval(b:js_ts_indent)
    else
      " if all else fails indent according to C-syntax
      return cindent(v:lnum)
    endif
  endif
endfu
