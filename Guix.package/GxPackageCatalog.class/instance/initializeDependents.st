initialization
initializeDependents
	packages packages do: [ :eachPackage |
		eachPackage directInputs do: [ :eachInput |
			eachInput isPackage ifTrue: [ eachInput addDependent: eachPackage ] ] ]