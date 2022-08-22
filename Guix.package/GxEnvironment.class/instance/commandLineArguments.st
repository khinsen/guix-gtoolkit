executing
commandLineArguments
	^ self timeMachineArguments, #('shell' '--pure'), self gcRootArguments, self packageArguments