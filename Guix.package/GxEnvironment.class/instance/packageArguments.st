accessing
packageArguments
	^ self isPersistent
		ifTrue: [ { '-m'. self manifestFile fullName } ]
		ifFalse: [ #('--ad-hoc'), packageOutputs collect: #specification ].