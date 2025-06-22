[
  (compound_statement)
  (if_statement)
  (switch_statement)
] @indent.begin

(compound_statement
  "}" @indent.end)

(_ "[" "]" @end) @indent
(_ "{" "}" @end) @indent
(_ "(" ")" @end) @indent

[
  (comment)
] @indent.ignore