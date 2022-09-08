accessing
executeCommand: anArray
	| process output |
	process := self newGuixProcessWithArguments: anArray.
	output := process output.
	^ { output stdout. output stderr }