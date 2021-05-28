executing
gcRootArguments
	^ self isPersistent
		ifTrue: [ { '-r'. self gxRootSymlink fullName } ]
		ifFalse: [ #() ].