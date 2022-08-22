initializing
initialize
	name := ((GxChannels current newEnvironment
		addPackageOutput: 'coreutils';
		command: 'mktemp' arguments: #())
			runAndWait;
			stdout)
				trim