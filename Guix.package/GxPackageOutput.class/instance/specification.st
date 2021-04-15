accessing
specification
	^ output = #out
		ifTrue: [ package specification ]
		ifFalse: [ package specification, ':', output ]