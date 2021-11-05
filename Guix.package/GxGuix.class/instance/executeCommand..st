operating
executeCommand: anArray
	| process |
	process := self class newGuixProcessWithArguments: anArray.
	^ process output stdout