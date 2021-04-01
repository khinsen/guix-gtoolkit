operating
runBuildProcess
	status := #running.
	process := (guix newGuixProcessWithArguments:
					{ 'build'. package specification }).
	process
		redirectStdout;
		redirectStderr;
		run;
		waitForExitPollingEvery: (Delay forMilliseconds: 1000)
			doing: [ :aProcess :stdoutStream :stderrStream |
				storePaths := storePaths, stdoutStream upToEnd.
				buildLog := buildLog, stderrStream upToEnd ];
		closeAndCleanStreams.
	process isSuccess
		ifFalse: [ self error: process exitStatusInterpreter printString ].
	GxGuix announcer announce: (GxPackageBuilt for: package).
	status := #finished.