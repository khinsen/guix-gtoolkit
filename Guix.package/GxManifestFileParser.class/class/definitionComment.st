generated
definitionComment
"<whitespace>
    : \s+
    ;
<leftParenthesis>
	: \(
	;
<rightParenthesis>
	: \)
	;
<quote>
	: '
	;
<character>
	: \\ (. | newline | return | space | tab | space | backspace | formfeed)
	;
<string>
	: \"" ([^""\\] | <character>)* \""
	;
Toplevel
	: <leftParenthesis> ""specifications->manifest""
		<quote><leftParenthesis> PackageOutputs 'outputs' <rightParenthesis>
		<rightParenthesis>
		{outputs}
	;
PackageOutputs
	: { Array new }
	| PackageOutputs 'outputs' PackageOutput 'output' {outputs copyWith: output}
	;
PackageOutput
	: String 'output' {output}
	;
String
	: <string> 'string' {string value allButFirst allButLast}
	;"