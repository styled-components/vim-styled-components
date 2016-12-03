" Vim syntax file
" Language:   styled-components (JavaScript)
" Maintainer: Karl Fleischmann <fleischmann.karl@gmail.com>
" URL:        https://github.com/fleischie/vim-styled-components

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif

  let main_syntax = "styled-components"
endif


" extend javascript syntax
runtime! syntax/javascript.vim
syntax include @CSS syntax/css.vim


" extend jsTemplateString syntax
syntax region jsTemplateString
  \ start=+`+
  \ skip=+\\\(`\|$\)+
  \ end=+`+
  \ contains=jsTemplateVar,jsSpecial,css.*Prop,css.*Attr,cssComma,cssColor,cssMedia.*,cssPage.*,cssKeyFrame.*,cssInclude,cssFont.*,cssImportant,cssUrl,cssFunction.*,cssAnimation,cssTagName,cssClassName.*,cssDefinition,cssPseudo.*,cssUnitDecorators,cssNoise,cssComment,cssUnicodeEscape,cssSpecial.*,cssString.*,cssVendor,cssHacks,cssBraces,cssValue.*,cssIdentifier,cssSelector.*,cssError


let b:current_syntax = "javascript"
if main_syntax == "styled-components"
  unlet main_syntax
endif
