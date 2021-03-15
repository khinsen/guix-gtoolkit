accessing
runReplCommandAndParse: aString
	^ (GxReplOutputParser parse:
		(self runReplCommand: aString)) first