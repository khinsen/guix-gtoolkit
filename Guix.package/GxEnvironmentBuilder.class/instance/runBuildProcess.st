operating
runBuildProcess
	status := #running.
	process := guix newGuixProcessWithArguments:
				environment commandLineArguments, #('--search-paths').
	process
		redirectStdout;
		redirectStderr;
		run;
		waitForExitPollingEvery: (Delay forMilliseconds: 1000)
			doing: [ :aProcess :stdoutStream :stderrStream |
				searchPaths := searchPaths, stdoutStream upToEnd.
				buildLog := buildLog, stderrStream upToEnd ];
		closeAndCleanStreams.
	process isSuccess
		ifFalse: [ self error: process exitStatusInterpreter printString ].
	environment path: self path.
	guix announce: (GxEnvironmentBuiltEvent for: environment at: self path).
	status := #finished.