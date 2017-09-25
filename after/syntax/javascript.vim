" Vim syntax file
" Language:   styled-components (js/ts)
" Maintainer: Karl Fleischmann <fleischmann.karl@gmail.com>
" URL:        https://github.com/fleischie/vim-styled-components

if exists("b:current_syntax")
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif


" introduce CSS cluster from built-in (or single third party syntax file)
syn include @CSS syntax/css.vim

" try to include CSS3 definitions from multiple files
" this is only possible on vim version above 7
if v:version >= 700
  try
    syn include @CSS3 syntax/css/*.vim
  catch
  endtry
endif

" define custom cssAttrRegion
"   - add ",", "`" and "{" to the end characters
"   - add "cssPseudoClassId" to it's containing elements
"     this will incorrectly highlight pseudo elements incorrectly used as
"     attributes but correctly highlight actual attributes
syn region customCssAttrRegion contained
      \ start=":" end="\ze\%(,\|;\|)\|{\|}\|`\)"
      \ contains=css.*Attr,cssColor,cssImportant,cssValue.*,cssFunction,
      \          cssString.*,cssURL,cssComment,cssUnicodeEscape,cssVendor,
      \          cssError,cssAttrComma,cssNoise,cssPseudoClassId,
      \          jsTemplateExpression
syn region customCssAttrRegion contained
      \ start="transition\s*:" end="\ze\%(;\|)\|{\|}\|`\)"
      \ contains=css.*Prop,css.*Attr,cssColor,cssImportant,cssValue.*,
      \          cssFunction,cssString.*,cssURL,cssComment,cssUnicodeEscape,
      \          cssVendor,cssError,cssAttrComma,cssNoise,cssPseudoClassId,
      \          jsTemplateExpression

" define custom cssKeyFrameSelector
"   - do not declare cssDefinition as nextgroup
syn match customCssKeyFrameSelector "\%(\d*%\|\<from\>\|\<to\>\)" contained
      \ skipwhite skipnl
      \ containedin=styledDefinition

" define all non-contained css definitions
syn cluster CSSTop
      \ contains=cssTagName,cssSelectorOp,cssAttributeSelector,cssClassName,
      \          cssBraces,cssIdentifier,cssInclude,cssPage,cssKeyFrame,
      \          cssInclude,cssFontDescriptor,cssAttrComma,cssPseudoClass,
      \          cssUnicodeEscape

" custom highlights for styled components
"   - "&" inside top level
"   - cssTagName inside of jsStrings inside of styledPrefix regions
"     TODO: override highlighting of cssTagName with more subtle one
syn match  styledAmpersand contained "&"
syn region styledTagNameString matchgroup=jsString contained
      \ start=+'+ end=+'+ skip=+\\\%(\'\|$\)+
      \ contains=cssTagName
syn region styledTagNameString matchgroup=jsString contained
      \ start=+"+ end=+"+ skip=+\\\%(\"\|$\)+
      \ contains=cssTagName
syn region styledTagNameString matchgroup=jsString contained
      \ start=+`+ end=+`+ skip=+\\\%(\`\|$\)+
      \ contains=cssTagName

" define custom API sections that trigger the styledDefinition highlighting
syn match styledPrefix "\<styled\>\.\k\+"
      \ transparent fold
      \ nextgroup=styledDefinition
      \ contains=cssTagName
syn match styledPrefix "\.\<attrs\>\s*(\%(\n\|\s\|.\)\{-})"
      \ transparent fold extend
      \ nextgroup=styledDefinition
      \ contains=jsObject
syn match styledPrefix "\.\<extend\>"
      \ transparent fold
      \ nextgroup=styledDefinition

" emotion css prop
syn match  styledXmlPrefix "\<css\>" transparent contained
      \ containedin=xmlAttrib
      \ nextgroup=styledXmlBraces
syn region styledXmlBraces matchgroup=jsBraces
      \ start="={" end="}"
      \ transparent contained
      \ containedin=xmlEqual
      \ contains=styledDefinition

" extend javascript matches to trigger styledDefinition highlighting
syn match jsTaggedTemplate extend
      \ "\<css\>\|\<keyframes\>\|\<injectGlobal\>\|\<fontFace\>"
      \ nextgroup=styledDefinition
syn match jsFuncCall "\<styled\>\s*(\k\+)"
      \ nextgroup=styledDefinition
syn match jsFuncCall "\<styled\>\s*(\%('\k\+'\|\"\k\+\"\|`\k\+`\))"
      \ contains=styledTagNameString
      \ nextgroup=styledDefinition
syn match jsFuncCall "\.\<withComponent\>\s*(\%('\k\+'\|\"\k\+\"\|`\k\+`\))"
      \ contains=styledTagNameString
syn match jsFuncCall "\<dc\>\s*(\%('\k\+'\|\"\k\+\"\|`\k\+`\))\%((\)\@="
      \ contains=styledTagNameString
      \ nextgroup=styledDefinitionArgument

" inject css highlighting into custom jsTemplateString region
syn region styledDefinition contained transparent fold
      \ start="`" end="`" skip="\\\%(`\|$\)"
      \ contains=@CSSTop,
      \          css.*Prop,cssValue.*,cssColor,cssUrl,cssImportant,cssError,
      \          cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,
      \          cssHacks,
      \          customCssKeyFrameSelector,customCssAttrRegion,
      \          jsComment,
      \          styledAmpersand
syn region styledDefinitionArgument contained transparent start=+(+ end=+)+
      \ contains=styledDefinition

" color the custom highlight elements
hi def link customCssKeyFrameSelector Constant
hi def link styledAmpersand           Special


if exists("s:current_syntax")
  let b:current_syntax=s:current_syntax
endif
