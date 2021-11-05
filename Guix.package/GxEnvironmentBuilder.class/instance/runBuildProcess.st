operating
runBuildProcess
	status := #running.
	process := (guix newGuixProcessWithArguments:
				environment commandLineArguments, #('--search-paths'))
		pipeStdout;
		pipeStderr;
		spawn.
	process asynchronousStdout
		pollStringEvery: 1 second
		do: [ :aString | searchPaths := searchPaths, aString ].
	process asynchronousStderr
		pollStringEvery: 1 second
		do: [ :aString | buildLog := buildLog, aString ].
	process wait isSuccess
		ifFalse: [ self error: process output stdErr ].
	environment path: self path.
	guix announce: (GxEnvironmentBuiltEvent for: environment at: self path).
	status := #finished.