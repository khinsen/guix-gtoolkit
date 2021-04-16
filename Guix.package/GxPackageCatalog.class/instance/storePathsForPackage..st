accessing
storePathsForPackage: aString
	^ self runReplCommandAndParse: '(store-paths "', aString, '")'.