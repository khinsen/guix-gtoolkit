accessing
packageArguments
	^ self isPersistent
		ifTrue: [ { '-m'. self manifestFile fullName } ]
		ifFalse: [ packageOutputs collect: #key ].