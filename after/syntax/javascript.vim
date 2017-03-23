" Vim syntax file
" Language:   styled-components (js/ts)
" Maintainer: Karl Fleischmann <fleischmann.karl@gmail.com>
" URL:        https://github.com/fleischie/vim-styled-components

if exists("b:current_syntax")
  let s:current_syntax=b:current_syntax
  unlet b:current_syntax
endif

" extend javascript syntax
syntax include @CSS syntax/css.vim
syntax cluster CSS
      \ contains=cssAnimation,cssAnimationAttr,cssAnimationProp,cssAttr,
      \          cssAttrComma,cssAttributeSelector,cssAuralAttr,
      \          cssAuralProp,cssBackgroundAttr,cssBackgroundProp,
      \          cssBorderAttr,cssBorderProp,cssBoxAttr,cssBoxProp,cssBraces,
      \          cssClassName,cssClassNameDot,cssColor,cssColorProp,cssComma,
      \          cssComment,cssCommonAttr,cssContentForPagedMediaAttr,
      \          cssContentForPagedMediaProp,cssDefinition,cssDeprecated,
      \          cssDimensionAttr,cssDimensionProp,cssError,cssFlexibleBoxAttr,
      \          cssFlexibleBoxProp,cssFontAttr,cssFontDescriptor,
      \          cssFontDescriptorAttr,cssFontDescriptorBlock,
      \          cssFontDescriptorFunction,cssFontDescriptorProp,cssFontProp,
      \          cssFunction,cssFunctionComma,cssFunctionName,
      \          cssGeneratedContentAttr,cssGeneratedContentProp,
      \          cssGradientAttr,cssGridAttr,cssGridProp,cssHacks,
      \          cssHyerlinkAttr,cssHyerlinkProp,cssIEUIAttr,cssIEUIProp,
      \          cssIdentifier,cssImportant,cssInclude,cssIncludeKeyword,
      \          cssKeyFrame,cssKeyFrameSelector,cssKeyFrameWrap,
      \          cssLineboxAttr,cssLineboxProp,cssListAttr,cssListProp,
      \          cssMarginAttr,cssMarqueeAttr,cssMarqueeProp,cssMedia,
      \          cssMediaAttr,cssMediaBlock,cssMediaComma,cssMediaKeyword,
      \          cssMediaProp,cssMediaType,cssMobileTextProp,
      \          cssMultiColumnAttr,cssMultiColumnProp,cssNoise,cssPaddingAttr,
      \          cssPage,cssPageMargin,cssPageProp,cssPagePseudo,cssPageWrap,
      \          cssPagedMediaAttr,cssPagedMediaProp,cssPositioningAttr,
      \          cssPositioningProp,cssPrintAttr,cssPrintProp,cssProp,
      \          cssPseudoClass,cssPseudoClassFn,cssPseudoClassId,
      \          cssPseudoClassLang,cssRenderAttr,cssRenderProp,cssRubyAttr,
      \          cssRubyProp,cssSelectorOp,cssSelectorOp2,cssSpecialCharQ,
      \          cssSpecialCharQQ,cssSpeechAttr,cssSpeechProp,cssStringQ,
      \          cssStringQQ,cssTableAttr,cssTableProp,cssTagName,cssTextAttr,
      \          cssTextProp,cssTransformAttr,cssTransformProp,
      \          cssTransitionAttr,cssTransitionProp,cssUIAttr,cssUIProp,
      \          cssURL,cssUnicodeEscape,cssUnicodeRange,cssUnitDecorators,
      \          cssValueAngle,cssValueFrequency,cssValueInteger,
      \          cssValueLength,cssValueNumber,cssValueTime,cssVendor

if exists("s:current_syntax")
  let b:current_syntax=s:current_syntax
endif


" find import line matching styled-components
let import_line = search("import.*from.*styled-components")
let require_line = search("require.*styled-components")

" if there is such a line in the document
if import_line > 0 || require_line > 0
  " fix incorrect padding and border issues
  syn match cssBoxProp contained "\<padding\(-\(top\|right\|bottom\|left\)\)\=\>"
  syn match cssBorderProp contained "\<border\(-\(top\|right\|bottom\|left\)\)\=\(-\(width\|color\|style\)\)\=\>"
  syn match cssBorderProp contained "\<border\(-\(top\|bottom\)-\(left\|right\)\)\=-radius\>"
  syn match cssBorderProp contained "\<border-image\(-\(outset\|repeat\|slice\|source\|width\)\)\=\>"
  syn match cssBorderProp contained "\<box-decoration-break\>"
  syn match cssBorderProp contained "\<box-shadow\>"

  " allow additional CSS in cssDefinitions
  syn region cssDefinition matchgroup=cssBraces start=+{+ end=+}+
        \ contained transparent fold contains=@CSS

  " extend jsTemplateString syntax
  syntax region jsTemplateString start=+`+ skip=+\\\(`\|$\)+ end=+`+
        \ extend transparent fold contains=@CSS
endif
