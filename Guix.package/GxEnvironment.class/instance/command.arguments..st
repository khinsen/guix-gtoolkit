executing
command: aString arguments: anArray
	GxCommand new
		gxEnvironment: self;
		command: aString;
		arguments: anArray;
		yourself