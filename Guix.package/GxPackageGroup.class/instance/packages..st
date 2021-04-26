accessing
packages: aCollection
	packages := aCollection.
	visiblePackages := packages reject: [ :each | each isHidden or: [ each isDeprecated ] ]