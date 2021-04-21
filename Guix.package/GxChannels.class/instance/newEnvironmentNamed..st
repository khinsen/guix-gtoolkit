environments
newEnvironmentNamed: aString
	| environment |
	environment := GxEnvironment new
						channels: self;
						persistAt: GxGuix environmentDirectory / aString.
	^ environment