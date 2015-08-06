if !exists("b:current_syntax")

  syntax region  ppRuleName     start="."  end=":"
  syntax region  ppRule         start=" "  end="$"  contains=ppNamedToken,ppSkippedToken,ppKeptToken,ppNode,ppKeyword
  syntax match   ppNamedToken   "\w\(\)" contained
  syntax region  ppSkippedToken start="::" end="::" contained
  syntax region  ppKeptToken    start="<"  end=">"  contained
  syntax region  ppNode         start="#"  end=" "  contained
  syntax region  ppComment      start="//" end="$"
  syntax region  ppToken        start="%"  end="$"
  syntax match   ppKeyword      "[\|\*\?\+,{}]" contained

  highlight default link ppRuleName     StorageClass
  highlight default link ppNamedToken   Function
  highlight default link ppSkippedToken Constant
  highlight default link ppKeptToken    Constant
  highlight default link ppNode         Identifier
  highlight default link ppComment      Comment
  highlight default link ppToken        Define
  highlight default link ppKeyword      Keyword

  syntax sync clear
  syntax sync fromstart

  let b:current_syntax="pp"

endif

finish

