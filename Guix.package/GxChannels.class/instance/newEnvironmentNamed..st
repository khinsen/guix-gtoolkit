environments
newEnvironmentNamed: aString
	| environment |
	environment := GxEnvironment new
						channels: self;
						name: aString.
	GxNamedEnvironments uniqueInstance add: environment.
	^ environment