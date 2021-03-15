generated
definitionComment
"%glr;
<whitespace>
    : \s+
    ;
<sign>
	: \+|\-
	;
<integer>
	: <sign>? ([1-9][0-9]* | 0)
	;
<number>
	: <integer>
	;
<boolean>
	: \#t | \#f
	;
<firstSymbolChar>
	: [a-zA-Z!$%&*+-\./:<=>?@^_~]
	;
<symbolChar>
	: <firstSymbolChar> | \d
	;
<symbol>
	: <firstSymbolChar> <symbolChar>*
	;
<character>
	: \\ (. | newline | return | space | tab | space | backspace | formfeed)
	;
<string>
	: \"" ([^""\\] | <character>)* \""
	;
Toplevel
	: ""(values"" Values 'values' "")"" {values}
	;
Values
	: { Array new }
	| Values 'values' Value 'value' {values copyWith: value}
	;
Value
	: ""(value"" Expression 'expr' "")"" {expr}
	| ""(non-self-quoting"" Number 'objectID' String 'printed' "")""
		{Dictionary with: #ObjectID -> objectID with: #printString -> printed}
	;
Expressions
	: { Array new }
	| Expressions 'exprs' Expression 'expr' {exprs copyWith: expr}
	;
Expression 
	: Number 'number' {number}
	| Boolean 'bool' {bool}
	| Symbol 'symbol' {symbol}
	| String 'string' {string}
	| Association 'assoc' {assoc}
	| AssociationList 'assocs' {assocs}
	| AssociationVector 'assocs' {assocs}
	| List 'list' {list}
	| Vector 'vector' {vector}
	;
Number
	: <number> 'number' {number value asNumber}
	;
Boolean
	: <boolean> 'bool' {bool value = '#t'}
	;
Symbol
	: <symbol> 'symbol' {symbol value asSymbol}
	;
String
	: <string> 'string' {string value allButFirst allButLast copyReplaceAll: '\n' with: (String with: Character cr)}
	;
Association
	: ""("" Symbol 'symbol' ""."" Expression 'expr' "")"" {symbol -> expr}
	;
AssociationList
	:  ""("" Associations 'assocs' "")"" {assocs}
	;
AssociationVector
	:  ""#("" Associations 'assocs' "")"" {assocs}
	;
Associations
	: Association 'assoc' { Dictionary with: assoc }
	| Associations 'assocs' Association 'assoc' {assocs copyWith: assoc}
	;
List
	: ""("" Expressions 'exprs' "")"" {exprs}
	;
Vector
	: ""#("" Expressions 'exprs' "")"" {exprs}
	;"