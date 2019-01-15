scriptencoding utf-8

syn case match

syn keyword juliaTodo contained TODO FIXME NOTE XXX

syn keyword juliaStatement using import return

syn keyword juliaModule
            \ Base
            \ Dates
            \ REPL
            \ Statistics
            \ Test

syn keyword juliaCustomModule
            \ Plots
            \ Distributions
            \ HTTP
            \ GR
            \ JuMP
            \ Temporal
            \ Indicators
            \ Strategems

syn keyword juliaKeyword
            \ true false where
            \ for in while if else elseif end
            \ try catch finally
            \ begin let call block quote macro
            \ const local global module
            \ function type typealias abstract struct mutable bitstype

syn keyword juliaType
            \ Any Type Union Missing Callable Nothing
            \ Number Complex Real
            \ AbstractIrrational Rational Irrational
            \ Integer Bool Signed Unsigned Int BigInt Int16 Int32 Int64 Int8 Int128 UInt128 UInt16 UInt32 UInt64 UInt8
            \ AbstractFloat BigFloat Float16 Float32 Float64
            \ AbstractString AbstractChar String Char Symbol SubString SubstitutionString
            \ AbstractArray AbstractMatrix AbstractVector UndefInitializer
            \ AbstractUnitRange AbstractRange LinRange OrdinalRange StepRangeLen
            \ Array Matrix Vector VecOrMat UnitRange
            \ AbstractDict AbstractSet Dict Set Tuple NTuple NamedTuple Pair
            \ AbstractDateTime AbstractTime AbstractDateToken
            \ Date DateTime Time TimeZone TimeType TimeTypeOrPeriod DateFormat DateFunction DateLocale DatePart
            \ DatePeriod TimePeriod FixedPeriod GeneralPeriod OtherPeriod Instant Locale
            \ Calendar Year Quarter Month Week Day Hour Minute Second Millisecond Microsecond Nanosecond
            \ DayOfWeekToken Mon Monday Tue Tuesday Wed Wednesday Thu Thursday Fri Friday Sat Saturday Sun Sunday
            \ Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dev
            \ January February March April May June July August September October November December


syn keyword juliaCustomType
            \ DataFrame
            \ TS AbstractTS

syn match juliaComment   "#.*$"   contains=juliaTodo
syn match juliaComment   "#=.*=#" contains=juliaTodo
syn match juliaConstant  '\<[A-Z_]\+\>\((\)\@!'
syn match juliaConstant  'nothing'
syn match juliaDelimiter ">\((\|;\)\@="
syn match juliaDelimiter "\(\w\)\@<=<"
syn match juliaDelimiter "\[\|\]\|(\|)\|,\|{\|}\|;"
syn match juliaMacro     "@\(\w\)\+"
syn match juliaNumber    "\<[0-9.]\+\>"
syn match juliaOperator  "+\|-\|*\|\/\(\/\)\@!\|->\|<\|>\|=\||\|&\|!\|:\|?\|::\|%\|\.\.\.\|\.\|<:\|>:\|\^"
syn match juliaSpecial   "[$@]\(\w\)+\|`"
syn match juliaSymbol    "[:<>0-9]\@<!:\(\w\)\+"

syn region juliaString    start=+"+ end=+"+  skip=+\\\\\|\\"+ contains=juliaVariable
syn region juliaCharacter start=+'+ end=+'+  skip=+\\\\\|\\'+ contains=juliaVariable

hi def link juliaCharacter    Character
hi def link juliaComment      Comment
hi def link juliaConstant     Constant
hi def link juliaCustomType   Type
hi def link juliaDelimiter    Delimiter
hi def link juliaKeyword      Special
hi def link juliaMacro        PreProc
hi def link juliaModule       PreProc
hi def link juliaNumber       Number
hi def link juliaOperator     Operator
hi def link juliaCustomModule PreProc
hi def link juliaSpecial      SpecialChar
hi def link juliaStatement    Statement
hi def link juliaString       String
hi def link juliaSymbol       String
hi def link juliaTodo         Todo
hi def link juliaType         Type
hi def link juliaVariable     Identifier

let b:current_syntax = "julia"
