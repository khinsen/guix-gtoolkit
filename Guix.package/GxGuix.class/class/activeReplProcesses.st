REPL
activeReplProcesses
	^ OSSVMProcess vmProcess activeChildren select: [ :each |
		each isRunning and: [ each envVariables includesKey: 'GxGuixPort' ] ]