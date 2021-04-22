executing
newSubprocess
	^ GxSubprocess new
		gxArgumentPrefix: (self commandLineArguments copyWith: '--');
		yourself