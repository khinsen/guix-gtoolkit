operating
newEnvironmentNamed: aString
	| environment |
	environment := GxEnvironment new
						guix: self;
						name: aString.
	GxNamedEnvironments uniqueInstance add: environment.
	environment