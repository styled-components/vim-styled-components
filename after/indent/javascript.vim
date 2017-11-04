" Vim syntax file
" Language:   styled-components (js/ts)
" Maintainer: Karl Fleischmann <fleischmann.karl@gmail.com>
" URL:        https://github.com/fleischie/vim-styled-components

" store current indentexpr for later
let b:js_ts_indent=&indentexpr

" set indentexpr for this filetype (styled-components)
setlocal indentexpr=GetStyledIndent()


" re-implement SynSOL of vim-jsx
" TODO: add dependency to the readme and remove duplicate implementation
fu! SynSOL(lnum)
  return map(synstack(a:lnum, 1), 'synIDattr(v:val, "name")')
endfu

" re-implement SynEOL of vim-jsx
" TODO: add dependency to the readme and remove duplicate implementation
fu! SynEOL(lnum)
  let lnum = prevnonblank(a:lnum)
  let col = strlen(getline(lnum))
  return map(synstack(lnum, col), 'synIDattr(v:val, "name")')
endfu


"" Return whether the current line is a jsTemplateString
fu! IsStyledDefinition(lnum)
  " iterate through all syntax items in the given line
  for item in SynSOL(a:lnum)
    " if syntax-item is a jsTemplateString return 1 - true
    " `==#` is a match case comparison of the item
    if item ==# 'styledDefinition'
      return 1
    endif
  endfor

  " fallback to 0 - false
  return 0
endfu

"" Return whether the current line contains a css-element
fu! ContainsCSS(lnum)
  " iterate through all syntax items in the given line
  for item in SynEOL(a:lnum)
    " if syntax-item starts with a css item return 1 - true
    if item =~ '^css'
      return 1
    endif
  endfor

  " fallback to 0 - false
  return 0
endfu

"" Count occurences of `str` at the beginning of the given `lnum` line
fu! CountOccurencesInSOL(lnum, str)
  let occurence = 0

  " iterate through all items in the given line
  for item in SynSOL(a:lnum)
    " if the syntax-item equals the given str increment the counter
    " `==?` is a case isensitive equal operation
    if item ==? a:str
      let occurence += 1
    endif
  endfor

  " return the accumulated count of occurences
  return occurence
endfu

"" Count occurences of `str` at the end of the given `lnum` line
fu! CountOccurencesInEOL(lnum, str)
  let occurence = 0

  " iterate through all items in the given line
  for item in SynEOL(a:lnum)
    " if the syntax-item equals the given str increment the counter
    " `==?` is a case insensitive equal operation
    if item == a:str
      let occurence += 1
    endif
  endfor

  " return the accumulated count of occurences
  return occurence
endfu


"" Get the indentation of the current line
fu! GetStyledIndent()
  if IsStyledDefinition(v:lnum)
    " use the currently "active" styledDefinitions and styledNestedRegions
    " as indenting level if the current line is a styled definition
    let prev_sD = CountOccurencesInSOL(v:lnum, 'styledDefinition')
    let prev_sN = CountOccurencesInSOL(v:lnum, 'styledNestedRegion')

    let prev_indent = prev_sD + prev_sN

    let curr_sD = CountOccurencesInEOL(v:lnum, 'styledDefinition')
    let curr_sN = CountOccurencesInEOL(v:lnum, 'styledNestedRegion')

    let curr_indent = curr_sD + curr_sN

    let indent = min([prev_indent, curr_indent])

    return indent * &sw
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
