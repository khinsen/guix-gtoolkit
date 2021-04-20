packages
packageDataForPackage: aString
	^ self runReplCommandAndParse: '(package-info "', aString, '")'.