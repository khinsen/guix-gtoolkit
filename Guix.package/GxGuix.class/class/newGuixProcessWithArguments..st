accessing
newGuixProcessWithArguments: anArray
	^ OSSUnixSubprocess new
		command: self guixCommand;
		arguments: anArray;
		"Setting one dummy environment variable in order to get rid
		of the default ones."
		environmentAt: 'GxGuix' put: 'true'.