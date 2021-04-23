env building
inheritEnvironmentAt: aString
	self 
		environmentAt: aString
		put: (self defaultEnvVariablesDictionary at: aString)