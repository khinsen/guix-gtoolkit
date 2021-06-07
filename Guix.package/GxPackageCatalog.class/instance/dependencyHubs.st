operating
dependencyHubs
	| nbPackages dependents |
	nbPackages := packages size.
	dependents := packages packages
		collect: [ :each |
			{ each.
			 	each recursiveDependents size.
			 	(100 * each recursiveDependents size) // nbPackages } ]
		thenSelect: [ :each | each second > 0 ].
	dependents sort: [ :a :b | a second >= b second ].
	^ dependents 