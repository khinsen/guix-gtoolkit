executing
newCommand
	^ GxCommand new
		gxEnvironment: self;
		gxArgumentPrefix: (self commandLineArguments copyWith: '--');
		yourself