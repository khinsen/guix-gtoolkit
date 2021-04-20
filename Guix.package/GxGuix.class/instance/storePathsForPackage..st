packages
storePathsForPackage: aString
	^ self runReplCommandAndParse: '(store-paths "', aString, '")'.