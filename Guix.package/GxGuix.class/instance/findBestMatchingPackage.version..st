packages
findBestMatchingPackage: name version: version
	| specification |
	specification := self runReplCommandAndParse:
		'(find-best-matching-package "',
			name, '" ',
			(version
				ifNil: [ '#f' ]
				ifNotNil: [ '"', version, '"']),
				')'.
	specification = false
		ifTrue: [ self error: 'No such package: ', name ].
	^ specification