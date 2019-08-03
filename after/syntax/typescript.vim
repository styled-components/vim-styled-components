runtime! syntax/javascript.vim

" define custom API section, that contains typescript annotations
" this is structurally similar to `jsFuncCall`, but allows type
" annotations (delimited by brackets (e.g. "<>")) between `styled` and
" the function call parenthesis
syn match styledTypescriptPrefix
      \ "\<styled\><\%(\[\|\]\|{\|}\||\|&\|:\|;\|,\|?\|'\|\"\|\k\|\s\|\n\)\+>(\%('\k\+'\|\"\k\+\"\|\k\+\))"
      \ transparent fold extend
      \ nextgroup=styledDefinition
      \ contains=cssTagName,
      \          typescriptBraces,typescriptOpSymbols,typescriptEndColons,
      \          typescriptParens,typescriptStringS,@typescriptType,
      \          typescriptType,foldBraces,
      \          styledTagNameString
      \ containedin=foldBraces
syn match styledTypescriptPrefix
      \ "\<styled\>\%((\%('\k\+'\|\"\k\+\"\|\k\+\))\|\.\k\+\)<\%(\[\|\]\|{\|}\||\|&\|:\|;\|,\|?\|'\|\"\|\k\|\s\|\n\)\+>"
      \ transparent fold extend
      \ nextgroup=styledDefinition
      \ contains=cssTagName,
      \          typescriptBraces,typescriptOpSymbols,typescriptEndColons,
      \          typescriptParens,typescriptStringS,@typescriptType,
      \          typescriptType,foldBraces,
      \          styledTagNameString
      \ containedin=foldBraces
syn match styledTypescriptPrefix "\.\<attrs\>\s*(\%(\n\|\s\|.\)\{-})<\%(\[\|\]\|{\|}\||\|&\|:\|;\|,\|?\|'\|\"\|\k\|\s\|\n\)\+>"
      \ transparent fold extend
      \ nextgroup=styledDefinition
      \ contains=cssTagName,
      \          typescriptBraces,typescriptOpSymbols,typescriptEndColons,
      \          typescriptParens,typescriptStringS,@typescriptType,
      \          typescriptType,foldBraces,
      \          styledTagNameString
      \ containedin=foldBraces
syn match styledTypescriptPrefix "\.\<extend\><\%(\[\|\]\|{\|}\||\|&\|:\|;\|,\|?\|'\|\"\|\k\|\s\|\n\)\+>"
      \ transparent fold extend
      \ nextgroup=styledDefinition
      \ contains=cssTagName,
      \          typescriptBraces,typescriptOpSymbols,typescriptEndColons,
      \          typescriptParens,typescriptStringS,@typescriptType,
      \          typescriptType,foldBraces,
      \          styledTagNameString
      \ containedin=foldBraces

syn match jsFuncCall "\<styled\>\s*(\%('\k\+'\|\"\k\+\"\|`\k\+`\))<\%(\[\|\]\|{\|}\||\|&\|:\|;\|,\|?\|'\|\"\|\k\|\s\|\n\)\+>"
      \ transparent fold
      \ contains=typescriptBraces,typescriptOpSymbols,typescriptEndColons,
      \          typescriptParens,typescriptStringS,@typescriptType,
      \          typescriptType,foldBraces,
      \          styledTagNameString
      \ nextgroup=styledDefinition
      \ containedin=foldBraces

syn cluster typescriptValue add=styledPrefix,jsFuncCall,styledTypescriptPrefix

""" yats specific extensions
" extend typescriptIdentifierName to allow styledDefinitions in their
" tagged templates
syn match typescriptIdentifierName extend
      \ "\<css\>\|\<keyframes\>\|\<injectGlobal\>\|\<fontFace\>\|\<createGlobalStyle\>"
      \ nextgroup=styledDefinition
