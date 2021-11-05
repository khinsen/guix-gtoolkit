operating
runBuildProcess
	status := #running.
	process := (guix newGuixProcessWithArguments:
					{ 'build'. package specification })
		pipeStdout;
		pipeStderr;
		spawn.
	process asynchronousStdout
		pollStringEvery: 1 second
		do: [ :aString | storePaths := storePaths, aString ].
	process asynchronousStderr
		pollStringEvery: 1 second
		do: [ :aString | buildLog := buildLog, aString ].
	process wait isSuccess
		ifFalse: [ self error: process output stdErr ].
	guix announce: (GxPackageBuiltEvent for: package).
	status := #finished.