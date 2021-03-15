testing
isIncomplete
	name isString ifFalse: [ ^ true ].
	version isString ifFalse: [ ^ true ].
	synopsis isString ifFalse: [ ^ true ].
	description isString ifFalse: [ ^ true ].
	(homePage isString or: [ homePage isNil ])
		ifFalse: [ ^ true ].
	outputs isSequenceable ifFalse: [ ^ true ].
	outputs size < 1 ifTrue: [ ^ true ].
	licenses isSequenceable ifFalse: [ ^ true ].
	licenses size < 1 ifTrue: [ ^ true ].
	^ false