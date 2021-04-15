initialization
initialize
	packageOutputs := SortedCollection new.
	packageOutputs sortBlock: [ :a :b |
		| nameA nameB |
		nameA := a package name.
		nameB := b package name.
		(nameA <= nameB) or: [ nameA = nameB and: [ a output <= b output ] ] ]