" Vim completion script
" Language:   styled-components (js/ts)
" Maintainer: Karl Fleischmann <fleischmann.karl@gmail.com>
" URL:        https://github.com/styled-components/vim-styled-components

fun! styledcomplete#CompleteSC(findstart, base)
  if IsStyledDefinition(line('.'))
    return csscomplete#CompleteCSS(a:findstart, a:base)
  endif

  return javascriptcomplete#CompleteJS(a:findstart, a:base)
endfun
