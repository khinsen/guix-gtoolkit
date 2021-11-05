accessing
newGuixProcessWithArguments: anArray
	^ GtExternalProcessBuilder new
		command: self guixCommand;
		args: anArray;
		clearEnv.