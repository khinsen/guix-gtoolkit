REPL
runReplCommand: aString
	| stream result localhost |
	FileStream stdout
		<< 'REPL: '; << aString; lf; flush.
	localhost := SocketAddress fromDottedString: '127.0.0.1'.
	stream := SocketStream openConnectionToHost: localhost port: replProcessPort timeout: 120.
	result := stream upTo: Character lf.
	self assert: result equals: '(repl-version 0 1 1)'.
	stream nextPutAll: aString; cr; flush.
	result := stream upTo: Character lf.
	stream close.
	FileStream stdout
		<< 'RESULT: '; << result; lf; flush.
	(GxReplCommandSignal new
		process: replProcess;
		command: aString;
		result: result;
		yourself) emit.
	^ result	