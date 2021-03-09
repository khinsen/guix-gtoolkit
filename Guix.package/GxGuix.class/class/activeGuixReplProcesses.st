external processes
activeGuixReplProcesses
	^ OSSVMProcess vmProcess activeChildren select: [ :each |
		each isRunning and: [ each envVariables includesKey: 'GxGuixPort' ] ]