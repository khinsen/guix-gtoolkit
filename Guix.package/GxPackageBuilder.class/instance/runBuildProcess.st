operating
runBuildProcess
	process := OSSUnixSubprocess new
		command: GxGuix guixCommand;
		arguments: { 'build'. specification };
		"Setting one dummy environment variable in order to get rid
		of the default ones."
		environmentAt: 'GxGuix' put: 'true';
		redirectStdout;
		redirectStderr.
	process
		run;
		waitForExitPollingEvery: (Delay forMilliseconds: 1000)
			doing: [ :aProcess :stdoutStream :stderrStream |
				storePaths := storePaths, stdoutStream upToEnd.
				buildLog := buildLog, stderrStream upToEnd ];
		closeAndCleanStreams.
	process isSuccess
		ifFalse: [ self error: process exitStatusInterpreter printString ].