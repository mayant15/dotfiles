; Keywords
["newtype" "fn" "enum"] @keyword

; Punctuation
["(" ")" "{" "}" "<" ">"] @punctuation.bracket
["," ";" "=" ":" "->"] @punctuation.delimiter

; Operators / sigils
"!" @keyword.exception
"&" @keyword.modifier
"?" @keyword.modifier
"*" @keyword.modifier
"^" @keyword.modifier
"@" @keyword.modifier
"??" @comment.todo

; Types & names
(newtype name: (identifier) @type.definition)
(enum name: (identifier) @type.definition)
(enum fields: (identifier) @constant)

; (_function_signature name: (identifier) @function)
; (_function_signature typeArg: (identifier) @type.parameter)
;
; (_named_function_argument name: (identifier) @variable.parameter)

(effect (identifier) @attribute)
; (optional (_value_type (identifier) @type))
; (pointer (_value_type (identifier) @type))
; (error_type (_value_type (identifier) @type))

(type (identifier) @type)
(reference (type (identifier) @type))
(function_type args: (type (identifier) @type))
(function_type returns: (type (identifier) @type))

(newtype target: (type (identifier) @type))
