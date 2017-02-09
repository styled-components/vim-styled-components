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
fu! IsTemplateString(lnum)
  " iterate through all syntax items in the given line
  for item in SynSOL(a:lnum)
    " if syntax-item is a jsTemplateString return 1 - true
    " `==#` is a match case comparison of the item
    if item ==# 'jsTemplateString'
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
"
" The general workflow is the following:
" 1. Indent the jsTemplateString
" 2. Indent the open cssDefinitions
" 3. Un-indent closed cssDefinitions
" 4. Un-indent jsTemplateString, if no CSS definitions are present
"
" TODO: css pseudo definitions (e.g. &::active) aren't correctly classified
"       via the syntax-detection as cssDefinition (but as cssAttrRegion). Thus
"       the indentation for these definitions is not working correctly, yet.
fu! GetStyledIndent()
  let indent = 0

  " indent CSS definitions only if inside a jsTemplateString
  if IsTemplateString(v:lnum)
    " indent one level for the jsTemplateString
    let indent += &sw

    " get occurences of cssDefinition at begining/end of current line
    let startDef = CountOccurencesInSOL(v:lnum, "cssDefinition")
    let endDef = CountOccurencesInEOL(v:lnum, "cssDefinition")

    " indent the number of current cssDefinitions
    let indent += startDef * &sw

    " un-indent one level, if the open cssDefinition is closed by the end of
    " the line
    if startDef > endDef
      let indent -= &sw
    endif

    " un-indent one level, if the jsTemplateString contains no CSS definitions
    if !ContainsCSS(v:lnum)
      let indent -= &sw
    endif
  else
    " indent with the previously stored indentexpr
    " this is either GetJavascriptIndentation or GetJsxIndentation depending
    " on the available plugins
    if len(b:js_ts_indent)
      let indent = eval(b:js_ts_indent)
    else
      " if all else fails indent according to C-syntax
      let indent = cindent(v:lnum)
    endif
  endif

  " return indentation of the current line
  return indent
endfu
