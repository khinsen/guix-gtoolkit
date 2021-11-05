accessing
executeCommand: anArray
	| process |
	process := self newGuixProcessWithArguments: anArray.
	^ process output stdout