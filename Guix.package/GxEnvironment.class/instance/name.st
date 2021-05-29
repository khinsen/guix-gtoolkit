accessing
name
	^ directory
		ifNil: [ '+' join: (packageOutputs collect: #name) ]
		ifNotNil: [ directory basename ].