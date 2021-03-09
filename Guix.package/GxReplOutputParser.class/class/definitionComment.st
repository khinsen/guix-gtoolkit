generated
definitionComment
"<whitespace>
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
<firstSymbolChar>
	: [a-zA-Z!$%&*+-\./:<=>?@^_~]
	;
<symbolChar>
	: <firstSymbolChar> | \d
	;
<symbol>
	: <firstSymbolChar> <symbolChar>*
	;
List
	: ""("" Expressions 'exprs' "")"" {exprs}
	;
Expressions
	: { Array new }
	| Expressions 'exprs' Expression 'expr' {exprs copyWith: expr}
	;
Expression 
	: Number 'number' {number}
	| Symbol 'symbol' {symbol}
	| List 'list'
	;
Number
	: <number> 'number' {number value asNumber}
	;
Symbol
	: <symbol> 'symbol' {symbol value asSymbol}
	;"