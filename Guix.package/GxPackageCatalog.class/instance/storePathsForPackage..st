accessing
storePathsForPackage: aString
	^ guix runReplCommandAndParse: '(store-paths "', aString, '")'.