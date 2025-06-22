; C queries

(identifier) @variable

((identifier) @constant
  (#match? @constant "^[A-Z][A-Z\\d_]*$"))

[
  "break"
  "case"
  "const"
  "continue"
  "default"
  "do"
  "else"
  "enum"
  "extern"
  "for"
  "if"
  "inline"
  "return"
  "sizeof"
  "static"
  "struct"
  "switch"
  "typedef"
  "union"
  "volatile"
  "while"

  "#define"
  "#elif"
  "#else"
  "#endif"
  "#if"
  "#ifdef"
  "#ifndef"
  "#include"
  (preproc_directive)
] @keyword

[
  "--"
  "-"
  "-="
  "->"
  "="
  "!="
  "*"
  "&"
  "&&"
  "+"
  "++"
  "+="
  "<"
  "=="
  ">"
  "||"
] @operator


[
  "."
  ";"
] @delimiter

(string_literal) @string
(system_lib_string) @string

(null) @constant

[
  (number_literal)
  (char_literal)
] @number


(field_identifier) @property
(statement_identifier) @label

[
  (type_identifier)
  (sized_type_specifier)
] @type

(primitive_type) @type.builtin

(call_expression
  function: (identifier) @function)
(call_expression
  function: (field_expression
    field: (field_identifier) @function))
(function_declarator
  declarator: (identifier) @function)
(preproc_function_def
  name: (identifier) @function.special)

(comment) @comment

; Cpp queries

; Functions

(call_expression
  function: (qualified_identifier
    name: (identifier) @function))

(template_function
  name: (identifier) @function)

(template_method
  name: (field_identifier) @function)

(template_function
  name: (identifier) @function)

(function_declarator
  declarator: (qualified_identifier
    name: (identifier) @function))

(function_declarator
  declarator: (field_identifier) @function)

; Types

((namespace_identifier) @type
 (#match? @type "^[A-Z]"))

(auto) @type.builtin

; Constants

(this) @variable.builtin
(null "nullptr" @constant)

; Modules
; (module_name
;   (identifier) @module)

; Keywords

[
 "catch"
 "class"
 "co_await"
 "co_return"
 "co_yield"
 "constexpr"
 "constinit"
 "consteval"
 "delete"
 "explicit"
 "final"
 "friend"
 "mutable"
 "namespace"
 "noexcept"
 "new"
 "override"
 "private"
 "protected"
 "public"
 "template"
 "throw"
 "try"
 "typename"
 "using"
 "concept"
 "requires"
 "virtual"
 ; "import"
 ; "export"
 ; "module"
] @keyword

; Strings

(raw_string_literal) @string

; Arduino grammar specific queries

((identifier) @function.builtin
  (#any-of? @function.builtin
    ; Digital I/O
    "digitalRead" "digitalWrite" "pinMode"
    ; Analog I/O
    "analogRead" "analogReference" "analogWrite"
    ; Zero, Due & MKR Family
    "analogReadResolution" "analogWriteResolution"
    ; Advanced I/O
    "noTone" "pulseIn" "pulseInLong" "shiftIn" "shiftOut" "tone"
    ; Time
    "delay" "delayMicroseconds" "micros" "millis"
    ; Math
    "abs" "constrain" "map" "max" "min" "pow" "sq" "sqrt"
    ; Trigonometry
    "cos" "sin" "tan"
    ; Characters
    "isAlpha" "isAlphaNumeric" "isAscii" "isControl" "isDigit" "isGraph" "isHexadecimalDigit"
    "isLowerCase" "isPrintable" "isPunct" "isSpace" "isUpperCase" "isWhitespace"
    ; Random Numbers
    "random" "randomSeed"
    ; Bits and Bytes
    "bit" "bitClear" "bitRead" "bitSet" "bitWrite" "highByte" "lowByte"
    ; External Interrupts
    "attachInterrupt" "detachInterrupt"
    ; Interrupts
    "interrupts" "noInterrupts"))

((identifier) @type.builtin
  (#any-of? @type.builtin "Serial" "SPI" "Stream" "Wire" "Keyboard" "Mouse" "String"))

((identifier) @constant.builtin
  (#any-of? @constant.builtin "HIGH" "LOW" "INPUT" "OUTPUT" "INPUT_PULLUP" "LED_BUILTIN"))

(function_definition
  (function_declarator
    declarator: (identifier) @function.builtin)
  (#any-of? @function.builtin "loop" "setup"))

(call_expression
  function: (identifier) @constructor.builtin
  (#any-of? @constructor.builtin "SPISettings" "String"))

(declaration
  (type_identifier) @type.builtin
  (function_declarator
    declarator: (identifier) @constructor.builtin)
  (#eq? @type.builtin "SPISettings"))

; Additions

[
  (true)
  (false)
] @boolean

[
  "["
  "]"
  "{"
  "}"
  "("
  ")"
] @punctuation.bracket
