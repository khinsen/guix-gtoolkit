executing
command: aString arguments: anArray
	^ self newCommand
		command: aString;
		arguments: anArray;
		yourself