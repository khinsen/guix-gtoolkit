accessing
shortestSpecification
	^ output = #out
		ifTrue: [ package shortestSpecification ]
		ifFalse: [ package shortestSpecification, ':', output ]