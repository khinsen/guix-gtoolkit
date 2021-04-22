executing
commandLineArguments
	^ self timeMachineArguments, #('environment' '--pure'), self packageArguments