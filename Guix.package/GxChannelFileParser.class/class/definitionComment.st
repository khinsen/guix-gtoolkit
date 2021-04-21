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
	: <leftParenthesis> ""list"" Channels 'channels' <rightParenthesis>
		{GxChannels fromChannelList: channels}
	;
Channels
	: { Array new }
	| Channels 'channels' Channel 'channel' {channels copyWith: channel}
	;
Channel
	: <leftParenthesis> ""channel"" Name 'name' Url 'url' Commit 'commit' <rightParenthesis>
		{ GxChannel new name: name; url: url; commit: commit; yourself }
	;
Name
	: <leftParenthesis> ""name"" <quote> Symbol 'symbol' <rightParenthesis> {symbol}
	;
Url
	: <leftParenthesis> ""url"" String 'string' <rightParenthesis> {string}
	;
Commit
	: <leftParenthesis> ""commit"" String 'string' <rightParenthesis> {string}
	;
Symbol
	: <symbol> 'symbol' {symbol value asSymbol}
	;
String
	: <string> 'string' {string value allButFirst allButLast copyReplaceAll: '\n' with: (String with: Character cr)}
	;"