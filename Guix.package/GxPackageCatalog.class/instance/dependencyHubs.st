analyzing
dependencyHubs
	"Because of many near-duplicate packages resulting from rewrites,
	 hubs are expressed in terms of source objects than packages."
	| sourceDependents |
	sourceDependents := Dictionary new.
	packages packages do: [ :each |
		| deps |
		deps := each recursiveDependents flatCollect: #source.
		each source do: [ :source |
			sourceDependents
				at: source
				put: (deps union:
						(sourceDependents at: source ifAbsent: [ Set new ])) ] ].
	^ sourceDependents associations asOrderedCollection 
		sort: [ :a :b | a value size >= b value size ]