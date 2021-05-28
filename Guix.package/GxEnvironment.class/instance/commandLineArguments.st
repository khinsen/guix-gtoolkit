executing
commandLineArguments
	^ self timeMachineArguments, #('environment' '--pure'), self gcRootArguments, self packageArguments