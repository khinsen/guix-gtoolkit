instance creation
for: anEnvironment at: aPath
	^ self new
		environment: anEnvironment;
		path: aPath;
		yourself