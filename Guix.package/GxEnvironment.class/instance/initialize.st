initialization
initialize
	packageOutputs := SortedCollection new.
	packageOutputs sortBlock: [ :a :b |
		| nameA nameB |
		nameA := a value package name.
		nameB := b value package name.
		(nameA <= nameB) or: [ nameA = nameB and: [ a output <= b output ] ] ]