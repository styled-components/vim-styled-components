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

" TODO: define custom cssAttrRegion to not include cssPseudoClassId
syn region customCssAttrRegion start=":" end="\ze\(,\|;\|)\|{\|}\)" contained
      \ contains=css.*Attr,cssColor,cssImportant,cssValue.*,cssFunction,
      \          cssString.*,cssURL,cssComment,cssUnicodeEscape,cssVendor,
      \          cssError,cssAttrComma,cssNoise
syn region customCssAttrRegion start="transition\s*:" end="\ze\(;\|)\|{\|}\)"
      \ contained
      \ contains=css.*Prop,css.*Attr,cssColor,cssImportant,cssValue.*,
      \          cssFunction,cssString.*,cssURL,cssComment,cssUnicodeEscape,
      \          cssVendor,cssError,cssAttrComma,cssNoise

" define all non-contained css definitions
syn cluster CSSTop
      \ contains=cssTagName,cssSelectorOp,cssAttributeSelector,cssClassName,
      \          cssBraces,cssIdentifier,cssInclude,cssPage,cssKeyFrame,
      \          cssInclude,cssFontDescriptor,cssAttrComma,cssPseudoClass,
      \          cssUnicodeEscape

" TODO: define custom styled definition regions
"       styled-components
"         styled.*` -> `
"         styled.*.attr(*)` -> `
"         *.extend` -> `
"         css` -> `
"         keyframes` -> `
"         injectGlobal` -> `
"       diet-cola:
"         dc(*)(` -> `)
"       emotion:
"         fontFace` -> `
"       see cssFunctionName: one match for `styled.*`, `dc(*)(`, etc.
"                            and one match for the actual ``-block
"                            use nextgroup to say to highlight the inlaying
"                            contents
syn region styledDefinition transparent matchgroup=styledTemplate
      \ start="styled\..\+`"
      \ start="styled\..\+\.attr(\*)`"
      \ start=".\+\.extend`"
      \ start="css`"
      \ start="keyframes`"
      \ start="injectGlobal`"
      \ start="fontFace`"
      \ start="dc(.\+)(`"
      \ end="`" skip="\\\(`\|$\)"
      \ contains=@CSSTop,
      \          css.*Prop,cssValue.*,cssColor,cssUrl,cssImportant,cssError,
      \          cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,
      \          cssHacks,customCssAttrRegion

" TODO: define custom cssAttrRegion
"       all, that does not begin with ":<cssPseudoClassId>"
" TODO: special case for "&" as it is special in styled-components
" TODO: add comments
" TODO: add nesting for styledDefinition



if exists("s:current_syntax")
  let b:current_syntax=s:current_syntax
endif
