accessing
name
	name ifNil: [
		| template |
		template := 'gtguix.XXXXXXXXXX'.
		extension ifNotNil: [ template := template, '.', extension ].
		name := ((GxChannels current newEnvironment
		addPackageOutput: 'coreutils';
		command: 'mktemp' arguments: { '--tmpdir'. template })
			runAndWait;
			stdout)
				trim ].
	^ name