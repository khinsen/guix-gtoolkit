operating
dependencyHubs
	"Because of many near-duplicate packages resulting from rewrites,
	 hubs are expressed in terms of source objects than packages."
	| dependents sourceDependents |
	sourceDependents := Dictionary new.
	packages packages do: [ :each |
		| nbDependents |
		nbDependents := (each recursiveDependents flatCollect: #source) size.
		each source do: [ :source |
			sourceDependents
				at: source
				put: nbDependents + (sourceDependents at: source ifAbsent: [ 0 ] ) ] ].
	^ sourceDependents associations asOrderedCollection 
		sort: [ :a :b | a value >= b value ]