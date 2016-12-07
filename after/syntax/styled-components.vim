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
  \ extend
  \ contains = cssAnimation,cssAnimationAttr,cssAnimationProp,
  \            cssAttr,cssAttrComma,cssAttrRegion,cssAttributeSelector,
  \            cssAuralAttr,cssAuralProp,cssBackgroundAttr,cssBackgroundProp,
  \            cssBorderAttr,cssBorderProp,cssBoxAttr,cssBoxProp,cssBraces,
  \            cssClassName,cssClassNameDot,cssColor,cssColorProp,cssComma,
  \            cssComment,cssCommonAttr,cssContentForPagedMediaAttr,
  \            cssContentForPagedMediaProp,cssDefinition,cssDeprecated,
  \            cssDimensionAttr,cssDimensionProp,cssError,cssFlexibleBoxAttr,
  \            cssFlexibleBoxProp,cssFontAttr,cssFontDescriptor,
  \            cssFontDescriptorAttr,cssFontDescriptorBlock,
  \            cssFontDescriptorFunction,cssFontDescriptorProp,cssFontProp,
  \            cssFunction,cssFunctionComma,cssFunctionName,
  \            cssGeneratedContentAttr,cssGeneratedContentProp,cssGradientAttr,
  \            cssGridAttr,cssGridProp,cssHacks,cssHyerlinkAttr,
  \            cssHyerlinkProp,cssIEUIAttr,cssIEUIProp,cssIdentifier,
  \            cssImportant,cssInclude,cssIncludeKeyword,cssKeyFrame,
  \            cssKeyFrameSelector,cssKeyFrameWrap,cssLineboxAttr,
  \            cssLineboxProp,cssListAttr,cssListProp,cssMarginAttr,
  \            cssMarqueeAttr,cssMarqueeProp,cssMedia,cssMediaAttr,
  \            cssMediaBlock,cssMediaComma,cssMediaKeyword,cssMediaProp,
  \            cssMediaType,cssMobileTextProp,cssMultiColumnAttr,
  \            cssMultiColumnProp,cssNoise,cssPaddingAttr,cssPage,
  \            cssPageMargin,cssPageProp,cssPagePseudo,cssPageWrap,
  \            cssPagedMediaAttr,cssPagedMediaProp,cssPositioningAttr,
  \            cssPositioningProp,cssPrintAttr,cssPrintProp,cssProp,
  \            cssPseudoClass,cssPseudoClassFn,cssPseudoClassId,
  \            cssPseudoClassLang,cssRenderAttr,cssRenderProp,cssRubyAttr,
  \            cssRubyProp,cssSelectorOp,cssSelectorOp2,cssSpecialCharQ,
  \            cssSpecialCharQQ,cssSpeechAttr,cssSpeechProp,cssStringQ,
  \            cssStringQQ,cssTableAttr,cssTableProp,cssTagName,cssTextAttr,
  \            cssTextProp,cssTransformAttr,cssTransformProp,cssTransitionAttr,
  \            cssTransitionProp,cssUIAttr,cssUIProp,cssURL,cssUnicodeEscape,
  \            cssUnicodeRange,cssUnitDecorators,cssValueAngle,
  \            cssValueFrequency,cssValueInteger,cssValueLength,cssValueNumber,
  \            cssValueTime,cssVendor


let b:current_syntax = "javascript"
if main_syntax == "styled-components"
  unlet main_syntax
endif
